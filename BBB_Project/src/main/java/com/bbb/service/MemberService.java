package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.MemberVO;

public interface MemberService {
	
	List<MemberVO> getMemberList(Criteria cri)throws SQLException;
	
	MemberVO getMemberById(String id)throws SQLException;
	
	void register(MemberVO member)throws SQLException;
	
	void modify(MemberVO member)throws SQLException;
	
	void updateOriginProfile(String id)throws SQLException;
	
	void remove(String id)throws SQLException;
	
	int idCheckSer(String id)throws SQLException;
	
	int emailCheckSer(String email)throws SQLException;
	
	String findID(MemberVO member)throws SQLException;
	
	void resetMemberPwd(MemberVO member)throws SQLException;
	
	public void updateAssignEmail(String id) throws SQLException;
	
	void modifyEmail(MemberVO member)throws SQLException;
	
	void removeEmailyn(String id) throws SQLException;
}
