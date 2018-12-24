package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.SearchCriteria;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.ProjectVO;

public class ProjectDAOImpl implements ProjectDAO{

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ProjectVO> searchProjectList(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<ProjectVO> searchPList = session.selectList("Project.ProjectSearchList",cri,rowBounds);
		return searchPList;
	}

	@Override
	public int searchProjectCount(SearchCriteria cri) throws Exception {
		int rowCount = session.selectOne("Project.ProjectSearchCount",cri);
		return rowCount;
	}

	@Override
	public void searchProjectJoin(ProjectPartakeVO takeVO) throws Exception {
		session.insert("Project.ProjectSearchJoin", takeVO);
	}

	// 내가 참여하고있는 프로젝트를 찾아오기 위해 DB에 등록된 Project의 모든 리스트를 가져온다.
		@Override
		public List<ProjectVO> selectProjectList() throws SQLException {
			return session.selectList("Project.selectProjectList");
		}
}
