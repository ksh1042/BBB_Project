package com.bbb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bbb.dto.IssueDetailVO;
import com.bbb.service.IssueDetailService;

@RestController
@RequestMapping("/project/issueDetail")
public class IssueDetailController {

	@Autowired
	private IssueDetailService service;
	
	@RequestMapping(value="/all/{iNum}",method=RequestMethod.GET)
	public ResponseEntity<List<IssueDetailVO>> IssueDetailList(@PathVariable("iNum")int iNum,Model model)throws Exception{
		
		List<IssueDetailVO> detailList = service.getIssueDetailList(iNum);
		model.addAttribute("detailList",detailList);
		ResponseEntity<List<IssueDetailVO>> entity=new ResponseEntity<List<IssueDetailVO>>(detailList,HttpStatus.OK);
		
		return entity;
	}
	

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> registerIssueDetail(@RequestBody IssueDetailVO issueDetail,HttpServletRequest request ) {

		ResponseEntity<String> entity = null;

			try {
				service.createIssueDetail(issueDetail);
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
			}

		return entity;
	}
	

   
   
   
}

