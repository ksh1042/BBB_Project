package com.bbb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dto.ProjectVO;
import com.bbb.service.FinanceService;
import com.bbb.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	private FinanceService financeService;
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	   public void projectMain(int pjNum, HttpServletRequest request) throws Exception{
	      ProjectVO project = projectService.projectMain(pjNum);
	      request.getSession().setAttribute("logonProject", project);
	   }
	
	@RequestMapping(value="/finance", method=RequestMethod.GET)
	public void financeList(Model model, HttpServletRequest request) throws Exception{
		
	}
	
}
