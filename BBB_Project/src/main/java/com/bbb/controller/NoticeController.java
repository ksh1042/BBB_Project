package com.bbb.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbb.dto.NoticeVO;
import com.bbb.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception{
	
		List<NoticeVO> noticeList = service.listSearch(cri);
		model.addAttribute("noticeList",noticeList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute(pageMaker);
	}
	
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGet()throws Exception{}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(@RequestBody NoticeVO notice, RedirectAttributes rtts) throws Exception{
		
		service.create(notice);
		rtts.addFlashAttribute("msg","SUCCESS");
		return "redirect:/notice/listPage";
	}
	
	@RequestMapping(value="/readPage",method=RequestMethod.GET)
	public void readPage(@ModelAttribute("cri") SearchCriteria cri, int nNum, Model model) throws Exception{
		NoticeVO notice = service.read(nNum);
		model.addAttribute("notice",notice);
	}
	
	@RequestMapping(value="/modifyPage",method=RequestMethod.GET)
	public void modifyPage(@ModelAttribute("cri")SearchCriteria cri, int nNum, Model model) throws Exception{
		NoticeVO notice = service.readByNnum(nNum);
		model.addAttribute("notice",notice);
	}
	
	@RequestMapping(value="/modifyPage",method=RequestMethod.POST)
	public String modifyPagePOST(NoticeVO notice, SearchCriteria cri, RedirectAttributes rttr)throws Exception{
		
		notice.setExpireDate(new Date());
		
		service.modify(notice);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/notice/listPage";
	}
	
	@RequestMapping(value="/removePage",method=RequestMethod.POST)
	public String removcePage(int nNum, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		
		service.remove(nNum);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/notice/listPage";
	}
	
		
	
}
