package com.bbb.dto;

import java.util.Date;

public class FinanceDetailVO {
	
	private int fNum;
	private String targetName;
	private String content;
	private int price;
	private String writer;
	private int depositYn;
	private Date indate;
	private Date regDate;
	
	public int getfNum() {
		return fNum;
	}
	public void setfNum(int fNum) {
		this.fNum = fNum;
	}
	public String getTargetName() {
		return targetName;
	}
	public void setTargetName(String targetName) {
		this.targetName = targetName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getDepositYn() {
		return depositYn;
	}
	public void setDepositYn(int depositYn) {
		this.depositYn = depositYn;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "FinanceDetailVO [fNum=" + fNum + ", targetName=" + targetName + ", content=" + content + ", price="
				+ price + ", writer=" + writer + ", depositYn=" + depositYn + ", indate=" + indate + ", regDate="
				+ regDate + "]";
	}

	
	
}
