package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bbb.dto.RequirementVO;

public class RequirementDAOImpl implements RequirementDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session){
		this.session = session;
	}
	@Override
	public List<RequirementVO> selectRequirementListById(int rdNum) throws SQLException {
		return session.selectList("Requirement.selectRequirementListById", rdNum);
	}

}
