package com.bbb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dto.MemberVO;
import com.bbb.service.MemberService;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	private MemberService service;
	
	@RequestMapping(value="" ,method=RequestMethod.GET)
	public String memberTurningPoint(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO loginUser = (MemberVO)request.getSession().getAttribute("loginUser");
		
		String url = "redirect:/main/mainForm";
		if(loginUser.getOperatoryn() == 1 ){
			url = "redirect:/admin/mainForm";
		}
		
		return url;
	}
	
	@RequestMapping("/mainForm")
	public String mainForm() throws Exception{
		return "/main/main";
	}
	
	@RequestMapping(value="/mypage/modify",method=RequestMethod.POST)
	public void myPageModify(String id, Model model)throws Exception{
		
	}
}
