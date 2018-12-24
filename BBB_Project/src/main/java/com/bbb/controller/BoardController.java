package com.bbb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dao.BoardDAO;
import com.bbb.dto.BoardVO;
import com.bbb.dto.MemberVO;
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
	
	@RequestMapping(value="register",method=RequestMethod.GET)
	public void registerGET(@ModelAttribute("cri")SearchCriteria cri,HttpServletRequest request){
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
	}
	@RequestMapping(value="register",method=RequestMethod.POST)
	public String registerPOST(SearchCriteria cri, BoardVO board) throws Exception{
		String url="redirect:list";
		
		service.register(board);
		return url;
		
	}
	
	
	
	
	
}
