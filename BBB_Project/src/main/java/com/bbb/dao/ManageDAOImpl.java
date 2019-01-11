package com.bbb.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectPartakeVO;

public class ManageDAOImpl implements ManageDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session){
		this.session = session;
	}
	
	@Override
	public List<MemberVO> getJoinList(int pjNum) throws SQLException {
		return session.selectList("Member.selectJoinList",pjNum);
	}

	@Override
	public List<MemberVO> getTeamMember(int pjNum, String id) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pjNum", pjNum);
		return session.selectList("Member.selectTeamMemberList", map);
	}

	@Override
	public void fireMember(ProjectPartakeVO partake) throws SQLException {
		session.update("ProjectPartake.fireMember", partake);
	}

	@Override
	public void applyMember(ProjectPartakeVO partake) throws SQLException {
		session.update("Management.applyMember", partake);
	}

	@Override
	public void refuseMember(ProjectPartakeVO partake) throws SQLException {
		session.update("Management.refuseMember", partake);
	}

}
