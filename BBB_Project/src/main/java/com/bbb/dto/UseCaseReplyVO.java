package com.bbb.dto;

public class UseCaseReplyVO {
	private int urNum;
	private String uuuid;
	private String writer;
	private String content;
	public int getUrNum() {
		return urNum;
	}
	public void setUrNum(int urNum) {
		this.urNum = urNum;
	}
	public String getUuuid() {
		return uuuid;
	}
	public void setUuuid(String uuuid) {
		this.uuuid = uuuid;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "UseCaseReplyVO [urNum=" + urNum + ", uuuid=" + uuuid + ", writer=" + writer + ", content=" + content
				+ "]";
	}
	
	
}
