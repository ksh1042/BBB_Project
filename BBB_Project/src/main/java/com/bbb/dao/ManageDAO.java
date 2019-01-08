package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.ProjectPartakeVO;

public interface ManageDAO {
	
	public List<ProjectPartakeVO> getJoinList(int pjNum) throws SQLException;
}
