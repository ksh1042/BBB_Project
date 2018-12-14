package com.bbb.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/verify")
public class VerifyRestController {
	
	@RequestMapping("/pName")
	public ResponseEntity<String> verifyProjectName() throws Exception {
		ResponseEntity<String> entity = null;
		
		
		
		
		return entity;
	}
}
