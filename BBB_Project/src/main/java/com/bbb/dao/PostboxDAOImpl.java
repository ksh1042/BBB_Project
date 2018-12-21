package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bbb.dto.PostboxVO;

public class PostboxDAOImpl implements PostboxDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session){
		this.session = session;
	}
	
	@Override
	public List<PostboxVO> selectPostboxListById(String id) throws SQLException {
		return session.selectList("Postbox.selectPostboxListById", id);
	}

	@Override
	public List<PostboxVO> selectPostboxReplyList(int pbNum) throws SQLException {
		return session.selectList("Postbox.selectPostboxReplyList", pbNum);
	}

	@Override
	public void insertPostbox(PostboxVO postbox) throws SQLException {
		session.update("Postbox.insertPostbox", postbox);
	}

}
