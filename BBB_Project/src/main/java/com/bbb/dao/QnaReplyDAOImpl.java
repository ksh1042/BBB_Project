package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.Criteria;
import com.bbb.dto.QnaReplyVO;

public class QnaReplyDAOImpl implements QnaReplyDAO{
	
	private SqlSession session;
	public void setSession(SqlSession session){
		this.session = session;
	}
	
	@Override
	public List<QnaReplyVO> selectReplyList(int qaNum) throws SQLException {
		List<QnaReplyVO> replyList = session.selectList("QuestionReply.selectReplyList", qaNum);
		return replyList;
	}

	@Override
	public void insertReply(QnaReplyVO reply) throws SQLException {
		session.update("QuestionReply.insertReply", reply);
	
	}

	@Override
	public void updateReply(QnaReplyVO reply) throws SQLException {
		session.update("QuestionReply.updateReply", reply);
		
	}

	@Override
	public void deleteReply(int qarNum) throws SQLException {
		session.update("QuestionReply.deleteReply", qarNum);
		
	}

	@Override
	public List<QnaReplyVO> selectReplyListPage(int qaNum, Criteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
			
		List<QnaReplyVO> replyList = session.selectList("QuestionReply.selectReplyList", qaNum, rowBounds);
		return replyList;
	}

	@Override
	public int countReply(int qaNum) throws SQLException {
		int count = session.selectOne("QuestionReply.countReply", qaNum);
		return count;
	}

}
