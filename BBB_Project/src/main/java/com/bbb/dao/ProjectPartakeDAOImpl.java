package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bbb.dto.ProjectPartakeVO;

public class ProjectPartakeDAOImpl implements ProjectPartakeDAO {

	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<Integer> selectProjectPartakeList(String id) throws SQLException {
		return session.selectList("ProjectPartake.selectProjectPartakeList", id);
	}

	@Override
	public List<ProjectPartakeVO> selectBindingProject(String id) throws SQLException {
		return session.selectList("ProjectPartake.selectBindingProject",id);
	}

}
