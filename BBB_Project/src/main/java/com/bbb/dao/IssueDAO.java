package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.IssueVO;

public interface IssueDAO {

	List<IssueVO> selectSearchIssueList(Criteria cri)throws SQLException;
	int selectSearchIssueListCount(Criteria cri)throws SQLException;
	int getQnaSeqNextValue() throws SQLException;
}
