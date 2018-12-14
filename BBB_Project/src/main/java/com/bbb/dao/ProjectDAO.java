package com.bbb.dao;

import java.sql.SQLException;

import com.bbb.dto.ProjectVO;

public interface ProjectDAO {
	public void insertProject(ProjectVO project) throws SQLException;
}
