package com.bbb.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RequirementHistVO {	
	private int 	rdNum;			// 요구사항 문서 ID
	private Date 	updateDate;		// 요구사항 문서 수정 발생일
	private String 	comm;			// 요구사항 문서 변경내용 요약
	private List<RequirementVO> requireList = new ArrayList<RequirementVO>();
	private List<Integer> deleteList = new ArrayList<Integer>();
	
	public List<Integer> getDeleteList() {
		return deleteList;
	}
	public void setDeleteList(List<Integer> deleteList) {
		this.deleteList = deleteList;
	}
	public List<RequirementVO> getRequireList() {
		return requireList;
	}
	public void setRequireList(List<RequirementVO> requireList) {
		this.requireList = requireList;
	}
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
		return "RequirementHistVO [rdNum=" + rdNum + ", updateDate=" + updateDate + ", comm=" + comm + ", requireList="
				+ requireList + "]";
	}
	
}
