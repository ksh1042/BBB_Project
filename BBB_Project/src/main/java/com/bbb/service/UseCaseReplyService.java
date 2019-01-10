package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.UseCaseReplyVO;

public interface UseCaseReplyService {
	
	int getSEQ() throws SQLException;
	
	List<UseCaseReplyVO> readReplyList(String uuuid) throws SQLException;

	void createReply(UseCaseReplyVO reply) throws SQLException;
	
	void updateReply(UseCaseReplyVO reply) throws SQLException;

	void deleteReply(int urNum) throws SQLException;
	
}
