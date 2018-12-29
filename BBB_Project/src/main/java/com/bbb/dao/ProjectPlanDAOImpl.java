package com.bbb.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.bbb.dto.ProjectPlanVO;

public class ProjectPlanDAOImpl implements ProjectPlanDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void insertAttach(ProjectPlanVO planVO) throws SQLException {
		session.update("projectPlan.insertPlan",planVO);
	}

	@Override
	public ProjectPlanVO getPlan(String puuid) throws SQLException {
		ProjectPlanVO plan = session.selectOne("projectPlan.getPlanByPuuid", puuid);
		return plan;
	}

}
