package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bbb.dto.ProjectVO;

public class ProjectDAOImpl implements ProjectDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	// 내가 참여하고있는 프로젝트를 찾아오기 위해 DB에 등록된 Project의 모든 리스트를 가져온다.
	@Override
	public List<ProjectVO> selectProjectList() throws SQLException {
		
		List<ProjectVO> projectList = session.selectList("Project.selectProjectList");
		return projectList;
	}
	
	@Override
	public void insertProject(ProjectVO project) throws SQLException {
		session.update("Project.insertProject", project);
	}

	@Override
	public String verifyProjectName(String name) throws SQLException {
		return session.selectOne("Project.verifyProjectName", name);
	}

	@Override
	public ProjectVO getProjectMain(int pjNum) throws SQLException {
		ProjectVO project = session.selectOne("Project.selectProjectByPjNum", pjNum);
		return project;
	}

}
