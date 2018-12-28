package com.bbb.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.ProjectVO;
import com.bbb.service.ProjectService;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	private ProjectService projectService;
	
	@RequestMapping(value="" ,method=RequestMethod.GET)
	public String memberTurningPoint(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO loginUser = (MemberVO)request.getSession().getAttribute("loginUser");
		
		String url = "";
		if(loginUser.getOperatoryn() == 1 ){
			url = "redirect:/admin/mainForm";
		}else{
			url = "redirect:/main/myPartakeList";
		}
		
		return url;
	}
	
	@RequestMapping(value="/searchPList", method=RequestMethod.GET)
	public void searchList(@ModelAttribute("cri")SearchCriteria cri,Model model,HttpServletRequest request) throws Exception{
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		List<ProjectVO> searchPList = projectService.searchProjectList(cri);
		List<ProjectPartakeVO> sampleList = projectService.getBindingProject(id);
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
		
		
		
		int totalCount = projectService.searchProjectCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("searchPList",searchPList);
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("loginUser",loginUser);
		model.addAttribute("bindList",bindList);
		
	}
	
	@RequestMapping(value="/joinProject", method=RequestMethod.POST)
	public ResponseEntity<String> joinProject(@RequestBody ProjectPartakeVO takeVO){
		
		ResponseEntity<String> entity = null;

		try {
				projectService.joinProject(takeVO);
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			} catch (Exception e1) {
				e1.printStackTrace();
				entity=new ResponseEntity<String>(e1.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
		return entity;
	}
	
	@RequestMapping("/mainForm")
	public String mainForm() throws Exception{
		return "/main/main";
	}
	
	// 로그인 후 나의 프로젝트 참여 목록을 보여준다.
	@RequestMapping(value="/myPartakeList", method=RequestMethod.GET)
	public void partakeList(Model model, HttpServletRequest request) throws Exception{
		
		HttpSession session=request.getSession();
		//로그인 유저의 아이디
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		model.addAttribute("myPartakeList",projectService.readMyProjectList(loginUser.getId()));
	}
	
	@RequestMapping(value="/addProject", method=RequestMethod.GET)
	public void addProjectGET() throws Exception {
		
	}
	
	@RequestMapping(value="/addProject", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> addProject(@RequestBody ProjectVO project, HttpServletRequest request) throws Exception {
		ResponseEntity<String> entity = null;
		
		int pjNum = projectService.getSeq();
		ProjectPartakeVO takeVO = new ProjectPartakeVO();
		try{
			project.setPjNum(pjNum);
			projectService.addProject(project);
			takeVO.setPjNum(pjNum);
			takeVO.setId(project.getCreator());
			projectService.addProjectake(takeVO);
						
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}catch(SQLException e){
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return entity;
	}
}
