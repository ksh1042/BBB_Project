package com.bbb.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbb.dto.MemberVO;
import com.bbb.mail.MimeAttachNotifier;
import com.bbb.service.MemberService;

@Controller
@RequestMapping("/commons")
public class CommonController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private MimeAttachNotifier notifier;

	@RequestMapping("/loginForm")
	public String loginForm() throws Exception {
		return "commons/login";
	}

	@RequestMapping("/register")
	public String registerForm() throws Exception {
		return "commons/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(MemberVO member, Model model) throws Exception {
		
		service.register(member);
		model.addAttribute("newMember", member.getName());
		
		return "redirect:commons/login";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().invalidate();
		
		PrintWriter out = response.getWriter();
		out.print("<script>");
		out.print("alert('정상적으로 로그아웃 되었습니다');");
		out.print("location.href='"+ request.getContextPath()+"';");
		out.print("</script>");
		
		out.flush();
		out.close();
	}
	
	/*	@RequestMapping(value="/uploadProfile",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public void uploadProfile*/ //프로필사진
	
	
	@RequestMapping(value="/idCheck")
    @ResponseBody
    public Map<Object, Object> idCk(@RequestBody String userid) throws Exception {
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
        count = service.idCheckSer(userid);
        map.put("cnt", count);
 
        return map;
    }
	
	@RequestMapping(value="/emailCheck")
    @ResponseBody
    public Map<Object, Object> emailCk(@RequestBody String userEmail) throws Exception {
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
        count = service.emailCheckSer(userEmail);
        map.put("cnt", count);
 
        return map;
    }
	
	
	@RequestMapping("/findIdPwd")
	public String findIdPwdForm() throws Exception{
		return "commons/findPwd"; //우선 패스워드 찾기로 이동후 원할시 아이디 찾기도 가능.
	}
	
	@RequestMapping("/findId")
	public String findIdForm() throws Exception{
		return "commons/findIdPwd"; 
	}
	
	@RequestMapping(value="/getEmailCode")
    @ResponseBody
    public Map<Object, Object> getEmailCode(@RequestBody String email) throws Exception {
		
		String tempKey = notifier.sendMail(email);
		
        Map<Object, Object> map = new HashMap<Object, Object>();
        map.put("tempKey", tempKey);
 
        return map;
    }
	
	@RequestMapping("/showId")
	public String showId(MemberVO member, Model model) throws Exception{
		
		String findedID = service.findID(member);
		
		model.addAttribute("findedID", findedID);
		
		return "commons/showId";
	}
	
	@RequestMapping(value="/resetPwd" ,method=RequestMethod.POST)
	public String resetPwd(MemberVO member,RedirectAttributes rttr)throws Exception{
		
		service.resetMemberPwd(member);
		rttr.addAttribute("id",member.getId());
		
		return "redirect:loginForm";
	}
	
	@RequestMapping("/findPwd")
	public String findPwdForm(MemberVO member, Model model)throws Exception{
		
		String id = service.findID(member);
		
		if (id.equals(member.getId())) {
			model.addAttribute("id", member.getId());
			
			return "commons/resetPwd";
		}else{
			model.addAttribute("isExist", "noMember");
			return "commons/findPwd";
		}
		
		
	}
	

}
