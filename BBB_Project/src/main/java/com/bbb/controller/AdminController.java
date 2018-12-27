package com.bbb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dao.MemberDAO;
import com.bbb.dto.MemberVO;
import com.bbb.service.MemberService;
import com.bbb.service.ProjectService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@RequestMapping(value="/mainForm",method=RequestMethod.GET)
	public void mainGET()throws Exception{}
	
	@RequestMapping(value="/memberList",method=RequestMethod.GET)
	public void memberList(SearchCriteria cri, Model model)throws Exception{
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberDAO.selectMemberListCount(cri));
		List<MemberVO> memberList=service.getMemberList(cri);
		model.addAttribute("memberList",memberList);	
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/projectList", method=RequestMethod.GET)
	public void projectListGET(SearchCriteria cri, Model model) throws Exception{
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
	}
	
}

