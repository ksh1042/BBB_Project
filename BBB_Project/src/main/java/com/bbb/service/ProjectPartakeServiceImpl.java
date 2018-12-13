package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bbb.dao.ProjectPartakeDAO;
import com.bbb.dto.ProjectPartakeVO;

public class ProjectPartakeServiceImpl implements ProjectPartakeService {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	private ProjectPartakeDAO projectPartakeDAO;
	public void setProjectPartakeDAO(ProjectPartakeDAO projectPartakeDAO){
		this.projectPartakeDAO = projectPartakeDAO;
	}
	
	@Override
	public List<ProjectPartakeVO> getProjectList() throws SQLException {
		List<ProjectPartakeVO> projectList = projectPartakeDAO.selectProjectList();
		return projectList;
	}

	@Override
	public ProjectPartakeVO getProjectById(String id, int pjNum) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
