package com.bbb.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbb.dto.GanttHistVO;
import com.bbb.dto.GanttVO;
import com.bbb.dto.ProjectVO;
import com.bbb.dto.UnitworkHistVO;
import com.bbb.service.GanttService;
import com.bbb.service.UnitworkService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/project/gantt")
public class GanttController {
	
	@Autowired
	private GanttService ganttService;
	
	@Autowired
	private UnitworkService unitworkService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void ganttListGET(HttpSession session, Model model) throws Exception {
		ProjectVO selectProject = (ProjectVO)session.getAttribute("logonProject");
		
		List<GanttVO> ganttList = ganttService.readGanttList( selectProject.getGcNum() );
		
		model.addAttribute("ganttList", ganttList);
	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public String ganttListPOST(HttpSession session, Model model) throws Exception {
		ProjectVO selectProject = (ProjectVO)session.getAttribute("logonProject");
		
		List<GanttVO> ganttList = ganttService.readGanttList( selectProject.getGcNum() );
		model.addAttribute("ganttList", ganttList);
		return "project/gantt/modify";
	}
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> ganttModifyPOST(HttpSession session, @RequestBody Map<String, Object> paramMap) throws Exception {
		ResponseEntity<String> entity = null;
		ProjectVO selectProject = (ProjectVO)session.getAttribute("logonProject");
		
		ObjectMapper mapper = new ObjectMapper();
		List<GanttVO> ganttList = mapper.convertValue(paramMap.get("ganttList"), new TypeReference<List<GanttVO>>() {});
		String comm = (String)paramMap.get("comm");
		
		try{
			GanttHistVO ganttHist = new GanttHistVO();
			ganttHist.setGcNum( selectProject.getGcNum() );
			ganttHist.setUpdateDate	( new Date() );
			ganttHist.setComm( comm );
			
			ganttService.updateGCD(ganttList, ganttHist);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	@RequestMapping(value="/history", method=RequestMethod.GET)
	public void historyListGET(Criteria cri, HttpSession session, Model model) throws Exception {
		ProjectVO selectProject = (ProjectVO)session.getAttribute("logonProject");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount( ganttService.readUnitworkHistoryCount( selectProject.getGcNum() ) );
		
		List<GanttHistVO> ganttHistList = ganttService.readUnitworkHistoryList(cri, selectProject.getGcNum() );
		
		model.addAttribute("ganttHistList", ganttHistList);
		model.addAttribute("pageMaker", pageMaker);
	}
}
