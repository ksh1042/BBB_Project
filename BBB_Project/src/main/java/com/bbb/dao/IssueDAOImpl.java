package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.IssueVO;

public class IssueDAOImpl implements IssueDAO{

	private SqlSession session;
	public void setSession(SqlSession session){
		this.session=session;
	}
	
	@Override
	public List<IssueVO> selectSearchIssueList(Criteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<IssueVO> issueList = session.selectList("Issue.selectSearchIssueList", (SearchCriteria)cri, rowBounds );
		return issueList;
	}

	@Override
	public int selectSearchIssueListCount(Criteria cri) throws SQLException {
		int rowCount = session.selectOne("Issue.selectSearchIssueCount", cri);
		return rowCount;
	}

	@Override
	public int getQnaSeqNextValue() throws SQLException {
		return session.selectOne("Issue.getBseqNextValue");
	}

}
