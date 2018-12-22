package com.bbb.service;

import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dao.QnaReplyDAO;
import com.bbb.dto.QnaReplyVO;

public class QnaReplyServiceImpl implements QnaReplyService{
	
	private QnaReplyDAO replyDAO;
	public void setQnaReplyDAO(QnaReplyDAO replyDAO){
		this.replyDAO = replyDAO;
	}
	
	@Override
	public List<QnaReplyVO> getReplyList(int qaNum) throws Exception {
		List<QnaReplyVO> replyList = replyDAO.selectReplyList(qaNum);
		return replyList;
	}
	
	@Override
	public void createReply(QnaReplyVO reply) throws Exception {
		replyDAO.insertReply(reply);
	}
	
	@Override
	public void modifyReply(QnaReplyVO reply) throws Exception {
		replyDAO.updateReply(reply);
		
	}
	@Override
	public void deleteReply(int qarNum) throws Exception {
		replyDAO.deleteReply(qarNum);
		
	}
	@Override
	public List<QnaReplyVO> getReplyListPage(int qaNum, Criteria cri) throws Exception {
		List<QnaReplyVO> replyList = replyDAO.selectReplyListPage(qaNum, cri);
		return replyList;
	}
	@Override
	public int countReply(int qaNum) throws Exception {
		int count = replyDAO.countReply(qaNum);
		return count;
	}
	
	
}
