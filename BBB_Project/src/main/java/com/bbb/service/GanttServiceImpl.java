package com.bbb.service;

import java.sql.SQLException;
import java.util.Date;

import com.bbb.dao.ProjectDAO;
import com.bbb.dto.ProjectVO;

public class GanttServiceImpl implements GanttService {

	
	private ProjectDAO projectDAO;
	public void setProjectDAO(ProjectDAO projectDAO){
		this.projectDAO = projectDAO;
	}
	
	@Override
	public long getMinusDateCount(int pjNum) throws SQLException {
		ProjectVO project = projectDAO.getProjectMain(pjNum);
		Date start = project.getStartDate();
		Date end = project.getEndDate();
		
		long minusValue = end.getTime() - start.getTime();
		long result = minusValue / (24 * 60 * 60 * 1000) ;
		return result;
	}

}
