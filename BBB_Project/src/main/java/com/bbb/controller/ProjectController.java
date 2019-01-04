package com.bbb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectVO;
import com.bbb.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public void test(){
		
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
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void projectMain(int pjNum, HttpServletRequest request) throws Exception{
		ProjectVO project = service.projectMain(pjNum);
		request.getSession().setAttribute("logonProject", project);
		System.out.println(project.toString());
	}
	
	
	

	

	
}






















