package com.bbb.dto;

import java.util.Date;

public class QnaVO {

	private int qaNum;
	private String title;
	private String content;
	private String writer;
	private Date indate;
	private int viewcnt;
	public int getQaNum() {
		return qaNum;
	}
	public void setQaNum(int qaNum) {
		this.qaNum = qaNum;
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
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	@Override
	public String toString() {
		return "QnaVO [qaNum=" + qaNum + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", indate=" + indate + ", viewcnt=" + viewcnt + "]";
	}
	
	
	
}
