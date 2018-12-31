package com.bbb.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbb.dto.ProjectPlanVO;
import com.bbb.dto.ProjectVO;
import com.bbb.service.ProjectPlanService;
import com.bbb.service.ProjectService;

@Controller
@RequestMapping("/plan")
public class ProjectPlanController {
	
	@Autowired
	private ProjectPlanService pservice;
	
	@Autowired
	private ProjectService service;
	
	@RequestMapping(value="/registerPlan", method=RequestMethod.GET)
	public void projectPlanGET() throws Exception{
		
	}
	
	@RequestMapping(value="/registerPlan", method=RequestMethod.POST)
	public String projectPlanPOST(ProjectPlanVO planVO, RedirectAttributes rtts, HttpServletRequest request,HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		
		ProjectVO project = (ProjectVO)session.getAttribute("logonProject");
		int pjNum = project.getPjNum();
		List<ProjectPlanVO> attachList = planVO.getAttachList();
		for(ProjectPlanVO plan : attachList){
			project.setPuuid(plan.getPuuid());
			pservice.create(plan);
			service.insertPlan(project);
			System.out.println(planVO.toString());
		}
		rtts.addFlashAttribute("msg","SUCCESS");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write("<script>");
		out.write("alert('계획서가 등록되었습니다.');");
		out.write("</script>");
		
		return "redirect:/project/main?pjNum="+pjNum;
	}
	
	@RequestMapping(value="/viewPlan", method=RequestMethod.GET)
	public String viewPlan(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		ProjectVO project = (ProjectVO)session.getAttribute("logonProject");
		ProjectPlanVO plan = pservice.getPlan(project.getPuuid());
		String savePath = plan.getSavePath().replace("\\", "/");
		System.out.println(savePath);
		String fullName = savePath+plan.getPuuid()+"$$"+plan.getFileName();
		
		return "redirect:/displayFile?fileName="+fullName;
	}
}
