package com.bbb.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.GanttHistVO;
import com.bbb.dto.GanttVO;

public interface GanttDAO {
	public int selectGcNumSeqNextval() throws SQLException;
	public void createGanttChart(int gcNum) throws SQLException;
	public List<GanttVO> selectGanttList(int gcNum) throws SQLException;
	public void updateGanttCalendar(GanttVO gantt) throws SQLException;
	public void updateGanttPercentage(GanttVO gantt) throws SQLException;
	public Date selectMinStartDate(int gcNum) throws SQLException;
	public void deleteGanttDetailByUddNum(int uddNum) throws SQLException;
	public void insertGanttDetail(GanttVO gantt) throws SQLException;
	public void insertGanttHistory(GanttHistVO ganttHist) throws SQLException;
	public void updateGanttDetail(GanttVO gantt) throws SQLException;
	public List<GanttHistVO> selectGanttHist(Criteria cri, int gcNum) throws SQLException;
	public int selectGanttHistCount(int gcNum) throws SQLException;
}
