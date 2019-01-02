package com.bbb.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbb.dto.BoardVO;
import com.bbb.dto.MemberVO;
import com.bbb.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@RequestMapping(value="/listPage",method=RequestMethod.GET)
	public void listPage(SearchCriteria cri, Model model) throws Exception{
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.readSearchBoardCount(cri));
		List<BoardVO> boardList = service.readListSearch(cri);
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("boardList",boardList);
	}
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public void registerGET()throws Exception{}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerPOST(BoardVO board, RedirectAttributes rtts) throws Exception{
		service.create(board);
		rtts.addFlashAttribute("msg","SUCCESS");
		return "redirect:/board/listPage";
	}
	
	@RequestMapping(value="/readPage", method=RequestMethod.GET)
	public void readPage(@ModelAttribute("cri") SearchCriteria cri, int bNum, Model model) throws Exception{
		BoardVO board = service.read(bNum);
		model.addAttribute("board",board);
	}
	
	@RequestMapping(value="/modifyPage",method=RequestMethod.GET)
	public void modifyPage(@ModelAttribute("cri")SearchCriteria cri,
							int bNum, Model model)throws Exception{
		 BoardVO board = service.read(bNum);
		 model.addAttribute("board",board);
	}


	@RequestMapping(value="/modifyPage",method=RequestMethod.POST)
	public String modifyPagePOST(BoardVO board,SearchCriteria cri,
								RedirectAttributes rttr)
									throws Exception{
		
		board.setUpdateDate(new Date());
		
		service.update(board);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/board/listPage";
	}
	
	@RequestMapping(value="/removePage",method=RequestMethod.POST)
	public String removePage(int bNum,SearchCriteria cri,
							RedirectAttributes rttr)
							throws Exception{
		service.delete(bNum);

		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/board/listPage";
	}
}
