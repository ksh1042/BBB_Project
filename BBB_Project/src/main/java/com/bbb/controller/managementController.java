package com.bbb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.ProjectVO;
import com.bbb.service.ManageService;
import com.bbb.service.MemberService;

@Controller
@RequestMapping("manage")
public class managementController {
	
	@Autowired
	private ManageService service;
	
	@Autowired
	private MemberService mservice;
	
	//신청
	@RequestMapping(value="/member",method = RequestMethod.GET)
	public void manageMember(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		ProjectVO logon = (ProjectVO)session.getAttribute("logonProject");
		int pjNum = logon.getPjNum();
		
		List<ProjectPartakeVO> teamMemberList = service.teamMemberList(pjNum);
		List<ProjectPartakeVO> joinList = service.getJoinList(pjNum);
		
	}
}
