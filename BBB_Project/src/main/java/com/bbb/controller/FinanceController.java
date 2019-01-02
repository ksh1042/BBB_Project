package com.bbb.controller;

import java.sql.SQLException;
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

import com.bbb.dto.FinanceDetailVO;
import com.bbb.dto.FinanceVO;
import com.bbb.dto.ProjectVO;
import com.bbb.service.FinanceService;
import com.bbb.service.ProjectService;

@Controller
@RequestMapping("/project/finance")
public class FinanceController {

	@Autowired
	private FinanceService financeService;
	

	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public void createFinanceGET() throws Exception{
		
	}
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String createFinancePOST(int pjNum, HttpServletRequest request) throws Exception{
		/*HttpSession session = request.getSession();
		ProjectVO project = (ProjectVO)session.getAttribute("logonProject");
		int pjNum = project.getPjNum();*/
		
		System.out.println(pjNum);
		
		int fNum = financeService.createFinance(pjNum);
		
	return "redirect:/project/finance/list?fNum"+fNum;
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void financeList(Model model, HttpServletRequest request) throws Exception{
		
		// session에서 projectVO를 받아옴
		HttpSession session = request.getSession();
		ProjectVO project = (ProjectVO)session.getAttribute("logonProject");
		
		int fNum = project.getfNum();
		int total = financeService.createTotal(fNum);
		
		List<FinanceDetailVO> detailList = financeService.readFinanceDetailList(fNum);
		List<FinanceDetailVO> regList = financeService.readRegdateByFnum(fNum);

		System.out.println(detailList);
		model.addAttribute("financeDetailList",detailList);
		model.addAttribute("financeRegList", regList);
		model.addAttribute("financeTotal", total);


		
	}
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public void registerFinanceGET()throws Exception{
		
	}
	
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> registerFinance(@RequestBody FinanceDetailVO finance , HttpServletRequest request) throws Exception{
		ResponseEntity<String> entity = null;
		HttpSession session = request.getSession();
		ProjectVO project = (ProjectVO)session.getAttribute("logonProject");
		
		int fNum = project.getfNum();
		FinanceDetailVO financeDetailVO = new FinanceDetailVO();
		try{
			finance.setfNum(fNum);
			financeService.create(finance);
			financeDetailVO.setfNum(fNum);
			financeDetailVO.setTargetName(finance.getTargetName());
			financeDetailVO.setContent(finance.getContent());
			financeDetailVO.setRegDate(finance.getRegDate());
			financeDetailVO.setPrice(finance.getPrice());
			financeDetailVO.setDepositYn(finance.getDepositYn());
			
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}catch(SQLException e){
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	
		return entity;
	}
	
	
	
}
