package com.bbb.dto;

import java.util.Date;

public class GanttHistVO {
	private int rownum;			// 행번호
	private int gcNum;			// 간트차트 번호
	private Date updateDate;	// 수정발생일
	private String comm;		// 수정사항 코멘트
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getGcNum() {
		return gcNum;
	}
	public void setGcNum(int gcNum) {
		this.gcNum = gcNum;
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
		return "GanttHistVO [rownum=" + rownum + ", gcNum=" + gcNum + ", updateDate=" + updateDate + ", comm=" + comm
				+ "]";
	}
}
