package com.bbb.service;

import java.util.List;

import com.bbb.criteria.Criteria;
import com.bbb.dto.QnaReplyVO;

public interface QnaReplyService {
	
	// 리스트 불러오는 메소드
	List<QnaReplyVO> getReplyList(int qaNum)throws Exception;
	
	// 답글 작성
	void createReply(QnaReplyVO reply)throws Exception;
	
	// 답글 수정
	void modifyReply(QnaReplyVO reply)throws Exception;
	
	// 답글 삭제
	void deleteReply(int qarNum)throws Exception;
	
	// 답글 페이징
	List<QnaReplyVO> getReplyListPage(int qaNum, Criteria cri) throws Exception;
	
	
	int countReply(int qaNum) throws Exception;
}
