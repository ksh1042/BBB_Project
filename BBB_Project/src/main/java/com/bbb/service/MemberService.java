package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.MemberVO;

public interface MemberService {
	
	List<MemberVO> getMemberList()throws SQLException;
	
	MemberVO getMemberById(String id)throws SQLException;
	
	void registerMember(MemberVO member)throws SQLException;
	
	void modifyMember(MemberVO member)throws SQLException;
	
	void removeMember(String id)throws SQLException;
	
}
