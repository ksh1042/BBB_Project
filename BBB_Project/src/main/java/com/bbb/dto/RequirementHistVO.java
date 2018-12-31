package com.bbb.dto;

import java.util.Date;

public class RequirementHistVO {	
	private int 	rdNum;			// 요구사항 문서 ID
	private Date 	updateDate;		// 요구사항 문서 수정 발생일
	private String 	comm;			// 요구사항 문서 변경내용 요약
	public int getRdNum() {
		return rdNum;
	}
	public void setRdNum(int rdNum) {
		this.rdNum = rdNum;
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
		return "RequirementVO [rdNum=" + rdNum + ", updateDate=" + updateDate + ", comm=" + comm + "]";
	}
}
