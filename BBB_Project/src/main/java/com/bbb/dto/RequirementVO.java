package com.bbb.dto;

import java.util.Date;

public class RequirementVO {
	private int 	 rdNum;			// 요구사항 문서 번호
	private Date 	 indate;		// 요구사항 문서 작성일
	private String 	 rdId;			// 요구사항 아이디
	private	String 	 rdName;		// 요구사항 이름
	private String 	 rdContent;		// 요구사항 내용
	private String 	 limit;			// 요구사항 제한사항(권한...)
	private String 	 interf;		// 요구사항 인터페이스(View, 화면 등...)
	private int		 acceptyn;		// 요구사항 수용여부
	private String	 manager;		// 요구사항 담당자
	public int getRdNum() {
		return rdNum;
	}
	public void setRdNum(int rdNum) {
		this.rdNum = rdNum;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	public String getRdId() {
		return rdId;
	}
	public void setRdId(String rdId) {
		this.rdId = rdId;
	}
	public String getRdName() {
		return rdName;
	}
	public void setRdName(String rdName) {
		this.rdName = rdName;
	}
	public String getRdContent() {
		return rdContent;
	}
	public void setRdContent(String rdContent) {
		this.rdContent = rdContent;
	}
	public String getLimit() {
		return limit;
	}
	public void setLimit(String limit) {
		this.limit = limit;
	}
	public String getInterf() {
		return interf;
	}
	public void setInterf(String interf) {
		this.interf = interf;
	}
	public int getAcceptyn() {
		return acceptyn;
	}
	public void setAcceptyn(int acceptyn) {
		this.acceptyn = acceptyn;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	@Override
	public String toString() {
		return "RequirementVO [rdNum=" + rdNum + ", indate=" + indate + ", rdId=" + rdId + ", rdName=" + rdName
				+ ", rdContent=" + rdContent + ", limit=" + limit + ", interf=" + interf + ", acceptyn=" + acceptyn
				+ ", manager=" + manager + "]";
	}
}
