package com.bbb.dto;

public class FinanceVO {
	
	private int fNum;
	private int total;
	
	public int getfNum() {
		return fNum;
	}
	public void setfNum(int fNum) {
		this.fNum = fNum;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "FinanceVO [fNum=" + fNum + ", total=" + total + "]";
	}
	
	
}
