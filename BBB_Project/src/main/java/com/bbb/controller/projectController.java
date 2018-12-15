package com.bbb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dto.ProjectVO;
import com.bbb.service.ProjectService;

@Controller
@RequestMapping("/project")
public class projectController {
	
	@Autowired
	private ProjectService service;
	
	
	@RequestMapping(value="/searchList", method=RequestMethod.GET)
	public void searchList(@ModelAttribute("cri")SearchCriteria cri,Model model) throws Exception{
		List<ProjectVO> searchPList = service.searchProjectList( cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int totalCount = service.searchProjectCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("searchPList",searchPList);
		model.addAttribute("pageMaker",pageMaker);
	}
}
