package com.bbb.dao;



import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.SearchCriteria;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.ProjectPlanVO;
import com.bbb.dto.ProjectVO;

public interface ProjectDAO {

	public int pjNumSeq() throws SQLException;
	
	public List<ProjectVO> searchProjectList(SearchCriteria cri) throws SQLException;
	public int searchProjectCount(SearchCriteria cri) throws SQLException;
	public void searchProjectJoin(ProjectPartakeVO takeVO) throws SQLException;
	

	// 프로젝트의 모든 정보를 가져옴.
	List<ProjectVO> selectProjectList() throws SQLException;
	public void insertPlan(ProjectVO project) throws SQLException;
	
	
	public void insertProject(ProjectVO project) throws SQLException;
	public void insertProjectake(ProjectPartakeVO takeVO) throws SQLException;
	public String verifyProjectName(String name) throws SQLException;
	
	public void deletePlan(int pjNum) throws SQLException;

	public ProjectVO getProjectMain(int pjNum) throws SQLException;
	
	public void insertUdNum(ProjectVO project) throws SQLException;
}
