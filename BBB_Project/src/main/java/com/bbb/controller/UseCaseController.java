package com.bbb.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbb.dto.ProjectVO;
import com.bbb.dto.UseCaseVO;
import com.bbb.service.ProjectService;
import com.bbb.service.UseCaseService;

@Controller
@RequestMapping("/project/usecase")
public class UseCaseController {
	
	@Autowired
	private UseCaseService usecaseService;
	
	@Autowired
	private ProjectService projectService;
	
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
			model.addAttribute("usecaseList", usecaseList);
			model.addAttribute("imageUrl", fullName);

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
	


}
