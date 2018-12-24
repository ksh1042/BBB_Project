package com.bbb.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.ProjectVO;
import com.bbb.service.ProjectService;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	private ProjectService service;
	
	@RequestMapping(value="" ,method=RequestMethod.GET)
	public String memberTurningPoint(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO loginUser = (MemberVO)request.getSession().getAttribute("loginUser");
		
		String url = "redirect:/main/mainForm";
		if(loginUser.getOperatoryn() == 1 ){
			url = "redirect:/admin/mainForm";
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
	
	@RequestMapping("/mainForm")
	public String mainForm() throws Exception{
		return "/main/main";
	}
}
