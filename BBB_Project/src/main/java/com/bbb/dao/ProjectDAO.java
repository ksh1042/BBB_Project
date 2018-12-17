package com.bbb.dao;



import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.SearchCriteria;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.ProjectVO;

public interface ProjectDAO {

	public List<ProjectVO> searchProjectList(SearchCriteria cri) throws SQLException;
	public int searchProjectCount(SearchCriteria cri) throws Exception;
	public void searchProjectJoin(ProjectPartakeVO takeVO) throws Exception;
}
