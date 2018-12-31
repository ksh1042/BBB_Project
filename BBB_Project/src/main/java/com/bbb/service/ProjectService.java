package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.SearchCriteria;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.ProjectVO;

public interface ProjectService {

	public List<ProjectVO> searchProjectList(SearchCriteria cri) throws SQLException;
	public int searchProjectCount(SearchCriteria cri) throws Exception;
	public void joinProject(ProjectPartakeVO takeVO) throws Exception;
	
	// 프로젝트VO의 모든 정보를 가져와서 비교할때 쓰려고 가져옴 ㅅㅂ
	List<ProjectVO> readMyProjectList(String id) throws SQLException;
	List<ProjectPartakeVO> getBindingProject(String id) throws SQLException;
	// 어드민에서 프로젝트 관리를 위해 사용
	List<ProjectVO> allProjectList() throws SQLException;

	
	public void addProject(ProjectVO project) throws SQLException;
	public String readVerifyProjectName(String name) throws SQLException;

	public ProjectVO projectMain(int pjNum) throws SQLException;
}
