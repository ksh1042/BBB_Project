package com.bbb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dto.MemberVO;
import com.bbb.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	private HttpSession session;
	public void getSession(HttpSession session){
		this.session = session;
	}

	
	@Autowired
	private ProjectService service;
	
	
	// 로그인 후 나의 프로젝트 참여 목록을 보여준다.
	@RequestMapping(value="/myPartakeList", method=RequestMethod.GET)
	public void partakeList(Model model, HttpServletRequest request) throws Exception{
		
		//로그인 유저의 아이디
		/*MemberVO loginUser = (MemberVO)request.getSession().getAttribute("loginUser");*/
			
		model.addAttribute("myPartakeList",service.readMyProjectList("admin11"));
	}
	
	
	@RequestMapping(value="/partake")
	public void partake() throws Exception {
		
	}
	
	
	
}
