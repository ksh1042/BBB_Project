package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.MemberVO;

public interface MemberService {
	
	List<MemberVO> getMemberList()throws SQLException;
	
	MemberVO getMemberById(String id)throws SQLException;
	
	void register(MemberVO member)throws SQLException;
	
	void modify(MemberVO member)throws SQLException;
	
	void remove(String id)throws SQLException;
	
}
