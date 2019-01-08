package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bbb.dto.ProjectPartakeVO;

public class ManageDAOImpl implements ManageDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session){
		this.session = session;
	}
	
	@Override
	public List<ProjectPartakeVO> getJoinList(int pjNum) throws SQLException {
		return session.selectList("ProjectPartake.selectJoinList",pjNum);
	}

}
