package com.bbb.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbb.dto.ProjectVO;
import com.bbb.dto.UnitworkVO;
import com.bbb.service.GanttService;
import com.bbb.service.UnitworkService;

@Controller
@RequestMapping("/project/gantt")
public class GanttController {
	
	@Autowired
	private GanttService ganttService;
	
	@Autowired
	private UnitworkService unitworkService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void ganttListGET(HttpSession session, Model model) throws Exception {
		ProjectVO selectProject = (ProjectVO)session.getAttribute("logonProject");
		
		List<UnitworkVO> unitList = unitworkService.readUnitworkList( selectProject.getUdNum() );
		
		model.addAttribute("unitList", unitList);
	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public String ganttListPOST(HttpSession session, Model model) throws Exception {
		ProjectVO selectProject = (ProjectVO)session.getAttribute("logonProject");
		
		List<UnitworkVO> unitList = unitworkService.readUnitworkList( selectProject.getUdNum() );
		
		model.addAttribute("unitList", unitList);
		return "project/gantt/modify";
	}
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> ganttModifyPOST(HttpSession session) throws Exception {
		ResponseEntity<String> entity = null;
		
		
		return entity;
	}
}
