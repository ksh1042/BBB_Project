package com.bbb.dto;

import java.util.Date;

public class IssueVO {

	private int iNum;
	private int openyn;
	private String title;
	private String writer;
	private Date indate;
	private Date updateDate;
	
	public int getiNum() {
		return iNum;
	}
	public void setiNum(int iNum) {
		this.iNum = iNum;
	}
	public int getOpenyn() {
		return openyn;
	}
	public void setOpenyn(int openyn) {
		this.openyn = openyn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	@Override
	public String toString() {
		return "IssueVO [iNum=" + iNum + ", openyn=" + openyn + ", title=" + title + ", writer=" + writer + ", indate="
				+ indate + ", updateDate=" + updateDate + "]";
	}
	
	
	
}
