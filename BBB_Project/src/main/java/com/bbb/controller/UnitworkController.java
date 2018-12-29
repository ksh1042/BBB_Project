package com.bbb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.ProjectVO;
import com.bbb.dto.UnitworkVO;
import com.bbb.service.UnitworkService;

@Controller
@RequestMapping("/project")
public class UnitworkController {
	
	@Autowired
	private UnitworkService unitworkService;
	
	@RequestMapping(value="/unitwork/list", method=RequestMethod.GET)
	public void unitworkListGET(HttpServletRequest request, Model model) throws Exception {
		ProjectVO selectProject = (ProjectVO)request.getSession().getAttribute("logonProject");
		int udNum = selectProject.getUdNum();
		List<UnitworkVO> unitList = unitworkService.readUnitworkList(udNum);
		model.addAttribute("unitList", unitList);
	}
	
	@RequestMapping(value="/unitwork/list", method=RequestMethod.POST)
	public String unitworkListPOST(HttpServletRequest request, Model model) throws Exception {
		ProjectVO selectProject = (ProjectVO)request.getSession().getAttribute("logonProject");
		int udNum = selectProject.getUdNum();
		
		List<UnitworkVO> unitList = unitworkService.readUnitworkList(udNum);
		List<ProjectPartakeVO> partakeList = unitworkService.readBindingMemberList(selectProject.getPjNum());
		
		model.addAttribute("unitList", unitList);
		model.addAttribute("partakeList", partakeList);
		
		return "project/unitwork/ModifyList";
	}
}
