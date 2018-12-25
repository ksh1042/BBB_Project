package com.bbb.dto;

import java.util.Date;

public class PostboxVO {
	
	private int pbNum;
	private int pbfNum;
	private String id;
	private String content;
	private String writer;
	private Date indate;
	private int visibility;
	
	
	
	public int getPbNum() {
		return pbNum;
	}



	public void setPbNum(int pbNum) {
		this.pbNum = pbNum;
	}



	public int getPbfNum() {
		return pbfNum;
	}



	public void setPbfNum(int pbfNum) {
		this.pbfNum = pbfNum;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
	}



	public Date getIndate() {
		return indate;
	}



	public void setIndate(Date indate) {
		this.indate = indate;
	}



	public int getVisibility() {
		return visibility;
	}



	public void setVisibility(int visibility) {
		this.visibility = visibility;
	}



	@Override
	public String toString() {
		return "PostboxVO [pbNum=" + pbNum + ", pbfNum=" + pbfNum + ", id=" + id + ", content=" + content + ", writer="
				+ writer + ", indate=" + indate + ", visibility=" + visibility + "]";
	}
	
}
