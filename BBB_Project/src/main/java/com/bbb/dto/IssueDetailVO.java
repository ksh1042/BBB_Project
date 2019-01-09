package com.bbb.dto;

import java.util.Date;

public class IssueDetailVO {

	private int idNum;
	private String writer;
	private String content;
	private Date indate;
	private Date updateDate;
	private int iNum;
	private int deleteYn;
	
	public int getIdNum() {
		return idNum;
	}
	public void setIdNum(int idNum) {
		this.idNum = idNum;
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
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public int getiNum() {
		return iNum;
	}
	public void setiNum(int iNum) {
		this.iNum = iNum;
	}
	public int getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(int deleteYn) {
		this.deleteYn = deleteYn;
	}
	
	@Override
	public String toString() {
		return "IssueDetailVO [idNum=" + idNum + ", writer=" + writer + ", content=" + content + ", indate=" + indate
				+ ", updateDate=" + updateDate + ", iNum=" + iNum + ", deleteYn=" + deleteYn + "]";
	}
	
	
	
	
	
}
