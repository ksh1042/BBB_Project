package com.bbb.service;

import java.sql.SQLException;

import com.bbb.dto.ProjectVO;

public interface ProjectService {
	public void addProject(ProjectVO project) throws SQLException;
}
