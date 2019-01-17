package com.bbb.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.ProjectVO;
import com.bbb.dto.RequirementVO;
import com.bbb.dto.UnitworkHistVO;
import com.bbb.dto.UnitworkVO;
import com.bbb.service.ProjectService;
import com.bbb.service.UnitworkService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/project/unitwork")
public class UnitworkController {
	
	@Autowired
	private UnitworkService unitworkService;
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String unitworkRegist(HttpSession session) throws Exception {
		ProjectVO selectProject = (ProjectVO)session.getAttribute("logonProject");
		
		Map<String, Integer> numberMap = unitworkService.createUD(selectProject);
		
		selectProject.setUdNum(numberMap.get("udNum"));
		selectProject.setUdNum(numberMap.get("gcNum"));
		
		session.setAttribute("logonProject", selectProject);
		
		return "redirect:list";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void unitworkListGET(SearchCriteria cri, HttpServletRequest request, Model model) throws Exception {
		ProjectVO selectProject = (ProjectVO)request.getSession().getAttribute("logonProject");
		int udNum = selectProject.getUdNum();
		PageMaker pageMaker = new PageMaker();
		cri.setPerPageNum(15);
		pageMaker.setCri(cri);
		int totalCount = unitworkService.readUnitworkCount( cri, udNum );
		pageMaker.setTotalCount(totalCount);
		
		List<UnitworkVO> unitList = unitworkService.readUnitworkList(cri, udNum);
		
		model.addAttribute("unitList", unitList);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public String unitworkListPOST(HttpServletRequest request, Model model) throws Exception {
		ProjectVO selectProject = (ProjectVO)request.getSession().getAttribute("logonProject");
		int udNum = selectProject.getUdNum();
		List<UnitworkVO> unitList = unitworkService.readUnitworkList(null, udNum);
		List<ProjectPartakeVO> partakeList = unitworkService.readBindingMemberList(selectProject.getPjNum());
		List<RequirementVO> requireList = unitworkService.readRequirementList(selectProject.getRdNum());
		
		model.addAttribute("unitList", unitList);
		model.addAttribute("partakeList", partakeList);
		model.addAttribute("requireList", requireList);
		
		return "project/unitwork/ModifyList";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> updateUnitworkList(HttpSession session, @RequestBody Map<String, Object> paramMap){
		ResponseEntity<String> entity = null;
		ProjectVO selectProject = (ProjectVO)session.getAttribute("logonProject");
		
		ObjectMapper mapper = new ObjectMapper();
		List<UnitworkVO> unitList = mapper.convertValue(paramMap.get("unitList"), new TypeReference<List<UnitworkVO>>() {
		});
		List<Integer> removeUddNumList = mapper.convertValue(paramMap.get("removeUddNumList"), new TypeReference<List<Integer>>() {
		});
		String comm = (String)paramMap.get("comm");
		
		for(int i=0; i<unitList.size(); i++){
			unitList.get(i).setUdNum( selectProject.getUdNum() );
		}
		
		List<UnitworkVO> createList = new ArrayList<UnitworkVO>();
		
		Iterator<UnitworkVO> it = unitList.iterator();
		while( it.hasNext() ){
			UnitworkVO unit = it.next();
			if(unit.getUddNum() <= 0){
				createList.add(unit);
				it.remove();
			}
		}
		
		try{
			UnitworkHistVO unitHist = new UnitworkHistVO();
			unitHist.setUdNum( selectProject.getUdNum() );
			unitHist.setComm( comm );
			unitHist.setUpdateDate( new Date() );
			
			unitworkService.updateUDD(unitList, createList, removeUddNumList, unitHist, selectProject);
			
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/history", method=RequestMethod.GET)
	public void historyListGET(SearchCriteria cri, HttpSession session, Model model) throws Exception {
		ProjectVO selectProject = (ProjectVO)session.getAttribute("logonProject");
		int udNum = selectProject.getUdNum();
		cri.setPerPageNum(15);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount( unitworkService.readUnitworkHistoryCount( cri, udNum ) );
		
		List<UnitworkHistVO> unitHistList = unitworkService.readUnitworkHistoryList( cri, udNum );
		
		model.addAttribute("unitHistList", unitHistList);
		model.addAttribute("pageMaker", pageMaker);
	}
}
