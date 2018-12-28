package com.bbb.dto;

import java.util.Date;

public class ProjectVO {

	private int pjNum;
	private String name;
	private String disc;
	private String creator;
	private int visibility;
	private Date lastDate;
	private Date indate;
	private Date startDate;
	private Date endDate;
	private int cNum;
	private int fNum;
	private String uuuid;
	private String puuid;
	private int rdNum;
	private int udNum;
	private int gcNum;
	private int pkNum;
	
	public int getPjNum() {
		return pjNum;
	}
	public void setPjNum(int pjNum) {
		this.pjNum = pjNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDisc() {
		return disc;
	}
	public void setDisc(String disc) {
		this.disc = disc;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public int getVisibility() {
		return visibility;
	}
	public void setVisibility(int visibility) {
		this.visibility = visibility;
	}
	public Date getLastDate() {
		return lastDate;
	}
	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
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
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public int getfNum() {
		return fNum;
	}
	public void setfNum(int fNum) {
		this.fNum = fNum;
	}
	public String getUuuid() {
		return uuuid;
	}
	public void setUuuid(String uuuid) {
		this.uuuid = uuuid;
	}
	public String getPuuid() {
		return puuid;
	}
	public void setPuuid(String puuid) {
		this.puuid = puuid;
	}
	public int getRdNum() {
		return rdNum;
	}
	public void setRdNum(int rdNum) {
		this.rdNum = rdNum;
	}
	public int getUdNum() {
		return udNum;
	}
	public void setUdNum(int udNum) {
		this.udNum = udNum;
	}
	public int getGcNum() {
		return gcNum;
	}
	public void setGcNum(int gcNum) {
		this.gcNum = gcNum;
	}
	public int getPkNum() {
		return pkNum;
	}
	public void setPkNum(int pkNum) {
		this.pkNum = pkNum;
	}
	
	@Override
	public String toString() {
		return "ProjectVO [pjNum=" + pjNum + ", name=" + name + ", disc=" + disc + ", creator=" + creator
				+ ", visibility=" + visibility + ", lastDate=" + lastDate + ", indate=" + indate + ", startDate="
				+ startDate + ", endDate=" + endDate + ", cNum=" + cNum + ", fNum=" + fNum + ", uuuid=" + uuuid
				+ ", puuid=" + puuid + ", rdNum=" + rdNum + ", udNum=" + udNum + ", gcNum=" + gcNum + ", pkNum=" + pkNum
				+ "]";
	}
	
	
}
