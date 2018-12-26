package com.bbb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

<<<<<<< HEAD
=======
import com.bbb.dao.MemberDAO;
>>>>>>> refs/remotes/origin/lee
import com.bbb.dto.MemberVO;
import com.bbb.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService service;

	
	@Autowired
	private MemberDAO memberDAO;
	
	
	// 회원가입을 요청한 사용자에게 회원가입폼을 전송
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public void register()throws Exception{}
	
	// 가입정보를 서버로 전송한 후 화면을 리다이렉트 함
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String register(MemberVO member)throws Exception{
	
		String view="redirect:/main/myPartakeList";
		
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















