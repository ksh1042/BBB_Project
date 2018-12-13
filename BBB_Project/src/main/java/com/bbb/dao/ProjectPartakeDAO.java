package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.ProjectPartakeVO;

public interface ProjectPartakeDAO {
	
	//프로젝트 리스트를 불러온다.
	List<ProjectPartakeVO> selectProjectList() throws SQLException;
	
	//개인별 참여한 프로젝트 목록
	ProjectPartakeVO selectProjectPartakeById(String id) throws SQLException;
	
	// 새로운 프로젝트 개설
	void insertNewProject()throws SQLException;
}
