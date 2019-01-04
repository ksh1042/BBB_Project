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
import com.bbb.service.UnitworkService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/project/unitwork")
public class UnitworkController {
	
	@Autowired
	private UnitworkService unitworkService;
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String unitworkRegist(HttpSession session) throws Exception {
		ProjectVO selectProject = (ProjectVO)session.getAttribute("logonProject");
		
		int udNum = unitworkService.createUD(selectProject);
		
		selectProject.setUdNum(udNum);
		
		return "redirect:list";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void unitworkListGET(HttpServletRequest request, Model model) throws Exception {
		ProjectVO selectProject = (ProjectVO)request.getSession().getAttribute("logonProject");
		int udNum = selectProject.getUdNum();
		List<UnitworkVO> unitList = unitworkService.readUnitworkList(udNum);
		model.addAttribute("unitList", unitList);
	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public String unitworkListPOST(HttpServletRequest request, Model model) throws Exception {
		ProjectVO selectProject = (ProjectVO)request.getSession().getAttribute("logonProject");
		int udNum = selectProject.getUdNum();
		
		List<UnitworkVO> unitList = unitworkService.readUnitworkList(udNum);
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
		
		System.out.println("unitList : " + unitList);
		System.out.println("createList : " + createList);
		System.out.println("removeUddNumList : " + removeUddNumList);
		System.out.println("comm : " + comm);
		
		try{
			UnitworkHistVO unitHist = new UnitworkHistVO();
			unitHist.setUdNum( selectProject.getUdNum() );
			unitHist.setComm( comm );
			unitHist.setUpdateDate( new Date() );
			
			unitworkService.deleteUDDbyUddNum(removeUddNumList);		// JSP에서 삭제된 리스트를 삭제하고
			unitworkService.updateUDDbyList(unitList);					// 기존의 데이터를 갱신하고
			unitworkService.createUDDbyList(createList, selectProject.getUdNum());				// 새로 들어온 데이터를 입력한다.
			
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		/*
		try{
			UnitworkHistVO unitHist = new UnitworkHistVO();
			unitHist.setUdNum( selectProject.getUdNum() );
			unitHist.setUpdateDate(new Date());
			unitHist.setComm(comm);
			unitworkService.updateUDD(unitList, unitHist, selectProject.getUdNum());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}*/
		return entity;
	}
	
	@RequestMapping(value="/history", method=RequestMethod.GET)
	public void historyListGET(Criteria cri, HttpSession session, Model model) throws Exception {
		ProjectVO selectProject = (ProjectVO)session.getAttribute("logonProject");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount( unitworkService.readUnitworkHistoryCount( selectProject.getUdNum() ) );
		
		List<UnitworkHistVO> unitHistList = unitworkService.readUnitworkHistoryList( cri, selectProject.getUdNum() );
		
		model.addAttribute("unitHistList", unitHistList);
		model.addAttribute("pageMaker", pageMaker);
	}
}
