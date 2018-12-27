package com.bbb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/project")
public class UnitworkController {
	
	
	@RequestMapping(value="/{pjNum}/main", method=RequestMethod.GET)
	public void unitworkListGET() throws Exception {
		
	}
}
