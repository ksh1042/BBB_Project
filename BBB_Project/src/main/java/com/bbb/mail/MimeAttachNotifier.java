package com.bbb.mail;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MimeAttachNotifier {
	
	
	private JavaMailSender mailSender;
	public void setMailSender(JavaMailSender mailSender){
		this.mailSender=mailSender;
	}
	
	public String sendMail(String email){
		MimeMessage message = mailSender.createMimeMessage();
		
		String tempKey = "";
		
		try{
			MimeMessageHelper messageHelper=new MimeMessageHelper(message,true,"utf-8");
			
			for (int i = 0; i < 10; i++) {
				
				char tmp = (char)(Math.random()*74+48);
				
				if((tmp >= 48 && tmp <= 57) || (tmp >= 65 && tmp <= 90) || (tmp >= 97 && tmp <= 122)){
				
					tempKey += tmp;
					
				}
			}
			messageHelper.setSubject("[PMS]사이트에서 인증 코드가 발송되었습니다."); 
			String content="<h2>[PMS]사이트에서 인증 코드가 발송되었습니다.</h2>"
					   + "<dl>"
					   + "	<dt>아래의 인증코드를 인증코드 입력창에 입력해주세요.</dt>"							   
					   + "	<dt>인증코드 : "+ tempKey+"</dt>"
					   + "</dl>";
			messageHelper.setText(content,true);
			messageHelper.setFrom("skgus9665@naver.com","[PMS]운영자"); 
			messageHelper.setTo(new InternetAddress(email,"utf-8"));
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		mailSender.send(message);
		
		return tempKey;
	}
}
