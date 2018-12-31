package com.bbb.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProjectPlanVO {

	private String puuid;
	private String fileName;
	private String savePath;
	private String fileType;
	private Date indate;
	private List<ProjectPlanVO> attachList = new ArrayList<ProjectPlanVO>();
	
	public String getPuuid() {
		return puuid;
	}
	public void setPuuid(String puuid) {
		this.puuid = puuid;
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
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
	public List<ProjectPlanVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<ProjectPlanVO> attachList) {
		this.attachList = attachList;
	}
	@Override
	public String toString() {
		return "ProjectPlanVO [puuid=" + puuid + ", fileName=" + fileName + ", savePath=" + savePath + ", fileType="
				+ fileType + ", indate=" + indate + "]";
	}
	
	
	
	
}
