package com.bbb.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.SearchCriteria;
import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectPartakeVO;

public class ManageDAOImpl implements ManageDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session){
		this.session = session;
	}
	
	@Override
	public List<MemberVO> getJoinList(int pjNum) throws SQLException {
		return session.selectList("Management.selectJoinList",pjNum);
	}

	@Override
	public List<MemberVO> getTeamMember(int pjNum, String id, SearchCriteria cri) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", cri.getKeyword());
		map.put("searchType", cri.getSearchType());
		map.put("id", id);
		map.put("pjNum", pjNum);
		return session.selectList("Management.selectTeamMemberList", map);
	}

	@Override
	public int getTeamMemberCount(int pjNum, String id, SearchCriteria cri) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", cri.getKeyword());
		map.put("searchType", cri.getSearchType());
		map.put("id", id);
		map.put("pjNum", pjNum);
		return session.selectOne("Management.TeamMemberListCount",map);
	}
	
	@Override
	public void fireMember(ProjectPartakeVO partake) throws SQLException {
		session.update("ProjectPartake.fireMember", partake);
	}

	@Override
	public void applyMember(String id,int pjNum) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pjNum", pjNum);
		session.update("Management.applyMember", map);
	}

	@Override
	public void refuseMember(String id,int pjNum) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pjNum", pjNum);
		session.update("Management.refuseMember", map);
	}

	@Override
	public List<ProjectPartakeVO> getInviteMember(SearchCriteria cri, int pjNum,String id) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", cri.getKeyword());
		map.put("SearchType", cri.getSearchType());
		map.put("pjNum", pjNum);
		map.put("id", id);
		return session.selectList("Management.getSearchMemberList",map);
	}

	@Override
	public int getInviteMemberCount(SearchCriteria cri, int pjNum,String id) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", cri.getKeyword());
		map.put("SearchType", cri.getSearchType());
		map.put("pjNum", pjNum);
		map.put("id", id);
		return session.selectOne("Management.getSearchMemberListCount",map);
	}


}
