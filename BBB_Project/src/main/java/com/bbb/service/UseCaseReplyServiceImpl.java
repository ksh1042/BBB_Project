package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dao.UseCaseReplyDAO;
import com.bbb.dto.UseCaseReplyVO;

public class UseCaseReplyServiceImpl implements UseCaseReplyService {
	
	private UseCaseReplyDAO replyDAO;
	public void setUseCaseReplyDAO(UseCaseReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	@Override
	public List<UseCaseReplyVO> readReplyList(String uuuid) throws SQLException {
		List<UseCaseReplyVO> replyList = replyDAO.selectReplyList(uuuid);
		return replyList;
	}

	@Override
	public void createReply(UseCaseReplyVO reply) throws SQLException {
		replyDAO.insertReply(reply);

	}

	@Override
	public void updateReply(UseCaseReplyVO reply) throws SQLException {
		replyDAO.updateReply(reply);

	}

	@Override
	public void deleteReply(int urNum) throws SQLException {
		replyDAO.deleteReply(urNum);

	}

	@Override
	public int getSEQ() throws SQLException {
		return replyDAO.getUseCaseReplySeqNextValue();
	}

}
