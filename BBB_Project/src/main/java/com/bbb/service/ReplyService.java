package com.bbb.service;

import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.ReplyVO;

public interface ReplyService {
	
	List<ReplyVO> getReplyList(int bNum)throws Exception;
	
	void create(ReplyVO reply) throws Exception;
	
	void modify(ReplyVO reply) throws Exception;
	
	void remove(int rNum) throws Exception;
	
	List<ReplyVO> getReplyList(int bNum,Criteria cri) throws Exception;
	
	int countReply(int bNum)throws Exception;
}
