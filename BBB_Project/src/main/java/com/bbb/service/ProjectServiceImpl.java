package com.bbb.service;

import java.sql.SQLException;

import com.bbb.dao.ProjectDAO;
import com.bbb.dto.ProjectVO;

public class ProjectServiceImpl implements ProjectService {
	
	private ProjectDAO dao;
	public void setProjectDAO(ProjectDAO dao){
		this.dao = dao;
	}
	
	@Override
	public void addProject(ProjectVO project) throws SQLException {
		dao.insertProject(project);
	}

	@Override
	public String readVerifyProjectName(String name) throws SQLException {
		return dao.verifyProjectName(name);
	}

}
