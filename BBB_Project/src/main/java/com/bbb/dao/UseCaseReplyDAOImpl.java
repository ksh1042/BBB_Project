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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertReply(UseCaseReplyVO reply) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateReply(UseCaseReplyVO reply) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteReply(int urNum) throws SQLException {
		// TODO Auto-generated method stub

	}

}
