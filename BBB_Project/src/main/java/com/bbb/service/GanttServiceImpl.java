package com.bbb.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dao.GanttDAO;
import com.bbb.dao.ProjectDAO;
import com.bbb.dto.GanttHistVO;
import com.bbb.dto.GanttVO;

public class GanttServiceImpl implements GanttService {

	
	private ProjectDAO projectDAO;
	public void setProjectDAO(ProjectDAO projectDAO){
		this.projectDAO = projectDAO;
	}
	
	private GanttDAO ganttDAO;
	public void setGanttDAO(GanttDAO ganttDAO) {
		this.ganttDAO = ganttDAO;
	}

	@Override
	public List<GanttVO> readGanttList(int gcNum) throws SQLException {
		return ganttDAO.selectGanttList(gcNum);
	}
	@Override
	public Date readMinDate(int gcNum) throws SQLException {
		return ganttDAO.selectMinStartDate(gcNum);
	}

	@Override
	public void updateGCD(List<GanttVO> ganttList, GanttHistVO ganttHist) throws SQLException {
		for(GanttVO gantt : ganttList){
			ganttDAO.updateGanttDetail(gantt);
		}
		ganttDAO.insertGanttHistory(ganttHist);
	}

	@Override
	public List<GanttHistVO> readUnitworkHistoryList(Criteria cri, int gcNum) throws SQLException {
		return ganttDAO.selectGanttHist(cri, gcNum);
	}

	@Override
	public int readUnitworkHistoryCount(int gcNum) throws SQLException {
		return ganttDAO.selectGanttHistCount(gcNum);
	}

}
