package com.bbb.dto;

public class BoardAttachVO {

	private String uuid;
	private String savePath;
	private String fileName;
	private int kind;
	private int bNum;
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	@Override
	public String toString() {
		return "BoardAttachVO [uuid=" + uuid + ", savePath=" + savePath + ", fileName=" + fileName + ", kind=" + kind
				+ ", bNum=" + bNum + "]";
	}
	
	
	
	
}
