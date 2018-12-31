package com.bbb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbb.dto.FinanceDetailVO;
import com.bbb.dto.ProjectVO;
import com.bbb.service.FinanceService;

@Controller
@RequestMapping("/project")
public class FinanceController {

	@Autowired
	private FinanceService financeService;
	
	
	@RequestMapping(value="/listFinance", method=RequestMethod.GET)
	public void financeList(Model model, HttpServletRequest request) throws Exception{
		
		// session에서 projectVO를 받아옴
		HttpSession session = request.getSession();
		ProjectVO project = (ProjectVO)session.getAttribute("logonProject");
		
		int fNum = project.getfNum();
		
		List<FinanceDetailVO> detailList = financeService.readFinanceDetailList(fNum);
		List<FinanceDetailVO> regList = financeService.readRegdateByFnum(fNum);
		
		int total = financeService.createTotal(fNum);
		
		model.addAttribute("financeDetailList",detailList);
		model.addAttribute("financeRegList", regList);
		model.addAttribute("financeTotal", total);

		
	}
	
	@RequestMapping(value="/registerFinance",method=RequestMethod.GET)
	public void registerFinanceGET()throws Exception{
		
	}
	
	
	@RequestMapping(value="/registerFinance",method=RequestMethod.POST)
	public String registerFinancePOST(FinanceDetailVO fNum , RedirectAttributes rtts) throws Exception{
		financeService.create(fNum);
		rtts.addFlashAttribute("msg","SUCCESS");
		return "redirect:/project/listFinance";
	}
	
	
	
}
