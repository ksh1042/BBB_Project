package com.bbb.service;

import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dao.QnaDAO;
import com.bbb.dto.QnaVO;

public class QnaServiceImpl implements QnaService{

	private QnaDAO qnaDAO;
	public void setQnaDAO(QnaDAO qnaDAO){
		this.qnaDAO = qnaDAO;
	}
	
	@Override
	public void create(QnaVO qna) throws Exception {
		int qaNum = qnaDAO.getQnaSeqNextValue();
		qna.setQaNum(qaNum);
		qnaDAO.insertQna(qna);
		
	}
	
	@Override
	public void update(QnaVO qna) throws Exception {
		qnaDAO.modifyQna(qna);
	
	}

	@Override
	public void remove(int qaNum) throws Exception {
		qnaDAO.deleteQna(qaNum);
		
	}

	@Override
	public List<QnaVO> getSearchQnaList(Criteria cri) throws Exception {
		List<QnaVO> qnaList = qnaDAO.selectSearchQnaList(cri);
		return qnaList;
	}

	@Override
	public int readSearchQnaCount(Criteria cri) throws Exception {
		int count = qnaDAO.selectSearchQnaListCount(cri);
		return count;
	}


	@Override
	public QnaVO readByQaNum(int qaNum) throws Exception {
		QnaVO qna = qnaDAO.selectQnaByQaNum(qaNum);
		return qna;
	}



}
