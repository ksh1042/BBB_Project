package com.bbb.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.ProjectVO;
import com.bbb.service.ManageService;
import com.bbb.service.MemberService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("project/manage")
public class managementController {
	
	@Autowired
	private ManageService service;
	
	@Autowired
	private MemberService mservice;
	
	//신청
	@RequestMapping(value="/member",method = RequestMethod.GET)
	public void manageMember(@ModelAttribute("cri")SearchCriteria cri,HttpServletRequest request, Model model) throws Exception{
		HttpSession session = request.getSession();
		ProjectVO logon = (ProjectVO)session.getAttribute("logonProject");
		int pjNum = logon.getPjNum();
		String id = logon.getCreator();
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.teamMemberCount(pjNum, id, cri));
		
		List<MemberVO> teamMemberList = service.teamMemberList(pjNum,id,cri);
		
		model.addAttribute("teamMemberList", teamMemberList);
		model.addAttribute("pageMaker",pageMaker);
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
	public ResponseEntity<String> applyMember(@RequestBody Map<String,Object> applyList, HttpServletRequest request) throws Exception{
		
		ResponseEntity<String> entity = null;
		HttpSession session = request.getSession();
		ProjectVO project = (ProjectVO)session.getAttribute("logonProject");
		int pjNum = project.getPjNum();
		ObjectMapper mapper = new ObjectMapper();
		List<String> applylist = mapper.convertValue(applyList.get("applyList"), new TypeReference<List<String>>() {});
		
		try{
		for(String applyMember : applylist){
			service.applyMember(applyMember,pjNum);
		}
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
	public ResponseEntity<String> refuseMember(@RequestBody Map<String,Object> applyList,HttpServletRequest request) throws Exception{
		
		ResponseEntity<String> entity = null;
		HttpSession session = request.getSession();
		ProjectVO project = (ProjectVO)session.getAttribute("logonProject");
		int pjNum = project.getPjNum();
		ObjectMapper mapper = new ObjectMapper();
		List<String> applylist = mapper.convertValue(applyList.get("applyList"), new TypeReference<List<String>>() {});
		try{
			for(String applyMember : applylist){
				service.refuseMember(applyMember,pjNum);
			}
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value="inviteMember", method=RequestMethod.GET)
	public void inviteMember(@ModelAttribute SearchCriteria cri,Model model,HttpServletRequest request) throws Exception{
		PageMaker pageMaker = new PageMaker();
		HttpSession session = request.getSession();
		ProjectVO project = (ProjectVO)session.getAttribute("logonProject");
		int pjNum = project.getPjNum();
		
		if(cri.getKeyword() == ""){
			if(cri.getSearchType() == ""){
				List<ProjectPartakeVO> inviteList = new ArrayList<ProjectPartakeVO>();
				model.addAttribute(inviteList);
			}
		}else{
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.getSearchListCount(cri,pjNum));
			List<ProjectPartakeVO> inviteList = service.getSearchList(cri,pjNum);
			model.addAttribute(inviteList);
			model.addAttribute(pageMaker);
		}
		
		
	}
	
}
