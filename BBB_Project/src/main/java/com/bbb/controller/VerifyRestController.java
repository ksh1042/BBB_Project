package com.bbb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bbb.service.ProjectService;

@RestController
@RequestMapping("/verify")
public class VerifyRestController {
	
	@Autowired
	private ProjectService service;
	
	@RequestMapping(value="/pName/{pName}", method=RequestMethod.GET)
	public ResponseEntity<String> verifyProjectName(@PathVariable String pName) throws Exception {
		ResponseEntity<String> entity = null;
		
		String getName = service.readVerifyProjectName(pName);
		
		if( getName == null || getName.isEmpty() ){
			entity = new ResponseEntity<String>("OK", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("OVERLAPED", HttpStatus.OK);
		}
		
		return entity;
	}
}
