package com.bbb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/project")
public class RequireController {
	
	@RequestMapping(value="/requirement/list", method=RequestMethod.GET)
	public void requireListGET() throws Exception{
		
	}
	
	@RequestMapping(value="/requirement/list", method=RequestMethod.POST)
	public String requireListPost() throws Exception{
		
		return "project/requirement/ModifyList";
	}
	
}
