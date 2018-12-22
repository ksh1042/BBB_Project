package com.bbb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dto.MemberVO;
import com.bbb.dto.PostboxVO;
import com.bbb.service.PostboxService;

@Controller
@RequestMapping("/postbox")
public class PostboxController {
	
	@Autowired
	private PostboxService postboxService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void postboxMain(String id, Model model) throws Exception {
		List<PostboxVO> postList = postboxService.readPostboxList(id);
		//System.out.println(postList);
		model.addAttribute("postList", postList);
	}
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public void postboxSearch(SearchCriteria cri, Model model) throws Exception { 
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		int totalCount = postboxService.readMemberListCount(cri);
		System.out.println("totalCount : " + totalCount);
		
		pageMaker.setTotalCount(totalCount);
		
		List<MemberVO> memberList = postboxService.readMemberList(cri);
		
		System.out.println("memberList : " + memberList);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageMaker", pageMaker);
	}
}
