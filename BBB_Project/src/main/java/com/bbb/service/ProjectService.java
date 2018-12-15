package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.SearchCriteria;
import com.bbb.dto.ProjectVO;

public interface ProjectService {

	public List<ProjectVO> searchProjectList(SearchCriteria cri) throws SQLException;
	public int searchProjectCount(SearchCriteria cri) throws Exception; 
}
