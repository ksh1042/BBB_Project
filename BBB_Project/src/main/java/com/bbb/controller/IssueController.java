package com.bbb.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbb.dao.IssueDAO;
import com.bbb.dto.IssueDetailVO;
import com.bbb.dto.IssueVO;
import com.bbb.dto.ProjectVO;
import com.bbb.service.IssueDetailService;
import com.bbb.service.IssueService;

@Controller
@RequestMapping("/project/issue")
public class IssueController {

	@Autowired
	private IssueService service;
	
	@Autowired
	private IssueDetailService detailService;
	
	
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
	
	@RequestMapping(value="/myList", method=RequestMethod.GET)
	public String myListIssuePage(SearchCriteria cri, Model model,HttpServletRequest request) throws Exception{
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		ProjectVO project = (ProjectVO)request.getSession().getAttribute("logonProject");
		pageMaker.setTotalCount(dao.selectSearchIssueListCount(cri,project.getPjNum()));
		List<IssueVO> listIssue = service.getSearchIssueList(cri,project.getPjNum());
	
		model.addAttribute("listIssue", listIssue);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("project",project.getPjNum());
		
		return "/project/issue/myListPage";
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
	
	@RequestMapping(value="/readPage",method=RequestMethod.GET)
	public void readIssue(@ModelAttribute("cri")SearchCriteria cri, int iNum, Model model)throws Exception{
		IssueVO issue=service.readIssueByINum(iNum);
		List<IssueDetailVO> issueDetailList =detailService.getIssueDetailList(iNum);
		
		Date date=issue.getIndate();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		
		model.addAttribute("indate",sdf.format(date));
		model.addAttribute("issue",issue);
		model.addAttribute("issueDetailList",issueDetailList);
		
	}
	
	@RequestMapping(value="/modifyPage", method=RequestMethod.GET)
	public void modifyIssue(@ModelAttribute("cri") SearchCriteria cri, @RequestParam(value="iNum", defaultValue="-1") int iNum,Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		if(iNum > 0){
			IssueVO issue = service.readIssueByINum(iNum);
			request.setAttribute("issue", issue);
			request.setAttribute("cri", cri);
			request.getRequestDispatcher("/WEB-INF/views/project/issue/modifyPage.jsp").forward(request, response);
			model.addAttribute(issue);
		}else{
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write("<script>");
			out.write("alert('이슈가 존재하지않습니다.');");
			out.println("history.go(-1);");
			out.write("</script>");
			
		}
	}
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyIssuePOST(IssueVO issue, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		
		service.updateIssue(issue);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addFlashAttribute("msg", "SUCCESS");
			
		return "redirect:list";
	}
	
	@RequestMapping(value = "/close", method = RequestMethod.POST)
	public String modifyIssueClose(IssueVO issue, SearchCriteria cri, RedirectAttributes rttr,int iNum) throws Exception {
		service.updateIssueClose(iNum);
		rttr.addAttribute("iNum",iNum);
		return "redirect:/project/issue/readPage";
	}
	
	@RequestMapping(value = "/open", method = RequestMethod.POST)
	public String modifyIssueOpen(IssueVO issue, SearchCriteria cri, RedirectAttributes rttr,int iNum) throws Exception {
		service.updateIssueOpen(iNum);
		rttr.addAttribute("iNum",iNum);
		return "redirect:/project/issue/readPage";
	}
	
}
