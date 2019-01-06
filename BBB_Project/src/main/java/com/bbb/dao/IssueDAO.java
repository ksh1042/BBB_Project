package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.IssueVO;

public interface IssueDAO {

	List<IssueVO> selectSearchIssueList(Criteria cri,int pjNum)throws SQLException;
	int selectSearchIssueListCount(Criteria cri,int pjNum)throws SQLException;
	// inum 자동삽입 시퀀스
	int getQnaSeqNextValue() throws SQLException;
	void insertIssue(IssueVO issue) throws SQLException; 
	IssueVO selectIssueByINum(int iNum)throws SQLException;
	void modifyIssue(IssueVO issue) throws SQLException; 
	void modifyIssueClose(int iNum) throws SQLException;
	void modifyIssueOpen(int iNum) throws SQLException;
	
}
