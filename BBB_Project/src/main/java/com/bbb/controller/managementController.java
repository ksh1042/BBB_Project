package com.bbb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.ProjectVO;
import com.bbb.service.ManageService;
import com.bbb.service.MemberService;

@Controller
@RequestMapping("project/manage")
public class managementController {
	
	@Autowired
	private ManageService service;
	
	@Autowired
	private MemberService mservice;
	
	//신청
	@RequestMapping(value="/member",method = RequestMethod.GET)
	public void manageMember(HttpServletRequest request, Model model) throws Exception{
		HttpSession session = request.getSession();
		ProjectVO logon = (ProjectVO)session.getAttribute("logonProject");
		int pjNum = logon.getPjNum();
		String id = logon.getCreator();
		
		List<MemberVO> teamMemberList = service.teamMemberList(pjNum,id);
		
		model.addAttribute("teamMemberList", teamMemberList);
	}
	
	
	@RequestMapping(value="fireMember", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> fireMember(@RequestBody ProjectPartakeVO partake) throws Exception{
		
		ResponseEntity<String> entity = null;
		try{
			service.fireMember(partake);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	//참여신청온 회원관리
	@RequestMapping(value="/joinMember", method=RequestMethod.GET)
	public void fireMemberList(HttpServletRequest request, Model model) throws Exception{
		HttpSession session = request.getSession();
		ProjectVO logon = (ProjectVO)session.getAttribute("logonProject");
		int pjNum = logon.getPjNum();
		
		List<MemberVO> joinList = service.getJoinList(pjNum);
		
		model.addAttribute("joinList", joinList);
	}
	
	//프로젝트 참여 수락
	@RequestMapping(value="applyMember", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> applyMember(@RequestBody ProjectPartakeVO partake) throws Exception{
		
		ResponseEntity<String> entity = null;
		try{
			service.applyMember(partake);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	//프로젝트 참여 거절
	@RequestMapping(value="refuseMember", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> refuseMember(@RequestBody ProjectPartakeVO partake) throws Exception{
		
		ResponseEntity<String> entity = null;
		try{
			service.refuseMember(partake);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
}
