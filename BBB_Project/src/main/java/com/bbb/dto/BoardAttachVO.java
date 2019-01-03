package com.bbb.dto;

public class BoardAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private int fileType;
	private int bNum;
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getFileType() {
		return fileType;
	}
	public void setFileType(int fileType) {
		this.fileType = fileType;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	@Override
	public String toString() {
		return "BoardAttachVO [uuid=" + uuid + ", uploadPath=" + uploadPath + ", fileName=" + fileName + ", fileType="
				+ fileType + ", bNum=" + bNum + "]";
	}
	
	
	
	
	
}
