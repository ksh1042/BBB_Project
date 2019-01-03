package com.bbb.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbb.dto.BoardAttachVO;
import com.bbb.dto.BoardVO;
import com.bbb.dto.ProjectVO;
import com.bbb.service.FileBoardService;
import com.bbb.utils.MediaUtils;

@Controller
@RequestMapping("/fileboard")
public class FileBoardController {

	
		
	@Autowired
	private FileBoardService service;
	
	
	
	@RequestMapping(value="/fileboardlist",method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri")SearchCriteria cri,
						 Model model, HttpSession session) throws Exception{
		int pjNum= ((ProjectVO)(session.getAttribute("logonProject"))).getPjNum();
		List<BoardVO> boardList=service.listSearch(cri,pjNum);
		model.addAttribute("list",boardList);
		
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		int totalCount = service.listAll().size();
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("list", boardList);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/fileboardinsert",method=RequestMethod.GET)
	public void registerGET()throws Exception{}
	
	
	@RequestMapping(value="/fileboardinsert",method=RequestMethod.POST)
	public String registerPOST(BoardVO board,RedirectAttributes rtts,HttpServletRequest request)
								throws Exception{
		ProjectVO project  = (ProjectVO)request.getSession().getAttribute("logonProject");
		int pjNum=project.getPjNum();
		board.setPjNum(pjNum);
		System.out.println(board);
		service.create(board);
		rtts.addFlashAttribute("msg","SUCCESS");
		return "redirect:/fileboard/fileboardlist";
	}
	
	
	@RequestMapping(value="/fileboardread",method=RequestMethod.GET)
	public void readPage(@ModelAttribute("cri")SearchCriteria cri,
						 int bNum, Model model)throws Exception{
		BoardVO board=service.read(bNum);
		model.addAttribute(board);
	} 
	
	@RequestMapping(value="/fileboardmodify",method=RequestMethod.GET)
	public void modifyPage(@ModelAttribute("cri")SearchCriteria cri,
							int bNum, Model model)throws Exception{
		 BoardVO board=service.readBybNum(bNum);
		 model.addAttribute(board);
	}
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@RequestMapping(value="/fileboardmodify",method=RequestMethod.POST)
	public String modifyPagePOST(String oldAttach,BoardVO board,SearchCriteria cri,
								RedirectAttributes rttr)
									throws Exception{
		
		if(oldAttach != null){
		String[] fileNames=oldAttach.split(",");
		for(String fileName : fileNames){
			String formatName=fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType=MediaUtils.getMediaType(formatName);
			
			if(mType!=null){
				String front=fileName.substring(0, 12);
				String end=fileName.substring(14);
				new File(uploadPath+(front+end).replace('/', File.separatorChar))
					.delete();			
			}
			new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
			}
		}
		
		
		service.update(board);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/fileboard/fileboardlist";
	}
	
	@RequestMapping(value="/fileboardremove",method=RequestMethod.POST)
	public String removePage(int bNum,SearchCriteria cri,
							RedirectAttributes rttr)
							throws Exception{
		service.delete(bNum);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/fileboard/fileboardlist";
	}
	
	@RequestMapping(value="/getAttach/{bNum}",method=RequestMethod.GET)
	@ResponseBody
	public List<BoardAttachVO> getAttach(@PathVariable("bNum")int bNum)
									throws Exception{
		return service.getAttach(bNum);
	}
	
	
}
