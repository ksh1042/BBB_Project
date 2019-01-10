package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bbb.dto.UseCaseReplyVO;

public class UseCaseReplyDAOImpl implements UseCaseReplyDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session){
		this.session = session;
	}
	
	@Override
	public List<UseCaseReplyVO> selectReplyList(String uuuid) throws SQLException {
		List<UseCaseReplyVO> usecaseReply = session.selectList("UseCaseReply.selectReplyList", uuuid);
		return usecaseReply;
	}

	@Override
	public void insertReply(UseCaseReplyVO reply) throws SQLException {
		session.update("UseCaseReply.insertReply", reply);

	}

	@Override
	public void updateReply(UseCaseReplyVO reply) throws SQLException {
		session.update("UseCaseReply.updateReply", reply);

	}

	@Override
	public void deleteReply(int urNum) throws SQLException {
		session.update("UseCaseReply.deleteReply", urNum);

	}

	@Override
	public int getUseCaseReplySeqNextValue() throws SQLException {
		int urNum = session.selectOne("UseCaseReply.getUseCaseReplySeqNextValue");
		return urNum;
	}

}
