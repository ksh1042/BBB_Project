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
	
	
	
	@Override
	public String toString() {
		return "ProjectVO [pjNum=" + pjNum + ", name=" + name + ", disc=" + disc + ", creator=" + creator
				+ ", visibility=" + visibility + ", lastDate=" + lastDate + ", indate=" + indate + ", startDate="
				+ startDate + ", endDate=" + endDate + ", getPjNum()=" + getPjNum() + ", getName()=" + getName()
				+ ", getDisc()=" + getDisc() + ", getCreator()=" + getCreator() + ", getVisibility()=" + getVisibility()
				+ ", getLastDate()=" + getLastDate() + ", getIndate()=" + getIndate() + ", getStartDate()="
				+ getStartDate() + ", getEndDate()=" + getEndDate() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
}
