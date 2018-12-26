package com.bbb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/project/explorer")
public class ProjectExplorerController {
	
	@RequestMapping(value="/registRepository", method=RequestMethod.GET)
	public void registRepositoryGET() throws Exception {
		
	}
}
