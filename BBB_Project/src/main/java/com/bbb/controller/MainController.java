package com.bbb.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectVO;
import com.bbb.mail.MimeAttachNotifier;
import com.bbb.service.MemberService;
import com.bbb.service.ProjectService;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private MimeAttachNotifier notifier;
	
	
	@RequestMapping(value="" ,method=RequestMethod.GET)
	public String memberTurningPoint(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO loginUser = (MemberVO)request.getSession().getAttribute("loginUser");
		
		String url = "";
		if(loginUser.getOperatoryn() == 1 ){
			url = "redirect:/admin/mainForm";
		}else{
			url = "redirect:/main/myPartakeList";
		}
		
		return url;
	}
	

	// 로그인 후 나의 프로젝트 참여 목록을 보여준다.
	@RequestMapping(value="/myPartakeList", method=RequestMethod.GET)
	public void partakeList(Model model, HttpServletRequest request) throws Exception{
		
		HttpSession session=request.getSession();
		//로그인 유저의 아이디
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		model.addAttribute("myPartakeList",projectService.readMyProjectList(loginUser.getId()));
	}
	
	@RequestMapping(value="/addProject", method=RequestMethod.GET)
	public void addProjectGET() throws Exception {
		
	}
	
	@RequestMapping(value="/addProject", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> addProject(@RequestBody ProjectVO project, HttpServletRequest request) throws Exception {
		ResponseEntity<String> entity = null;
		
		System.out.println(project.toString());
		
		
		try{
			projectService.addProject(project);
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}catch(SQLException e){
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/mypage/modify",method=RequestMethod.POST)
	public String mypageModify(MemberVO member, HttpServletRequest request)throws Exception{
		
		service.modify(member);
		MemberVO loginUser=service.getMemberById(member.getId());
		request.getSession().setAttribute("loginUser", loginUser);
		return "redirect:/main/myPartakeList";
	}
	
	@RequestMapping("/mypage/resetPwd")
	public String resetPwd()throws Exception{
		return "member/mypage/resetPwd";
	}
	
	@RequestMapping(value="/mypage/resetPwd",method=RequestMethod.POST)
	public String resetPwdPOST(MemberVO member,String newPwd)throws Exception{
		
		member.setPwd(newPwd);
		service.resetMemberPwd(member);
		return "redirect:/main/myPartakeList";
		/*MemberVO loginUser=(MemberVO)request.getSession().getAttribute("loginUser");
		if((loginUser.getPwd()).equals(member.getPwd())){
			member.setPwd(newPwd);
			service.resetMemberPwd(member);
			return "redirect:/main/myPartakeList";
		}else{
			return "redirect:/member/mypage/resetPwd";
		}*/
	}
	
	@RequestMapping("/mypage/resetEmail")
	public String resetEmail()throws Exception{
		return "member/mypage/resetEmail";
	}
	
	@RequestMapping(value="/getEmailCode")
    @ResponseBody
    public Map<Object, Object> getEmailCode(@RequestBody String email) throws Exception {
		
		String tempKey = notifier.sendMail(email);
		
        Map<Object, Object> map = new HashMap<Object, Object>();
        map.put("tempKey", tempKey);
 
        return map;
    }
	
	@RequestMapping(value="/mypage/resetEmail" ,method=RequestMethod.POST)
	public String resetEmailPOST(MemberVO member,String newEmail,HttpServletRequest request)throws Exception{
		
		member.setEmail(newEmail);
		service.modifyEmail(member);
		MemberVO loginUser=service.getMemberById(member.getId());
		request.getSession().setAttribute("loginUser", loginUser);
		
		return "redirect:/main/myPartakeList";
	}
	
	
	
}
