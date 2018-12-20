package com.bbb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dto.NoticeVO;
import com.bbb.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(Model model) throws Exception{
		
		List<NoticeVO> noticeList = service.getNoticeList();
		
		model.addAttribute("noticeList",noticeList);
	}
	
	
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGet(@ModelAttribute("cri")SearchCriteria cri){}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(SearchCriteria cri, NoticeVO notice) throws Exception{
		String url = "redirect:list";
		
		service.register(notice);
		
		return url;
	}
		
	
}
