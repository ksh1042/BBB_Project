package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.criteria.Criteria;
import com.bbb.dto.QnaReplyVO;

public interface QnaReplyDAO {

	List<QnaReplyVO> selectReplyList(int qaNum) throws SQLException;
	
	void insertReply(QnaReplyVO reply) throws SQLException;
	
	void updateReply(QnaReplyVO reply) throws SQLException;
	
	void deleteReply(int qarNum) throws SQLException;
	
	List<QnaReplyVO> selectReplyListPage(int qaNum, Criteria cri) throws SQLException;
	
	int countReply(int qaNum) throws SQLException;

}
