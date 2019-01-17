package com.bbb.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.SearchCriteria;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.ProjectPlanVO;
import com.bbb.dto.ProjectVO;

public class ProjectDAOImpl implements ProjectDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int pjNumSeq() throws SQLException {
		return session.selectOne("Project.pjNumSeq");
	}
	
	@Override
	public List<ProjectVO> searchProjectList(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<ProjectVO> searchPList = session.selectList("Project.ProjectSearchList",cri,rowBounds);
		return searchPList;
	}

	@Override
	public int searchProjectCount(SearchCriteria cri) throws SQLException {
		int rowCount = session.selectOne("Project.ProjectSearchCount",cri);
		return rowCount;
	}

	@Override
	public void searchProjectJoin(ProjectPartakeVO takeVO) throws SQLException {
		session.insert("Project.ProjectSearchJoin", takeVO);
	}
	
	@Override
	public void joinCancelProject(ProjectPartakeVO takeVO) throws SQLException {
		session.update("Project.JoinCancelProject", takeVO);
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
	public void insertProjectake(ProjectPartakeVO takeVO) throws SQLException {
		session.update("Project.insertProjectake", takeVO);
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

	@Override
	public void insertPlan(ProjectVO project) throws SQLException {
		session.update("Project.updateProjectPlan",project);
	}

	@Override
	public void insertUdNum(ProjectVO project) throws SQLException {
		session.update("Project.insertUdNum", project);
	}
		
	@Override
	public void updateFnum(int pjNum, int fNum) throws SQLException {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("fNum", fNum);
		map.put("pjNum", pjNum);
	
		session.update("Project.updateFnum", map);
		
	}

	@Override
	public void insertUsecase(ProjectVO project) throws SQLException {
		session.update("Project.updateUseCase", project);
		
	}

	@Override
	public void deletePlan(int pjNum) throws SQLException {
		session.update("Project.deletePlan", pjNum);
	}

	@Override
	public void insertGcNum(ProjectVO project) throws SQLException {
		session.update("Project.insertGcNum", project);
	}

	@Override
	public void updateProject(ProjectVO project) throws SQLException {
		session.update("Project.updateProject", project);
	}

	@Override
	public void deleteProject(int pjNum) throws SQLException {
		session.update("Project.deleteProject", pjNum);
	}
	public void leaveProject(ProjectPartakeVO takeVO) throws SQLException {
		session.update("ProjectPartake.leaveProject", takeVO);
	}

	@Override
	public List<ProjectVO> getInvitedList(String id) throws SQLException {
		return session.selectList("Project.getInvitedList",id);
	}

	@Override
	public void acceptInvite(ProjectPartakeVO partake) throws SQLException {
		session.update("ProjectPartake.acceptInvite", partake);
	}

	@Override
	public void refuseInvite(ProjectPartakeVO partake) throws SQLException {
		session.update("ProjectPartake.refuseInvite", partake);
	}

	
	

	


}
