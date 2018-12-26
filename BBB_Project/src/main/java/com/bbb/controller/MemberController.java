package com.bbb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bbb.dto.MemberVO;
import com.bbb.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@RequestMapping("/mypage")
	public String myPageForm(String id, Model model)throws Exception{
		MemberVO member=service.getMemberById(id);
		model.addAttribute("member",member);
		
		return "member/mypage/detail";
	}
	
	
}















