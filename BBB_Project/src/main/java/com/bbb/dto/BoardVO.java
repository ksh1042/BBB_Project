package com.bbb.dto;

import java.util.Date;

public class BoardVO {
	
	private int bNum;
	private int pjNum;
	private String title;
	private String content;
	private Date inDate;
	private Date updateDate;
	private int kind;
	private int count;
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public int getPjNum() {
		return pjNum;
	}
	public void setPjNum(int pjNum) {
		this.pjNum = pjNum;
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
	public Date getInDate() {
		return inDate;
	}
	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "BoardVO [bNum=" + bNum + ", pjNum=" + pjNum + ", title=" + title + ", content=" + content + ", inDate="
				+ inDate + ", updateDate=" + updateDate + ", kind=" + kind + ", count=" + count + "]";
	}
	
	
}
