package com.bbb.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	
	@RequestMapping(value="/listQna", method=RequestMethod.GET)
	public void listPage(SearchCriteria cri, Model model) throws Exception{
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(qnaDAO.selectSearchQnaListCount(cri));
		List<QnaVO> listQna = service.getSearchQnaList(cri);
		
		model.addAttribute("listQna", listQna);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/registerQna",method=RequestMethod.GET)
	public void registerGET()throws Exception{
		
	}
	
	
	@RequestMapping(value="/registerQna",method=RequestMethod.POST)
	public String registerPOST(QnaVO qna,RedirectAttributes rtts) throws Exception{
		service.create(qna);
		rtts.addFlashAttribute("msg","SUCCESS");
		return "redirect:/question/listQna";
	}
	
	@RequestMapping(value="/readQna",method=RequestMethod.GET)
	public void readPage(@ModelAttribute("cri")SearchCriteria cri, int qaNum, Model model)throws Exception{
		QnaVO qna=service.readByQaNum(qaNum);
		model.addAttribute("qna", qna);
	}
	
	@RequestMapping(value="/modifyQna", method=RequestMethod.GET)
	public void modifyPage(@ModelAttribute("cri") SearchCriteria cri, @RequestParam(value="qaNum", defaultValue="-1") int qaNum,Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		if(qaNum > 0){
			QnaVO qna = service.readByQaNum(qaNum);
			request.setAttribute("qna", qna);
			request.setAttribute("cri", cri);
			request.getRequestDispatcher("/WEB-INF/views/question/modifyQna.jsp").forward(request, response);
			model.addAttribute(qna);
		}else{
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write("<script>");
			out.write("alert('QnA 게시물이 존재하지않습니다.');");
			out.println("history.go(-1);");
			out.write("</script>");
			
		}
	}
	
	@RequestMapping(value = "/modifyQna", method = RequestMethod.POST)
	public String modifyPagePOST(QnaVO qna, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		
		service.update(qna);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addFlashAttribute("msg", "SUCCESS");
			
		return "redirect:/question/listQna";
	}
	
	@RequestMapping(value="/removeQna",method=RequestMethod.POST)
	public String removePage(int qaNum, RedirectAttributes rttr, SearchCriteria cri) throws Exception{
		service.remove(qaNum);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/question/listQna";		
	}
	

}

















