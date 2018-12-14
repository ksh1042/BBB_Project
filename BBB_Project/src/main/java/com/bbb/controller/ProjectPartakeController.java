package com.bbb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dto.ProjectPartakeVO;
import com.bbb.service.ProjectPartakeService;

@Controller
@RequestMapping("/project")
public class ProjectPartakeController {
	
	@Autowired
	private ProjectPartakeService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(Model model) throws Exception{
		List<ProjectPartakeVO> projectList = service.getProjectList();
		model.addAttribute("projectlist", projectList);
	}
	@RequestMapping(value="/addProject")
	public void addProject() throws Exception {
		
	}
	@RequestMapping(value="/partake")
	public void partake() throws Exception {
		
	}
	
	
	
}
