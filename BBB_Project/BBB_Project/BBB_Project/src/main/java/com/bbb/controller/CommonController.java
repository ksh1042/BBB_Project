package com.bbb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/commons")
public class CommonController {

	@RequestMapping("/loginForm")
	public String loginForm() throws Exception{
		return "/commons/login";
	}
}
