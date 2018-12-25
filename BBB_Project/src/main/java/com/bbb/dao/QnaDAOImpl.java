package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.QnaVO;

public class QnaDAOImpl implements QnaDAO{

	private SqlSession session;
	public void setSession(SqlSession session){
		this.session = session;
	}
	
	@Override
	public void insertQna(QnaVO qna) throws SQLException {
		session.update("Question.insertQna", qna);
	}


	@Override
	public List<QnaVO> selectSearchQnaList(Criteria cri) throws SQLException {
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<QnaVO> qnaList = session.selectList("Question.selectSearchQnaList", (SearchCriteria)cri, rowBounds );
		return qnaList;
	}

	@Override
	public int selectSearchQnaListCount(Criteria cri) throws SQLException {
		int rowCount = session.selectOne("Question.selectSearchQnaCount", cri);
		return rowCount;
	}


	@Override
	public int getQnaSeqNextValue() throws SQLException {
		return session.selectOne("Question.getQnaSeqNextValue");
	}

	@Override
	public QnaVO selectQnaByQaNum(int qaNum) throws SQLException {
		QnaVO qna = (QnaVO)session.selectOne("Question.selectQnaByQaNum", qaNum);
		
		return qna;
	}

	@Override
	public void increaseViewCount(int qaNum) throws SQLException {
		session.update("Question.increaseViewCnt", qaNum);
		
	}

}
