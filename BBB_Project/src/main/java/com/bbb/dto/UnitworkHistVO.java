package com.bbb.dto;

import java.util.Date;

public class UnitworkHistVO {
	
	private int 	udNum;			// 단위업무 문서 ID
	private Date 	updateDate;		// 단위업무 문서 수정 발생일
	private String 	comm;			// 단위업무 문서 변경내용 요약
	
	public int getUdNum() {
		return udNum;
	}
	public void setUdNum(int udNum) {
		this.udNum = udNum;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getComm() {
		return comm;
	}
	public void setComm(String comm) {
		this.comm = comm;
	}
	
	@Override
	public String toString() {
		return "UnitworkHistVO [udNum=" + udNum + ", updateDate=" + updateDate + ", comm=" + comm + ", getUdNum()="
				+ getUdNum() + ", getUpdateDate()=" + getUpdateDate() + ", getComm()=" + getComm() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
