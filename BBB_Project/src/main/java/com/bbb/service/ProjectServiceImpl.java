package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.SearchCriteria;
import com.bbb.dao.ProjectDAO;
import com.bbb.dto.ProjectVO;

public class ProjectServiceImpl implements ProjectService{

	private ProjectDAO projectDAO;
	public void setProjectDAO(ProjectDAO projectDAO){
		this.projectDAO = projectDAO;
	}
	
	@Override
	public List<ProjectVO> searchProjectList(SearchCriteria cri) throws SQLException {
		List<ProjectVO> searchPList = projectDAO.searchProjectList(cri);
		return searchPList;
	}

	@Override
	public int searchProjectCount(SearchCriteria cri) throws Exception {
		int count = projectDAO.searchProjectCount(cri);
		return count;
	}

}
