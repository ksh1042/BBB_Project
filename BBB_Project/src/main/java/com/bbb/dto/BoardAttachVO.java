package com.bbb.dto;

public class BoardAttachVO {

	private String uUid;
	private String savePath;
	private String fileName;
	private int kind;
	private int bNum;
	
	public String getuUid() {
		return uUid;
	}
	public void setuUid(String uUid) {
		this.uUid = uUid;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
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
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	@Override
	public String toString() {
		return "BoardAttachVO [uUid=" + uUid + ", bNum=" + bNum + ", fileName=" + fileName + ", kind=" + kind
				+ ", savePath=" + savePath + "]";
	}
	
	
}
