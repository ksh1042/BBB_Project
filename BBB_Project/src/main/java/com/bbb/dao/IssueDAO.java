package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.IssueVO;
import com.bbb.dto.QnaVO;

public interface IssueDAO {

	List<IssueVO> selectSearchIssueList(Criteria cri,int pjNum)throws SQLException;
	int selectSearchIssueListCount(Criteria cri,int pjNum)throws SQLException;
	// inum 자동삽입 시퀀스
	int getQnaSeqNextValue() throws SQLException;
	void insertIssue(IssueVO issue) throws SQLException; 
}
