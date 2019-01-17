package com.bbb.dto;

import java.util.Date;

public class UseCaseReplyVO {
	private int urNum;
	private String uuuid;
	private String writer;
	private String content;
	private Date indate;
	private String image;
	public int getUrNum() {
		return urNum;
	}
	public void setUrNum(int urNum) {
		this.urNum = urNum;
	}
	public String getUuuid() {
		return uuuid;
	}
	public void setUuuid(String uuuid) {
		this.uuuid = uuuid;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "UseCaseReplyVO [urNum=" + urNum + ", uuuid=" + uuuid + ", writer=" + writer + ", content=" + content
				+ ", indate=" + indate + ", image=" + image + "]";
	}
	
	
	
}
