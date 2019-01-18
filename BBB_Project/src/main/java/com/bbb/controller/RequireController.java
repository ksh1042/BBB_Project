package com.bbb.controller;

import java.util.List;

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
import com.bbb.dto.RequirementHistVO;
import com.bbb.dto.RequirementVO;
import com.bbb.service.ProjectService;
import com.bbb.service.RequirementService;

@Controller
@RequestMapping("/project/requirement")
public class RequireController {
	
	@Autowired
	private RequirementService service;
	
	@Autowired
	private ProjectService pService;
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String createRequire(HttpServletRequest request) throws Exception{
		int rdNum = service.rdNumNextval();
		HttpSession session = request.getSession();
		ProjectVO logonProject = (ProjectVO)session.getAttribute("logonProject");
		logonProject.setRdNum(rdNum);
		service.createRequirement(rdNum);
		service.insertRdNum(logonProject);
		
		request.getSession().setAttribute("logonProject", logonProject);
		return "redirect:/project/requirement/list";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void requireListGET(SearchCriteria cri, HttpServletRequest request, Model model) throws Exception{
		HttpSession session = request.getSession();
		ProjectVO logonProject = (ProjectVO)session.getAttribute("logonProject");
		int rdNum = logonProject.getRdNum();
		int pjNum = logonProject.getPjNum();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.selectReqListCount(cri,rdNum));
		List<RequirementVO> reqList = service.selectReqList(cri,rdNum);
		List<ProjectPartakeVO> partList = pService.selectPartList(pjNum);
		model.addAttribute("bindMember", partList);
		model.addAttribute("requireList",reqList);
		model.addAttribute("pageMaker",pageMaker);
	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public String requireListPost(HttpServletRequest request, Model model) throws Exception{
		HttpSession session = request.getSession();
		ProjectVO logonProject = (ProjectVO)session.getAttribute("logonProject");
		int rdNum = logonProject.getRdNum();
		List<RequirementVO> reqList = service.selectReqList(null,rdNum);
		
		model.addAttribute("requireList",reqList);
		
		return "project/requirement/ModifyList";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> modifyRequireList(@RequestBody RequirementHistVO reqHist,HttpServletRequest request)throws Exception{
		HttpSession session = request.getSession();
		ProjectVO logonProject = (ProjectVO)session.getAttribute("logonProject");
		ResponseEntity<String> entity = null;
		
		List<RequirementVO> updateList = reqHist.getRequireList();
		List<Integer> deleteList = reqHist.getDeleteList();
		int rdNum = logonProject.getRdNum();
		
		reqHist.setRdNum(rdNum);
		service.insertRequireHist(reqHist);
		
		try{
			//삭제할 항목이 없을경우
			if(deleteList.isEmpty()){
				
			}else{
				for(int i=0; i<deleteList.size(); i++){
					int delNum = deleteList.get(i).intValue();
					service.deleteRequirement(delNum);
				}
			}
			//기존에 입력된 요구사항 수정 / 새로 입력된 요구사항 추가
			for(RequirementVO require : updateList){
				require.setRdNum(rdNum);
				if(require.getRddNum() == 0){
					service.createRequirementBySetRddNum(require);
				}else{
					service.updateRequirement(require);
				}
			}
			
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
		int rdNum = selectProject.getRdNum();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.getRequireHistoryCount(cri, rdNum));
		
		List<RequirementHistVO> reqHistList = service.getRequireHistory(cri, rdNum);
		
		model.addAttribute("reqHistList", reqHistList);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/toExcel", method=RequestMethod.GET)
	public void listToExcel(int rdNum, Model model) throws Exception{
		SearchCriteria cri = new SearchCriteria();
		List<RequirementVO> reqList = service.selectReqList(cri, rdNum);
		
		model.addAttribute("requireList", reqList);
	}
	
}
