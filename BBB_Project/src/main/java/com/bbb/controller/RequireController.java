package com.bbb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/project")
public class RequireController {
	
	/*@Autowired
	private RequirementService service;*/
	
	@RequestMapping(value="/requirement/create", method=RequestMethod.GET)
	public String createRequire() throws Exception{
		
		return "redirect:project/requirement/list";
	}
	
	@RequestMapping(value="/requirement/list", method=RequestMethod.GET)
	public void requireListGET() throws Exception{
		
	}
	
	@RequestMapping(value="/requirement/list", method=RequestMethod.POST)
	public String requireListPost() throws Exception{
		
		return "project/requirement/ModifyList";
	}
	
}
