package com.bbb.dto;

public class BoardNotice {
	private int bNum;
	private int NoticeDate;
	
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public int getNoticeDate() {
		return NoticeDate;
	}
	public void setNoticeDate(int noticeDate) {
		NoticeDate = noticeDate;
	}
	
	@Override
	public String toString() {
		return "BoardNotice [bNum=" + bNum + ", NoticeDate=" + NoticeDate + "]";
	}
	
	
}
