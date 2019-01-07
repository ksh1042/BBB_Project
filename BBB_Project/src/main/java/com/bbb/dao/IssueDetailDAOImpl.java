package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.Criteria;
import com.bbb.dto.IssueDetailVO;

public class IssueDetailDAOImpl implements IssueDetailDAO {

	private SqlSession session;
	public void setSession(SqlSession session){
		this.session=session;
	}
	
	@Override
	public List<IssueDetailVO> selectIssueDetailList(int iNum) throws SQLException {
		List<IssueDetailVO> issueDetailList=session.selectList("IssueDetail.selectIssueDetailList",iNum);
		return issueDetailList;
	}

	@Override
	public void insertIssueDetail(IssueDetailVO issueDetail) throws SQLException {
		session.update("insertIssueDetail",issueDetail);
		
	}

	@Override
	public void updateIssueDetail(IssueDetailVO issueDetail) throws SQLException {
		session.update("updateIssueReply",issueDetail);
		
	}

	@Override
	public void deleteIssueDetail(int idNum) throws SQLException {
		session.update("deleteReply",idNum);
		
	}

	@Override
	public List<IssueDetailVO> selectIssueDetailListPage(int iNum, Criteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countIssueDetail(int iNum) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
