package com.bbb.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

public class LoginFailureSecurityHandler 
				extends SimpleUrlAuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
		
		String accept=request.getHeader("accept");
		
		System.out.println(accept);
		
		if(accept.indexOf("json")>-1){ //ajax request
			response.setContentType("application/json;charset=utf-8");
			String data ="{"
					+ "\"message\":\"아이디/패스워드가 일치하지 않습니다\","
					+ "\"returl\":\"\","
					+ "\"error\":true"					
					+ "}";
			
			PrintWriter out=response.getWriter();
			out.println(data);
			out.flush();
			out.close();
		}else{ //html request
			request.setAttribute("msg", "아이디/패스워드가 올바르지 않습니다.");
			super.onAuthenticationFailure(request, response, exception);
		}		
		
	}
	
	
}
