package com.bbb.mail;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MimeAttachNotifier {
	
	private String tempKey;
	public String getTempKey(){
		return this.tempKey;
	}
	
	private JavaMailSender mailSender;
	public void setMailSender(JavaMailSender mailSender){
		this.mailSender=mailSender;
	}
	
	public String sendMail(String email){
		MimeMessage message = mailSender.createMimeMessage();
		
		try{
			MimeMessageHelper messageHelper=new MimeMessageHelper(message,true,"utf-8");
			
			this.tempKey = getAuthKey(8);
			
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
	
	private String getAuthKey(int length) {
		String result = "";
		String keyChar = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789";

		for (int i = 0; i < length; i++) {
			int index = (int) (Math.random() * keyChar.length());
			result += keyChar.charAt(index);
		}

		return result;
	}
}
