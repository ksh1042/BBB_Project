package com.bbb.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
@RequestMapping("/main")
public class MainController {

	@Autowired
	private ProjectService projectService;
	
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
	
	@RequestMapping(value="/addProject", method=RequestMethod.GET)
	public void addProjectGET() throws Exception {
		
	}
	@RequestMapping(value="/addProject", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> addProject(@RequestBody ProjectVO project, HttpServletRequest request) throws Exception {
		ResponseEntity<String> entity = null;
		
		System.out.println(project.toString());
		
		
		try{
			projectService.addProject(project);
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}catch(SQLException e){
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
}
