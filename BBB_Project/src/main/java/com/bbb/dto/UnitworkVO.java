package com.bbb.dto;

import java.util.Date;

public class UnitworkVO {
	
	private int			rownum;
	// tb_requirement_definition
	private int			udNum;					// 단위업무 문서 ID
	private Date		indate;					// 단위업무 문서 생성일
	// tb_requirement_definition_detail
	private int 		uddNum;					// 단위업무 상세 ID
	private int 		rddNum;					// 요구사항 상세 참조 ID
	private String		udId;					// 단위업무 ID
	private String 		udName;					// 단위업무 명
	private String 		rdId;					// (이전문서 참조) 요구사항 ID
	private String 		rdName;					// (이전문서 참조) 요구사항 명
	private String 		udManager;				// 단위업무 담당자 ID(이름)
	private Date 		extDate;				// 외부설계 완료일자
	private Date 		intDate;				// 내부설계 완료일자
	private Date		pdDate;					// 프로그램 설계 완료일자
	private Date 		devDate;				// 개발 완료일자
	private int 		estmate;				// 예상 Step 수
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getUdNum() {
		return udNum;
	}
	public void setUdNum(int udNum) {
		this.udNum = udNum;
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
	public int getRddNum() {
		return rddNum;
	}
	public void setRddNum(int rddNum) {
		this.rddNum = rddNum;
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
	public String getUdManager() {
		return udManager;
	}
	public void setUdManager(String udManager) {
		this.udManager = udManager;
	}
	public Date getExtDate() {
		return extDate;
	}
	public void setExtDate(Date extDate) {
		this.extDate = extDate;
	}
	public Date getIntDate() {
		return intDate;
	}
	public void setIntDate(Date intDate) {
		this.intDate = intDate;
	}
	public Date getPdDate() {
		return pdDate;
	}
	public void setPdDate(Date pdDate) {
		this.pdDate = pdDate;
	}
	public Date getDevDate() {
		return devDate;
	}
	public void setDevDate(Date devDate) {
		this.devDate = devDate;
	}
	public int getEstmate() {
		return estmate;
	}
	public void setEstmate(int estmate) {
		this.estmate = estmate;
	}
	@Override
	public String toString() {
		return "UnitworkVO [rownum=" + rownum + ", udNum=" + udNum + ", indate=" + indate + ", uddNum=" + uddNum
				+ ", rddNum=" + rddNum + ", udId=" + udId + ", udName=" + udName + ", rdId=" + rdId + ", rdName="
				+ rdName + ", udManager=" + udManager + ", extDate=" + extDate + ", intDate=" + intDate + ", pdDate="
				+ pdDate + ", devDate=" + devDate + ", estmate=" + estmate + "]";
	}
	
}
