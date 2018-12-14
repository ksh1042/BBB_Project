package com.bbb.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.bbb.dto.ProjectVO;

public class ProjectDAOImpl implements ProjectDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session){
		this.session = session;
	}
	
	@Override
	public void insertProject(ProjectVO project) throws SQLException {
		// TODO Auto-generated method stub
		session.update("Project.insertProject", project);
	}

}
