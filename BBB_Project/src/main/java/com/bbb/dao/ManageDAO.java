package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.SearchCriteria;
import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectPartakeVO;

public interface ManageDAO {
	
	public List<MemberVO> getJoinList(int pjNum) throws SQLException;
	public List<MemberVO> getTeamMember(int pjNum,String id, SearchCriteria cri) throws SQLException;
	public int getTeamMemberCount(int pjNum,String id, SearchCriteria cri) throws SQLException;
	public void fireMember(ProjectPartakeVO partake) throws SQLException;
	public void applyMember(String id,int pjNum) throws SQLException;
	public void refuseMember(String id,int pjNum) throws SQLException;
	
	public List<ProjectPartakeVO> getInviteMember(SearchCriteria cri, int pjNum,String id) throws SQLException;
	public int getInviteMemberCount(SearchCriteria cri, int pjNum,String id) throws SQLException;
}
