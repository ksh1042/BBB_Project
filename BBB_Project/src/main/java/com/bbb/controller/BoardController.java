package com.bbb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dao.BoardDAO;
import com.bbb.dto.BoardVO;
import com.bbb.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@Autowired
	private BoardDAO dao;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public void list(SearchCriteria cri,Model model) throws Exception{
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dao.selectSearchBoardListCount(cri));
		
		List<BoardVO> boardList = service.getSearchBoardList(cri);
		model.addAttribute("boardList",boardList);
	}
	
}
