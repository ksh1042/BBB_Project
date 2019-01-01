package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.ProjectPartakeVO;

public interface ProjectPartakeDAO {
	
	List<ProjectPartakeVO> selectBindingProject(String id) throws SQLException;
	
	//프로젝트 리스트를 불러온다.
	List<Integer> selectProjectPartakeList(String id) throws SQLException;
	
	List<ProjectPartakeVO> selectBindingMember(int pjNum) throws SQLException;

}
