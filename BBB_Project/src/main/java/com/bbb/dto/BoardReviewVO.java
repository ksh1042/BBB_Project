package com.bbb.dto;

import java.util.Date;

public class BoardReviewVO {
	private int rnum;
	private int bnum;
	private String content;
	private String writer;
	private Date indate;
	private Date updatedate;
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
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
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	@Override
	public String toString() {
		return "BoardReviewVO [rnum=" + rnum + ", bnum=" + bnum + ", content=" + content + ", writer=" + writer
				+ ", indate=" + indate + ", updatedate=" + updatedate + "]";
	}
	
	
}
