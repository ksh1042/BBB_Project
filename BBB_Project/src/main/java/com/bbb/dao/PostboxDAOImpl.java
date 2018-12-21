package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.MemberVO;
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

	@Override
	public List<MemberVO> selectSearchMemberList(Criteria cri) throws SQLException {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds bound = new RowBounds(offset, limit);
		
		return session.selectList("Postbox.selectSearchMemberList", (SearchCriteria)cri, bound);
	}

	@Override
	public int selectSearchMemberListCount(Criteria cri) throws SQLException {
		return session.selectOne("Postbox.selectSearchMemberListCount", (SearchCriteria)cri);
	}

}
