package com.bbb.dto;

import java.util.Date;

public class MemberVO {
	
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String phone;
	private Date indate;
	private int operatoryn;			// 관리자 여부
	private int emailyn;			// 이메일 활성화 여부
	private String image;			// 사용자 프로필 이미지 경로
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	public int getOperatoryn() {
		return operatoryn;
	}
	public void setOperatoryn(int operatoryn) {
		this.operatoryn = operatoryn;
	}
	public int getEmailyn() {
		return emailyn;
	}
	public void setEmailyn(int emailyn) {
		this.emailyn = emailyn;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", phone=" + phone
				+ ", indate=" + indate + ", operatoryn=" + operatoryn + ", emailyn=" + emailyn + ", image=" + image
				+ "]";
	}
	
	
	
}
