package com.bbb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbb.criteria.PageMaker;
import com.bbb.criteria.SearchCriteria;
import com.bbb.dao.QnaDAO;
import com.bbb.dto.QnaVO;
import com.bbb.service.QnaService;

@Controller
@RequestMapping("/question")
public class QnaController {
	
	@Autowired
	private QnaService service;
	
	@Autowired
	private QnaDAO qnaDAO;

	
	@RequestMapping(value="/qnaList", method=RequestMethod.GET)
	public void listPage(SearchCriteria cri, Model model) throws Exception{
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(qnaDAO.selectSearchQnaListCount(cri));
		List<QnaVO> qnaList = service.getSearchQnaList(cri);
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public void registerGET()throws Exception{}
	
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerPOST(QnaVO qna,RedirectAttributes rtts)
								throws Exception{
	
		service.create(qna);
		rtts.addFlashAttribute("msg","SUCCESS");
		return "redirect:/Qna/list";
	}
	
	@RequestMapping(value="/readPage",method=RequestMethod.GET)
	public void readPage(@ModelAttribute("cri")SearchCriteria cri,
						 int qaNum, Model model)throws Exception{
		QnaVO qna=service.readByQaNum(qaNum);
		model.addAttribute(qna);
	}

}
