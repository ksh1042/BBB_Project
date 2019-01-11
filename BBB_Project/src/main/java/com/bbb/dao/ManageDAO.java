package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectPartakeVO;

public interface ManageDAO {
	
	public List<MemberVO> getJoinList(int pjNum) throws SQLException;
	public List<MemberVO> getTeamMember(int pjNum,String id) throws SQLException;
	public void fireMember(ProjectPartakeVO partake) throws SQLException;
	public void applyMember(ProjectPartakeVO partake) throws SQLException;
	public void refuseMember(ProjectPartakeVO partake) throws SQLException;
}
