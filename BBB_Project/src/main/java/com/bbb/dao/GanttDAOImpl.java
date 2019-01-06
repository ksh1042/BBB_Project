package com.bbb.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bbb.dto.GanttHistVO;
import com.bbb.dto.GanttVO;

public class GanttDAOImpl implements GanttDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public int selectGcNumSeqNextval() throws SQLException {
		return session.selectOne("Gantt.selectGcNumSeqNextval"); 
	}

	@Override
	public void createGanttChart(int gcNum) throws SQLException {
		session.update("Gantt.insertGC", gcNum);

	}

	@Override
	public List<GanttVO> selectGanttList(int gcNum) throws SQLException {
		return session.selectList("Gantt.selectGanttListByGcNum", gcNum);
	}

	@Override
	public void updateGanttCalendar(GanttVO gantt) throws SQLException {
		session.update("Gantt.updateGanttDateByUddNum", gantt);

	}

	@Override
	public void updateGanttPercentage(GanttVO gantt) throws SQLException {
		session.update("Gantt.updateGanttPercentageByUddNum", gantt);

	}
	@Override
	public Date selectMinStartDate(int gcNum) throws SQLException {
		return (Date)session.selectOne("Gantt.selectMinStartDateByGcNum", gcNum);
	}
	@Override
	public void deleteGanttDetailByUddNum(int uddNum) throws SQLException {
		session.update("Gantt.deleteGCD", uddNum);
		
	}
	@Override
	public void insertGanttDetail(GanttVO gantt) throws SQLException {
		session.update("Gantt.insertGCD", gantt);
		
	}
	@Override
	public void insertGanttHistory(GanttHistVO ganttHist) throws SQLException {
		session.update("Gantt.insertGCH", ganttHist);
	}
	@Override
	public void updateGanttDetail(GanttVO gantt) throws SQLException {
		session.update("Gantt.updateGCD", gantt);
	}

}
