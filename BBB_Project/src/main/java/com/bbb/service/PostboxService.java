package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.PostboxVO;

public interface PostboxService {
	public List<PostboxVO> readPostboxList(String id) throws SQLException;
	public void createPostbox(PostboxVO postbox) throws SQLException;
}
