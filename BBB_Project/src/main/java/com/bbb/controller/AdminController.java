package com.bbb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbb.dao.MemberDAO;
import com.bbb.dto.MemberVO;
import com.bbb.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@RequestMapping(value="/mainForm",method=RequestMethod.GET)
	public void mainGET()throws Exception{}
	
	@RequestMapping(value="/memberList",method=RequestMethod.GET)
	public void memberList(SearchCriteria cri, Model model)throws Exception{
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberDAO.selectMemberListCount(cri));
		List<MemberVO> memberList=service.getMemberList(cri);
		model.addAttribute("memberList",memberList);	
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public void modifyGET(String id, @ModelAttribute("cri")SearchCriteria cri,Model model)throws Exception{
		MemberVO member = service.getMemberById(id);
		model.addAttribute("member",member);
	}
	
	@RequestMapping(value="/submit",method=RequestMethod.POST)
	public String modifyPost(SearchCriteria cri, String id, MemberVO member, RedirectAttributes rttr) throws Exception{
		
		service.removeEmailyn(id);

		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:memberList";
	}
	@RequestMapping(value="/cancel",method=RequestMethod.POST)
	public String removePost(SearchCriteria cri, String id, MemberVO member, RedirectAttributes rttr) throws Exception{
		
		service.updateAssignEmail(id);

		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:memberList";
	}
	
	@RequestMapping(value="/projectList", method=RequestMethod.GET)
	public void projectListGET(SearchCriteria cri, Model model) throws Exception{
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
	}
	
}

