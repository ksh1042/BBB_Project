package com.bbb.criteria;

public class Criteria {

	private int page = 1;
	private int perPageNum = 10;
	
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
		if(perPageNum <= 0 || perPageNum > 50){
			this.perPageNum = perPageNum;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	// 각 페이지에 시작되는 페이지 시작번호  ex)1페이지 1~10 2페이지 11~20 3페이지 21~30
	public int getPageStart(){
		return(this.page - 1) * perPageNum;
	}
	
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	
}
