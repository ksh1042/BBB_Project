package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.QnaVO;

public interface QnaDAO {
	
	// 작성된 QnA 리스트를 불러온다.
	List<QnaVO> selectSearchQnaList(Criteria cri) throws SQLException;
	
	// 총 글의 갯수를 확인
	int selectSearchQnaListCount(Criteria cri) throws SQLException;
	
	// QnA번호로 조회
	QnaVO selectQnaByQaNum(int qaNum) throws SQLException;
	
	// 새로운 QnA 를 작성한다.
	void insertQna(QnaVO qna) throws SQLException;
	
	// 자신이 작성한 QnA를 수정한다.
	void modifyQna(QnaVO qna) throws SQLException;
	
	// 자신이 작성한 QnA를 삭제한다.
	void deleteQna(int qaNum) throws SQLException;
	
	// 번호 자동삽입을 위한 시퀀스
	int getQnaSeqNextValue() throws SQLException;
	
	// 조회수를 위한 메서드
	void increaseViewCount(int qaNum) throws SQLException;
}
