package com.bbb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dao.IssueDAO;
import com.bbb.dto.IssueVO;
import com.bbb.dto.ProjectVO;
import com.bbb.service.IssueService;

@Controller
@RequestMapping("/project/issue")
public class IssueController {

	@Autowired
	private IssueService service;
	
	@Autowired
	private IssueDAO dao;
	

	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String listIssuePage(SearchCriteria cri, Model model,HttpServletRequest request) throws Exception{
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		ProjectVO project = (ProjectVO)request.getSession().getAttribute("logonProject");
		pageMaker.setTotalCount(dao.selectSearchIssueListCount(cri,project.getPjNum()));
		List<IssueVO> listIssue = service.getSearchIssueList(cri,project.getPjNum());
		
		model.addAttribute("listIssue", listIssue);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("project",project.getPjNum());
		
		return "/project/issue/listPage";
	}
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String registerIssue()throws Exception{
		return "/project/issue/registerForm";
	}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerIssuePOST(IssueVO issue,HttpSession session)throws Exception{
		
		ProjectVO project = (ProjectVO)session.getAttribute("logonProject");
		issue.setPjNum(project.getPjNum());
		
		service.createIssue(issue);
		
		return "redirect:/project/issue/list";
	}
	
}
