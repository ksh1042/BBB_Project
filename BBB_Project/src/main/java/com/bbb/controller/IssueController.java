package com.bbb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dao.IssueDAO;
import com.bbb.dto.IssueVO;
import com.bbb.service.IssueService;

@Controller
@RequestMapping("/project/issue")
public class IssueController {

	@Autowired
	private IssueService service;
	
	@Autowired
	private IssueDAO dao;
	

	@RequestMapping(value="/listIssue", method=RequestMethod.GET)
	public String listIssuePage(SearchCriteria cri, Model model) throws Exception{
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dao.selectSearchIssueListCount(cri));
		List<IssueVO> listIssue = service.getSearchIssueList(cri);
		
		model.addAttribute("listIssue", listIssue);
		model.addAttribute("pageMaker", pageMaker);
		
		return "/project/issue/listPage";
	}
	
}
