package com.bbb.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<IssueVO> selectSearchIssueList(Criteria cri,int pjNum) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		Map<String,Object> paramMap=new HashMap<String, Object>(); 
		paramMap.put("pjNum", pjNum);
		paramMap.put("cri", (SearchCriteria)cri);
		
		List<IssueVO> issueList = session.selectList("Issue.selectSearchIssueList", paramMap, rowBounds );
		return issueList;
	}

	@Override
	public int selectSearchIssueListCount(Criteria cri,int pjNum) throws SQLException {
		Map<String,Object> paramMap=new HashMap<String, Object>(); 
		paramMap.put("pjNum", pjNum);
		paramMap.put("cri",cri);
		
		int rowCount = session.selectOne("Issue.selectSearchIssueCount", paramMap);
		return rowCount;
	}

	@Override
	public int getQnaSeqNextValue() throws SQLException {
		return session.selectOne("Issue.getBseqNextValue");
	}

	@Override
	public void insertIssue(IssueVO issue) throws SQLException {
		session.update("Issue.insertIssue",issue);
		
	}

	@Override
	public IssueVO selectIssueByINum(int iNum) throws SQLException {
		IssueVO issue=session.selectOne("Issue.selectIssueByINum",iNum);
		return issue;
	}

	@Override
	public void modifyIssue(IssueVO issue) throws SQLException {
		session.update("Issue.updateIssue", issue);
		
	}

	@Override
	public void modifyIssueClose(int iNum) throws SQLException {
		session.update("Issue.updateIssueClose",iNum);
		
	}

	@Override
	public void modifyIssueOpen(int iNum) throws SQLException {
		session.update("Issue.updateIssueOpen",iNum);
		
	}

}
