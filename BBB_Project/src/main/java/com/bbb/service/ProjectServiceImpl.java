package com.bbb.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bbb.controller.SearchCriteria;
import com.bbb.dao.ProjectDAO;
import com.bbb.dao.ProjectPartakeDAO;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.ProjectPlanVO;
import com.bbb.dto.ProjectVO;

public class ProjectServiceImpl implements ProjectService{

	private ProjectDAO projectDAO;
	public void setProjectDAO(ProjectDAO projectDAO){
		this.projectDAO = projectDAO;
	}
	
	private ProjectPartakeDAO projectPartakeDAO;
	public void setProjectPartakeDAO(ProjectPartakeDAO projectPartakeDAO){
		this.projectPartakeDAO = projectPartakeDAO;
	}
	
	//pjNum_seq.nextval을 먼저 가져오기
	@Override
	public int getSeq() throws SQLException {
		return projectDAO.pjNumSeq();
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

	@Override
	public void joinProject(ProjectPartakeVO takeVO) throws Exception {
		projectDAO.searchProjectJoin(takeVO);
		
	}
	
	@Override
	public void cancelJoinProject(ProjectPartakeVO takeVO) throws Exception {
		projectDAO.joinCancelProject(takeVO);
	}
	
	@Override
	public List<ProjectVO> readMyProjectList() throws SQLException {
		// DB에 저장되어있는 모든 프로젝트 목록
		List<ProjectVO> projectList = projectDAO.selectProjectList();
		
		return projectList;
	}

	@Override
	public List<ProjectPartakeVO> getBindingProject(String id) throws SQLException {
		List<ProjectPartakeVO> bindList = projectPartakeDAO.selectBindingProject(id);
		return bindList;
	}
	
	@Override
	public void addProject(ProjectVO project) throws SQLException {
		projectDAO.insertProject(project);
	}

	@Override
	public void addProjectake(ProjectPartakeVO takeVO) throws SQLException {
		projectDAO.insertProjectake(takeVO);
	}
	
	@Override
	public String readVerifyProjectName(String name) throws SQLException {
		return projectDAO.verifyProjectName(name);
	}

	@Override
	public List<ProjectVO> allProjectList() throws SQLException {
		
		
		return null;
	}

	@Override
	public ProjectVO projectMain(int pjNum) throws SQLException {
		ProjectVO project = projectDAO.getProjectMain(pjNum);
		return project;
	}

	@Override
	public void insertPlan(ProjectVO project) throws SQLException {
		projectDAO.insertPlan(project);
	}	

	@Override
	public void deletePlan(int pjNum) throws SQLException {
		projectDAO.deletePlan(pjNum);
	}

	@Override
	public void createFnum(int pjNum, int fNum) throws SQLException {
		projectDAO.updateFnum(pjNum, fNum);
		
	}

	@Override
	public void insertUsecase(ProjectVO project) throws SQLException {
		projectDAO.insertUsecase(project);
		
	}

	@Override
	public void updateProject(ProjectVO project) throws SQLException {
		projectDAO.updateProject(project);
	}
	public void leaveProject(ProjectPartakeVO takeVO) throws SQLException {
		projectDAO.leaveProject(takeVO);
	}

	@Override
	public void deleteProject(int pjNum) throws SQLException {
		projectDAO.deleteProject(pjNum);
	}

	
	@Override
	public List<ProjectVO> getInvitedList(String id) throws SQLException {
		return projectDAO.getInvitedList(id);
	}

	@Override
	public void acceptInvite(ProjectPartakeVO partake) throws SQLException {
		projectDAO.acceptInvite(partake);
	}

	@Override
	public void refuseInvite(ProjectPartakeVO partake) throws SQLException {
		projectDAO.refuseInvite(partake);
	}
	

	

	

}
