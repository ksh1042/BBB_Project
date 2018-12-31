package com.bbb.dto;

import java.util.Date;

public class NoticeVO {
	private int nNum;
	//공지번호
	private String title;
	//제목
	private String content;
	//내용
	private Date indate;
	//작성일
	private Date expireDate;
	//공지만료일
	private int kind;
	//공지구분
	public int getnNum() {
		return nNum;
	}
	public void setnNum(int nNum) {
		this.nNum = nNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	public Date getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(Date expireDate) {
		this.expireDate = expireDate;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	
	@Override
	public String toString() {
		return "Notice [nNum=" + nNum + ", title=" + title + ", content=" + content + ", indate=" + indate
				+ ", expireDate=" + expireDate + ", kind=" + kind + "]";
	}
	
	
	
}
