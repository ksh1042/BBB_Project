package com.bbb.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbb.dto.ProjectVO;
import com.bbb.dto.QnaVO;
import com.bbb.dto.UseCaseReplyVO;
import com.bbb.dto.UseCaseVO;
import com.bbb.service.ProjectService;
import com.bbb.service.UseCaseReplyService;
import com.bbb.service.UseCaseService;

@Controller
@RequestMapping("/project/usecase")
public class UseCaseController {
	
	@Autowired
	private UseCaseService usecaseService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private UseCaseReplyService usecaseReplyService;
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public void view(Model model, HttpSession session, HttpServletRequest request) throws Exception{
		
		ProjectVO project = (ProjectVO)session.getAttribute("logonProject");
		String uuuid = project.getUuuid();
		
		if(uuuid==null){

		}else{
			UseCaseVO usecase = usecaseService.read(uuuid);
			String savePath = usecase.getSavePath().replace("\\", "/");
			String fullName = savePath+usecase.getUuuid()+"$$"+usecase.getFileName();
			System.out.println(fullName);
			List<UseCaseVO> usecaseList = usecaseService.readList(uuuid);
			List<UseCaseReplyVO> replyList = usecaseReplyService.readReplyList(uuuid);
			model.addAttribute("usecaseList", usecaseList);
			model.addAttribute("imageUrl", fullName);
			model.addAttribute("replyList", replyList);

		}
		
	}
	
	@RequestMapping(value="register", method=RequestMethod.GET)
	public void registerGET() throws Exception{}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String registerPOST(UseCaseVO usecaseVO, HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();
		ProjectVO project = (ProjectVO)session.getAttribute("logonProject");
		int pjNum = project.getPjNum();
		
		List<UseCaseVO> usecaseList = usecaseVO.getAttachList();
		for(UseCaseVO usecase : usecaseList){
			project.setUuuid(usecase.getUuuid());
			usecaseService.create(usecase);
			projectService.insertUsecase(project);
		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write("<script>");
		out.write("alert('Use-Case 가 등록되었습니다.');");
		out.write("</script>");
		
		return "redirect:/project/usecase/view?pjNum="+pjNum;
	}
	
	@RequestMapping(value="/getAttach/{uuuid}", method=RequestMethod.GET)
	@ResponseBody
	public List<UseCaseVO> getAttach(@PathVariable("uuuid")String uuuid) throws Exception{
	      
	    return usecaseService.readList(uuuid);
	}
	
	@RequestMapping(value="registerReply", method=RequestMethod.GET)
	public void registerReplyGET() throws Exception{}

	@RequestMapping(value="registerReply", method=RequestMethod.POST)
	public String registerReplyPOST(UseCaseReplyVO usecaseReplyVO, RedirectAttributes rttr, HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();
		ProjectVO project = (ProjectVO)session.getAttribute("logonProject");
	
		String uuuid = project.getUuuid();
		
		usecaseReplyVO.setUuuid(uuuid);
		usecaseReplyService.createReply(usecaseReplyVO);
		
		rttr.addFlashAttribute("msg","SUCCESS");

		return "redirect:/project/usecase/view";
		
	}
	


}
