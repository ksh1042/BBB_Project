package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.SearchCriteria;
import com.bbb.dto.ProjectVO;

public class ProjectDAOImpl implements ProjectDAO{

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
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
	public int searchProjectCount(SearchCriteria cri) throws Exception {
		int rowCount = session.selectOne("Project.ProjectSearchCount",cri);
		return rowCount;
	}

	
}
