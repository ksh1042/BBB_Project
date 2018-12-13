package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectPartakeVO;

public class ProjectPartakeDAOImpl implements ProjectPartakeDAO {

	
	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ProjectPartakeVO> selectProjectList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProjectPartakeVO selectProjectPartakeById(String id) throws SQLException {
		ProjectPartakeVO project = session.selectOne(id);
		return project;
	}

	@Override
	public void insertNewProject() throws SQLException {
		// TODO Auto-generated method stub

	}

}
