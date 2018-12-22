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

		service.register(member);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('회원가입이 완료되었습니다.');location.href='/index.jsp';");
		out.println("</script>");
		out.flush();
		out.close();
		

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
}
