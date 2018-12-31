package com.bbb.service;

import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dao.ReplyDAO;
import com.bbb.dto.ReplyVO;

public class ReplyServiceImpl implements ReplyService {

	private ReplyDAO replyDAO;
	public void setReplyDAO(ReplyDAO replyDAO){
		this.replyDAO = replyDAO;
	}
	
	@Override
	public List<ReplyVO> getReplyList(int bNum) throws Exception {
		return replyDAO.selectReplyList(bNum);
	}

	@Override
	public void create(ReplyVO reply) throws Exception {
		replyDAO.insertReply(reply);

	}

	@Override
	public void modify(ReplyVO reply) throws Exception {
		replyDAO.updateReply(reply);

	}

	@Override
	public void remove(int rNum) throws Exception {
		replyDAO.deleteReply(rNum);

	}

	@Override
	public List<ReplyVO> getReplyList(int bNum, Criteria cri) throws Exception {
		return replyDAO.selectReplyListPage(bNum, cri);
	}

	@Override
	public int countReply(int bNum) throws Exception {
		return replyDAO.countReply(bNum);
	}

}
