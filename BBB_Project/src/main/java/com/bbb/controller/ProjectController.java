package com.bbb.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.ProjectVO;
import com.bbb.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public void test(){
		
	}	
	
	//branch lee
	// 로그인 후 나의 프로젝트 참여 목록을 보여준다.
	@RequestMapping(value="/myPartakeList", method=RequestMethod.GET)
	public void partakeList(Model model, HttpServletRequest request) throws Exception{
		
		HttpSession session=request.getSession();
		//로그인 유저의 아이디
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		String id = loginUser.getId();
		// 참여 또는 신청중인 프로젝트 리스트
		List<ProjectPartakeVO> myPartakeList = service.getBindingProject(id);
		// 비교하기 위한 모든 프로젝트 리스트
		List<ProjectVO> projectList = service.readMyProjectList();
		// pjNum으로 비교한 현재 참여중인 프로젝트 리스트
		List<ProjectVO> myProjectList = new ArrayList<ProjectVO>();
		// pjNum으로 비교한 현재 신청중인 프로젝트 리스트
		List<ProjectVO> bindProjectList = new ArrayList<ProjectVO>();
				
		for(ProjectVO project : projectList){
			for(ProjectPartakeVO myPartake : myPartakeList){
				if(project.getPjNum() == myPartake.getPjNum()){
					if(myPartake.getAssignYn() == 1){
						myProjectList.add(project);
					}else{
						bindProjectList.add(project);
					}
				}
			}
		}
		model.addAttribute("myPartakeList",myProjectList);
		model.addAttribute("bindProject", bindProjectList);
	}
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void projectMain(int pjNum, HttpServletRequest request) throws Exception{
		ProjectVO project = service.projectMain(pjNum);
		request.getSession().setAttribute("logonProject", project);
		System.out.println(project.toString());
	}
	
	@RequestMapping(value="/listUsecase", method=RequestMethod.GET)
	public void getUsecase() throws Exception{
		
	}
	
	@RequestMapping(value="/leaveProject", method=RequestMethod.POST)
	public ResponseEntity<String> leaveProject(@RequestBody ProjectPartakeVO partake) throws Exception{
	ResponseEntity<String> entity = null;
	try{
		service.leaveProject(partake);
					
		entity = new ResponseEntity<String>(HttpStatus.OK);
	}catch(SQLException e){
		entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	return entity;
	}
	
	@RequestMapping(value="/inviteAccept", method=RequestMethod.POST)
	public ResponseEntity<String> accept(@RequestBody ProjectPartakeVO partake) throws Exception{
		ResponseEntity<String> entity = null;
		try{
			service.acceptInvite(partake);
						
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(SQLException e){
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/inviteRefuse", method=RequestMethod.POST)
	public ResponseEntity<String> refuse(@RequestBody ProjectPartakeVO partake) throws Exception{
		ResponseEntity<String> entity = null;
		try{
			service.refuseInvite(partake);
						
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(SQLException e){
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	

	
}






















