package com.bbb.dto;

import java.util.Date;

public class BoardNoticeVO {
	
	private int bNum;
	private Date noticeDate;
	
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	
	@Override
	public String toString() {
		return "BoardNoticeVO [bNum=" + bNum + ", noticeDate=" + noticeDate + "]";
	}
	
	
}
