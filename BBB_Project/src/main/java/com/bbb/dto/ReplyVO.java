package com.bbb.dto;

import java.util.Date;

public class ReplyVO {
	private int rNum;
	private int bNum;
	private String content;
	private String writer;
	private Date indate;
	private Date updateDate;
	private int deleteyn;
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
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
	public int getDeleteyn() {
		return deleteyn;
	}
	public void setDeleteyn(int deleteyn) {
		this.deleteyn = deleteyn;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [rNum=" + rNum + ", bNum=" + bNum + ", content=" + content + ", writer=" + writer + ", indate="
				+ indate + ", updateDate=" + updateDate + ", deleteyn=" + deleteyn + "]";
	}
	
	
}
