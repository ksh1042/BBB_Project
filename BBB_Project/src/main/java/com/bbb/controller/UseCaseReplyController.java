package com.bbb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dto.ProjectVO;
import com.bbb.dto.UseCaseReplyVO;
import com.bbb.service.UseCaseReplyService;

@Controller
@RequestMapping("/usecaseReply")
public class UseCaseReplyController {

	@Autowired
	private UseCaseReplyService usecaseReplyService;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public void UsecaseReplyList(Model model, HttpSession session, HttpServletRequest request) throws Exception{
		
		request.getSession();
		ProjectVO project = (ProjectVO)session.getAttribute("logonProject");
		
		String uuuid = project.getUuuid();
		
		
		List<UseCaseReplyVO> replyList = usecaseReplyService.readReplyList(uuuid);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
