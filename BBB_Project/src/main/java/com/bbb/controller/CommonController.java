package com.bbb.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbb.dto.MemberVO;
import com.bbb.service.MemberService;

@Controller
@RequestMapping("/commons")
public class CommonController {
	
	@Autowired
	private MemberService service;

	@RequestMapping("/loginForm")
	public String loginForm() throws Exception {
		return "commons/login";
	}

	@RequestMapping("/register")
	public String registerForm() throws Exception {
		return "commons/register";
	}

	@RequestMapping(value = "/register/post", method = RequestMethod.POST)
	public void register(MemberVO member,HttpServletResponse response,HttpServletRequest request) throws Exception {

		service.registerMember(member);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('ȸ�������� �Ϸ�Ǿ����ϴ�.');location.href='<%=request.getContextPath%>/commons/loginForm';");
		out.println("</script>");

	}
}
