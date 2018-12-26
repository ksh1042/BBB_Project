package com.bbb.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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

import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.ProjectVO;
import com.bbb.service.ProjectService;

@Controller
@RequestMapping("/project")
public class projectController {
	
	@Autowired
	private ProjectService service;
	
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public void test(){
		
	}
	
	@RequestMapping(value="/joinProject", method=RequestMethod.POST)
	public ResponseEntity<String> joinProject(@RequestBody ProjectPartakeVO takeVO){
		
		ResponseEntity<String> entity = null;

		try {
				service.joinProject(takeVO);
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			} catch (Exception e1) {
				e1.printStackTrace();
				entity=new ResponseEntity<String>(e1.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
		return entity;
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
	
	@RequestMapping(value="/projectPlan", method=RequestMethod.GET)
	public void projectPlan(int pjNum, HttpServletRequest request) throws Exception{
		
		
		
	}
	
	@RequestMapping(value="/requirement", method=RequestMethod.GET)
	public void requirementDefinition() throws Exception{
		
	}
	
	
	
		
		
}






















