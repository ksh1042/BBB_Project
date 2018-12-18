package com.bbb.dto;

public class BoardAttachVO {
	
	private String uuid;
	//uuid
	private int bnum;
	//글 번호
	private String filename;
	//파일 이름
	private int kind;
	//파일 구분
	private String savepath;
	//저장경로
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public String getSavepath() {
		return savepath;
	}
	public void setSavepath(String savepath) {
		this.savepath = savepath;
	}
	
	@Override
	public String toString() {
		return "BoardAttachVO [uuid=" + uuid + ", bnum=" + bnum + ", filename=" + filename + ", kind=" + kind
				+ ", savepath=" + savepath + "]";
	}
	
	
}
