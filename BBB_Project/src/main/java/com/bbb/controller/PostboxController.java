package com.bbb.controller;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		pageMaker.setTotalCount(totalCount);
		List<MemberVO> memberList = postboxService.readMemberList(cri);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> poseboxWrite(@RequestBody PostboxVO postbox) throws Exception {
		ResponseEntity<String> entity = null;
		System.out.println(postbox);
		try {
			postboxService.createPostbox(postbox);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	/*
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String poseboxWrite(PostboxVO postbox) throws Exception {
		System.out.println(postbox);
		try {
			postboxService.createPostbox(postbox);
			
		}catch(SQLException e) {
			e.printStackTrace();
		
		}
		return "redirect:/postbox/list";
	}
	*/
}
