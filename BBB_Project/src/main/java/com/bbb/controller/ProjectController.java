package com.bbb.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectVO;
import com.bbb.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	@RequestMapping(value="/addProject", method=RequestMethod.GET)
	public void addProjectGET() throws Exception {
		
	}
	@RequestMapping(value="/addProject", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> addProject(@RequestBody ProjectVO project, HttpServletRequest request) throws Exception {
		ResponseEntity<String> entity = null;
		
		// MemberVO loginUser = (MemberVO)request.getSession().getAttribute("loginUser");
		
		project.setCreator("ksh1042");
		
		System.out.println(project.toString());
		
		
		try{
			service.addProject(project);
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}catch(SQLException e){
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
}
