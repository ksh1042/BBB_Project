package com.bbb.dto;

import java.util.Date;

public class IssueVO {

	private int iNum;
	private int pjNum;
	private int openyn;
	private String title;
	private String content;
	private String writer;
	private Date indate;
	private Date updateDate;
	private int rowNum;
	
	public int getiNum() {
		return iNum;
	}
	public void setiNum(int iNum) {
		this.iNum = iNum;
	}
	public int getPjNum() {
		return pjNum;
	}
	public void setPjNum(int pjNum) {
		this.pjNum = pjNum;
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
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	
	@Override
	public String toString() {
		return "IssueVO [iNum=" + iNum + ", pjNum=" + pjNum + ", openyn=" + openyn + ", title=" + title + ", content="
				+ content + ", writer=" + writer + ", indate=" + indate + ", updateDate=" + updateDate + ", rowNum="
				+ rowNum + "]";
	}
	
	
	
	
	
	
	
}
