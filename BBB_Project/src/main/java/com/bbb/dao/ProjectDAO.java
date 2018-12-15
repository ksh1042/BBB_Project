package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.ProjectVO;

public interface ProjectDAO {

	// 프로젝트의 모든 정보를 가져옴.
	List<ProjectVO> selectProjectList() throws SQLException;
	

}
