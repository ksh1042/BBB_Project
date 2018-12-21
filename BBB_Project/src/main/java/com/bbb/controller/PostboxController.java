package com.bbb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/postbox")
public class PostboxController {
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void postboxMain() throws Exception { }
	@RequestMapping(value="/search/{keyword}", method=RequestMethod.GET)
	public void postboxSearch() throws Exception { }
}
