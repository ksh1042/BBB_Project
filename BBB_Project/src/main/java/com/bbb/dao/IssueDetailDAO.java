package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.IssueDetailVO;

public interface IssueDetailDAO {

	List<IssueDetailVO> selectIssueDetailList(int iNum)throws SQLException;
	
	void insertIssueDetail(IssueDetailVO issueDetail)throws SQLException;
	
	void updateIssueDetail(IssueDetailVO issueDetail)throws SQLException;
	
	void deleteIssueDetail(int idNum)throws SQLException;
	
	List<IssueDetailVO> selectIssueDetailListPage(int iNum, Criteria cri)throws SQLException;
	
	int countIssueDetail(int iNum) throws SQLException;

}
