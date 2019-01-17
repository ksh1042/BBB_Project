package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.QnaReplyVO;
import com.bbb.dto.UseCaseReplyVO;

public interface UseCaseReplyDAO {

	List<UseCaseReplyVO> selectReplyList(String uuuid) throws SQLException;
	
	void insertReply(UseCaseReplyVO reply) throws SQLException;
	
	void updateReply(UseCaseReplyVO reply) throws SQLException;
	
	void deleteReply(int urNum) throws SQLException;
	
	int getUseCaseReplySeqNextValue() throws SQLException;

	
}
