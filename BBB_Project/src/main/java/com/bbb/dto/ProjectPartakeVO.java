package com.bbb.dto;

import java.util.Date;

public class ProjectPartakeVO {
		
		private String id;
		private int pjNum;
		private Date lastDate;
		private int assignYn;
		
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public int getPjNum() {
			return pjNum;
		}
		public void setPjNum(int pjNum) {
			this.pjNum = pjNum;
		}
		public Date getLastDate() {
			return lastDate;
		}
		public void setLastDate(Date lastDate) {
			this.lastDate = lastDate;
		}
		public int getAssignYn() {
			return assignYn;
		}
		public void setAssignYn(int assignYn) {
			this.assignYn = assignYn;
		}
		@Override
		public String toString() {
			return "ProjectPartake [id=" + id + ", pjNum=" + pjNum + ", lastDate=" + lastDate + ", assignYn=" + assignYn
					+ "]";
		}
		
}
