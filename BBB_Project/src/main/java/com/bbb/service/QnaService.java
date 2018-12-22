package com.bbb.service;

import java.util.List;

import com.bbb.criteria.Criteria;
import com.bbb.criteria.SearchCriteria;
import com.bbb.dto.QnaVO;

public interface QnaService {
	
	// QnA 리스트를 불러와 정렬
	List<QnaVO> getSearchQnaList(Criteria cri) throws Exception;
	
	
	QnaVO readByQaNum(int qaNum) throws Exception;
	
	// 새 QnA 작성
	void create(QnaVO qna) throws Exception;
	
	// 조회수 
	int readSearchQnaCount(Criteria cri) throws Exception;

	
	
}
