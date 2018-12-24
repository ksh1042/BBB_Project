package com.bbb.controller;

public class Criteria {
	
	private int page 		= 0;
	private int perPageNum 	= 10;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page <= 0){
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum > 50 || perPageNum <= 0){
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPageStart() {
		return (this.page -1) * perPageNum +1;
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
}
