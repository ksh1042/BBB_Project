package com.bbb.dto;

import java.util.Date;

public class UseCaseVO {
	
	private String uUuid;
	private String fileName;
	private String savePath;
	private Date indate;
	private String content;
	
	public String getuUuid() {
		return uUuid;
	}
	public void setuUuid(String uUuid) {
		this.uUuid = uUuid;
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
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "UseCaseVO [uUuid=" + uUuid + ", fileName=" + fileName + ", savePath=" + savePath + ", indate=" + indate
				+ ", content=" + content + "]";
	}
	
	
}
