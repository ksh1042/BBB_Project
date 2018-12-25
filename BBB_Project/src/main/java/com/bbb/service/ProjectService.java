package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.ProjectVO;

public interface ProjectService {

	// 프로젝트VO의 모든 정보를 가져와서 비교할때 쓰려고 가져옴 ㅅㅂ
	List<ProjectVO> readMyProjectList(String id) throws SQLException;
	
	
	// 어드민에서 프로젝트 관리를 위해 사용
	List<ProjectVO> allProjectList() throws SQLException;
	
}
