package com.bbb.dto;

import java.util.Date;

public class BoardVO {
	
	// 보드 번호
	private int bNum;
	
	// 프로젝트 번호
	private int pjNum;
	
	// 게시글 제목
	private String title;
	
	// 게시글 내용
	private String content;
	
	// 게시글 작성자
	private String writer;
	
	// 게시글 등록일
	private Date indate;
	
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
		return "BoardVO [bNum=" + bNum + ", pjNum=" + pjNum + ", title=" + title + ", content=" + content + ", writer="
				+ writer + ", indate=" + indate + ", updateDate=" + updateDate + ", kind=" + kind + ", count=" + count
				+ "]";
	}
	
	
	
	
	
}