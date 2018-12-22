package com.bbb.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.ProjectVO;
import com.bbb.service.ProjectService;

@Controller
@RequestMapping("/project")
public class projectController {
	
	@Autowired
	private ProjectService service;
	
	@RequestMapping(value="/searchList", method=RequestMethod.GET)
	public void searchList(@ModelAttribute("cri")SearchCriteria cri,Model model,HttpServletRequest request) throws Exception{
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		List<ProjectVO> searchPList = service.searchProjectList(cri);
		List<ProjectPartakeVO> sampleList = service.getBindingProject(id);
		List<ProjectPartakeVO> bindList = new ArrayList<ProjectPartakeVO>();
		boolean copy = false;
		
		
		for(ProjectVO project : searchPList){
			copy = false;
			for(ProjectPartakeVO partake : sampleList){
				if(project.getPjNum() == partake.getPjNum()){
					bindList.add(partake);
					copy =true;
				}
			}
			if(!copy){
				bindList.add(new ProjectPartakeVO(id,project.getPjNum(),2));
			}
		}
		
		
		
		int totalCount = service.searchProjectCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("searchPList",searchPList);
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("loginUser",loginUser);
		model.addAttribute("bindList",bindList);
		
	}
	
	@RequestMapping(value="/joinProject", method=RequestMethod.POST)
	public ResponseEntity<String> joinProject(@RequestBody ProjectPartakeVO takeVO){
		
		ResponseEntity<String> entity = null;
		String id = takeVO.getId();
					
			try {
				service.joinProject(takeVO);
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			} catch (Exception e1) {
				e1.printStackTrace();
				entity=new ResponseEntity<String>(e1.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
		return entity;
	}
	
	//branch lee
	// 로그인 후 나의 프로젝트 참여 목록을 보여준다.
	@RequestMapping(value="/myPartakeList", method=RequestMethod.GET)
	public void partakeList(Model model, HttpServletRequest request) throws Exception{
		
		HttpSession session=request.getSession();
		//로그인 유저의 아이디
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		model.addAttribute("myPartakeList",service.readMyProjectList(loginUser.getId()));
	}
	
	//프로젝트 계획서
	@RequestMapping(value="/projectPlan", method=RequestMethod.GET)
	public String projectPlan() throws Exception{
		return "PDFviewer/viewer.jsp?file=compressed.tracemonkey-pldi-09.pdf";
	}
		
		
}






















