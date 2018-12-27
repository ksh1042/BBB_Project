package com.bbb.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bbb.dao.ProjectDAO;
import com.bbb.dao.ProjectPartakeDAO;
import com.bbb.dto.ProjectVO;

public class ProjectServiceImpl implements ProjectService {
	
	private ProjectDAO projectDAO;
	public void setProjectDAO(ProjectDAO projectDAO){
		this.projectDAO = projectDAO;
	}
	
	
	private ProjectPartakeDAO projectPartakeDAO;
	public void setProjectPartakeDAO(ProjectPartakeDAO projectPartakeDAO){
		this.projectPartakeDAO = projectPartakeDAO;
	}
	
	@Override
	public void addProject(ProjectVO project) throws SQLException {
		projectDAO.insertProject(project);
	}

	@Override
	public String readVerifyProjectName(String name) throws SQLException {
		return projectDAO.verifyProjectName(name);
	}
	// 내가 참여하고있는 프로젝트 목록을 가져오기 위한 비교
	@Override
	public List<ProjectVO> readMyProjectList(String id) throws SQLException {
		
		// 내가 참여하고있는 프로젝트의 리스트를 pjNum으로 비교하기 위하여 사용
		List<Integer> myPartakeList = projectPartakeDAO.selectProjectPartakeList(id);
		// DB에 저장되어있는 모든 프로젝트 목록
		List<ProjectVO> projectList = projectDAO.selectProjectList();
		// pjNum으로 비교한 값을 저장하기 위한 배열
		List<ProjectVO> myProjectList = new ArrayList<ProjectVO>();
		
		for(ProjectVO project : projectList){
			for(int myPartake : myPartakeList){
				if(project.getPjNum() == myPartake){
					myProjectList.add(project);
				}
			}
		}
		
		return myProjectList;
		
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


}
