package com.bbb.service;

import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.QnaVO;

public interface QnaService {
	
	// QnA 리스트를 불러와 정렬
	List<QnaVO> getSearchQnaList(Criteria cri) throws Exception;
	
	
	QnaVO readByQaNum(int qaNum) throws Exception;
	
	// 새 QnA 작성
	void create(QnaVO qna) throws Exception;
	
	// QnA 수정
	void update(QnaVO qna) throws Exception;
	
	// QnA 삭제
	void remove(int qaNum) throws Exception;
	
	// 조회수 
	int readSearchQnaCount(Criteria cri) throws Exception;

	
	
}
