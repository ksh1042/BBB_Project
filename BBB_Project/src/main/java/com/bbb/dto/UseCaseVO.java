package com.bbb.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UseCaseVO {
	
	private String uuuid;
	private String fileName;
	private String savePath;
	private String writer;
	private Date indate;
	
	private List<UseCaseVO> attachList=new ArrayList<UseCaseVO>();

	public String getUuuid() {
		return uuuid;
	}

	public void setUuuid(String uuuid) {
		this.uuuid = uuuid;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getIndate() {
		return indate;
	}

	public void setIndate(Date indate) {
		this.indate = indate;
	}

	public List<UseCaseVO> getAttachList() {
		return attachList;
	}

	public void setAttachList(List<UseCaseVO> attachList) {
		this.attachList = attachList;
	}

	@Override
	public String toString() {
		return "UseCaseVO [uuuid=" + uuuid + ", fileName=" + fileName + ", savePath=" + savePath + ", writer=" + writer
				+ ", indate=" + indate + ", attachList=" + attachList + "]";
	}

	

	
}
