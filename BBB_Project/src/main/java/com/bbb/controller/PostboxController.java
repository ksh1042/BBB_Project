package com.bbb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public void postboxSearch() throws Exception { }
}
