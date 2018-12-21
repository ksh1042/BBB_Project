package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.PostboxVO;

public interface PostboxDAO {
	public List<PostboxVO> selectPostboxListById(String id) throws SQLException;
	public List<PostboxVO> selectPostboxReplyList(int pbNum) throws SQLException;
	public void insertPostbox(PostboxVO postbox) throws SQLException;
}
