package com.bbb.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.GanttHistVO;
import com.bbb.dto.GanttVO;

public interface GanttService {
	public List<GanttVO> readGanttList(int gcNum) throws SQLException;
	public Date readMinDate(int gcNum) throws SQLException;
	
	public void updateGCD(List<GanttVO> ganttList, GanttHistVO ganttHist) throws SQLException;
	public List<GanttHistVO> readUnitworkHistoryList(Criteria cri, int gcNum) throws SQLException;
	public int readUnitworkHistoryCount(int gcNum) throws SQLException;
}