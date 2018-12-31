package com.bbb.dao;

import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.ReplyVO;

public interface ReplyDAO {
	
	List<ReplyVO> selectReplyList(int bNum)throws Exception;
	void insertReply(ReplyVO reply)throws Exception;
	void updateReply(ReplyVO reply)throws Exception;
	void deleteReply(int rNum)throws Exception;
	
	List<ReplyVO> selectReplyListPage(int bNum,Criteria cri)	throws Exception;
	int countReply(int bNum) throws Exception;
}





