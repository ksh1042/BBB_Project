package com.bbb.dto;

import java.util.Date;

public class QnaReplyVO {
	private int qarNum;
	private int qaNum;
	private String rContents;
	private String writer;
	private Date indate;
	
	public int getQarNum() {
		return qarNum;
	}
	public void setQarNum(int qarNum) {
		this.qarNum = qarNum;
	}
	public int getQaNum() {
		return qaNum;
	}
	public void setQaNum(int qaNum) {
		this.qaNum = qaNum;
	}
	public String getrContents() {
		return rContents;
	}
	public void setrContents(String rContents) {
		this.rContents = rContents;
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
	@Override
	public String toString() {
		return "QnaReplyVO [qarNum=" + qarNum + ", qaNum=" + qaNum + ", rContents=" + rContents + ", writer=" + writer
				+ ", indate=" + indate + "]";
	}
	
	
}
