package com.bbb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dto.MemberVO;
import com.bbb.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService service;
	
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public void list(Model model, Criteria cri)throws Exception{
		List<MemberVO> memberList=service.getMemberList(cri);
		model.addAttribute("memberList",memberList);	
	}
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public void register()throws Exception{}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String register(MemberVO member)throws Exception{
	
		String view="redirect:/member/list";
		
		service.register(member);
			
		return view;
	}
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public void detail(String id,Model model)throws Exception{
		MemberVO member = service.getMemberById(id);
		model.addAttribute("member",member);
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public void modify(String id,Model model)throws Exception{
		MemberVO member = service.getMemberById(id);
		model.addAttribute("member",member);
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modify(MemberVO member)throws Exception{
		String view="redirect:/member/list";
		service.modify(member);
		return view;
	}
	
	@RequestMapping(value="/remove",method=RequestMethod.POST)
	public String remove(String id)throws Exception{
		String view="redirect:/member/list";
		service.remove(id);
		return view;
	}
	
	
}















