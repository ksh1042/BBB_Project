package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.ProjectPartakeVO;

public interface ProjectPartakeService {

	List<ProjectPartakeVO> getProjectList() throws SQLException;
	
	ProjectPartakeVO getProjectById(String id, int pjNum) throws SQLException;
}
