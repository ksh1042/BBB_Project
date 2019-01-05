package com.bbb.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbb.dto.BoardNoticeVO;
import com.bbb.dto.BoardVO;
import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectVO;
import com.bbb.service.BoardNoticeService;

@Controller
@RequestMapping("/boardnotice")
public class BoardNoticeController {

	@Autowired
	private BoardNoticeService service;
	
	@RequestMapping(value="/listPage",method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri")SearchCriteria cri, Model model, HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		ProjectVO project = (ProjectVO)session.getAttribute("logonProject");
		cri.setPjNum(project.getPjNum());
	
		List<BoardNoticeVO> boardnoticeList = service.readNoticelistSearch(cri);	
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.readSearchBoardNoticeCount(cri));
		model.addAttribute("boardnoticeList",boardnoticeList);
		model.addAttribute("pageMaker",pageMaker);
	}
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public void registerGet()throws Exception{}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerPOST(@RequestBody Map<String, Object>paramMap, RedirectAttributes rtts, HttpServletRequest request) throws Exception{
		
		String title = (String)paramMap.get("title");
		String content = (String)paramMap.get("content");
		String writer = (String)paramMap.get("writer");
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		ProjectVO project = (ProjectVO)session.getAttribute("logonProject");
		int pjNum = project.getPjNum();
		int bNum = service.readBoardNoticebNum();
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date noticeDate = transFormat.parse((String)paramMap.get("noticeDate"));
		
		BoardVO board = new BoardVO();
		BoardNoticeVO notice = new BoardNoticeVO();
		
		board.setbNum(bNum);
		notice.setbNum(bNum);
		board.setTitle(title);
		board.setContent(content);
		board.setWriter(writer);
		notice.setNoticeDate(noticeDate);
		board.setPjNum(pjNum);
		
		
		service.create(board);
		service.createNotice(notice);
		
		rtts.addFlashAttribute("msg","SUCCESS");
		return "redirect:/boardnotice/listPage";
	}
	
	@RequestMapping(value="/readPage",method=RequestMethod.GET)
	public void readPage(@ModelAttribute("cri") SearchCriteria cri, int bNum, Model model,HttpServletRequest request)throws Exception{
		HttpSession session = request.getSession();
		ProjectVO project = (ProjectVO)session.getAttribute("logonProject");
		cri.setPjNum(project.getPjNum());
		
		BoardVO board = (BoardVO)session.getAttribute("bNum");
		bNum = service.readBoardNoticebNum();
		BoardNoticeVO boardnotice = service.readBoardNoticeByBnum(bNum);
		model.addAttribute("boardnotice",boardnotice);
	}
	
	@RequestMapping(value="/remove",method=RequestMethod.POST)
	public String removdPOST(SearchCriteria cri, int bNum, BoardVO board, BoardNoticeVO notice, RedirectAttributes rttr) throws Exception{

		service.delete(bNum);
		service.deleteNotice(bNum);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/boardnotice/listPage";
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public void modifyPage(@ModelAttribute("cri")SearchCriteria cri, int bNum, Model model) throws Exception{
		BoardNoticeVO boardnotice = service.readBoardNoticeByBnum(bNum);
		model.addAttribute("boardnotice",boardnotice);
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modifyPagePOST(@RequestBody BoardNoticeVO notice, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		
		service.updateNotice(notice);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/boardnotice/listPage";
		
	}
	
}
