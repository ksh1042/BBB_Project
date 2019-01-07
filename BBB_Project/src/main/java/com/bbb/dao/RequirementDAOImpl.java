package com.bbb.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bbb.dto.ProjectVO;
import com.bbb.dto.RequirementHistVO;
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
	
	@Override
	public int rdNumNextVal() throws SQLException {
		return session.selectOne("Requirement.seqNextRdNum",null);
	}
	@Override
	public void insertRdNum(ProjectVO project) throws SQLException {
		session.update("Requirement.createRdNum", project);
	}
	@Override
	public List<RequirementVO> selectRequirementListByRdNum(int rdNum) throws SQLException {
		return session.selectList("Requirement.selectRequirementListByRdNum",rdNum);
	}
	@Override
	public void createRequirement(int rdNum) throws SQLException {
		session.insert("Requirement.createRequirementRdNum",rdNum);
	}
	@Override
	public void deleteRequirement(int delNum) throws SQLException {
		session.delete("Requirement.deleteRequirement", delNum);
	}
	@Override
	public void createRequirementBySetRddNum(RequirementVO require) throws SQLException {
		session.insert("Requirement.createRequirementBySetRddNum", require); 
	}
	@Override
	public void updateRequirement(RequirementVO require) throws SQLException {
		session.update("Requirement.updateRequirement", require);
	}
	@Override
	public void insertRequireHist(RequirementHistVO reqHist) throws SQLException {
		session.insert("Requirement.insertReqHist", reqHist);
	}

}
