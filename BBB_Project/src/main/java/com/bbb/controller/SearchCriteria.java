package com.bbb.controller;

public class SearchCriteria extends Criteria {

	private String searchType;
	private String keyword;
	private int pjNum;
	
	public String getSearchType() {
		return searchType;
	}


	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public int getPjNum() {
		return pjNum;
	}


	public void setPjNum(int pjNum) {
		this.pjNum = pjNum;
	}


	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", pjNum=" + pjNum + "]";
	}



	
	
	
	
	

}
