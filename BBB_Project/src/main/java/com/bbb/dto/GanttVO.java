package com.bbb.dto;

import java.util.Date;

public class GanttVO {
	private int 	gcNum;			// 간트차트 번호
	private Date 	indate;			// 간트차트 생성일
	private int 	uddNum;			// 간트/단위 상세 번호(PK&FK)
	private String 	udId;			// 단위업무 아이디
	private String 	udName;			// 단위업무명
	private String	udManager;
	private Date 	startDate;		// 단위업무 시작일
	private Date 	endDate;		// 단위업무 종료일
	private int 	percentage;		// 공정도
	private String	rdName;			// 요구사항상세번호
	public int getGcNum() {
		return gcNum;
	}
	public void setGcNum(int gcNum) {
		this.gcNum = gcNum;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	public int getUddNum() {
		return uddNum;
	}
	public void setUddNum(int uddNum) {
		this.uddNum = uddNum;
	}
	public String getUdId() {
		return udId;
	}
	public void setUdId(String udId) {
		this.udId = udId;
	}
	public String getUdName() {
		return udName;
	}
	public void setUdName(String udName) {
		this.udName = udName;
	}
	public String getUdManager() {
		return udManager;
	}
	public void setUdManager(String udManager) {
		this.udManager = udManager;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getPercentage() {
		return percentage;
	}
	public void setPercentage(int percentage) {
		this.percentage = percentage;
	}
	public String getRdName() {
		return rdName;
	}
	public void setRdName(String rdName) {
		this.rdName = rdName;
	}
	@Override
	public String toString() {
		return "GanttVO [gcNum=" + gcNum + ", indate=" + indate + ", uddNum=" + uddNum + ", udId=" + udId + ", udName="
				+ udName + ", udManager=" + udManager + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", percentage=" + percentage + ", rdName=" + rdName + "]";
	}
}
