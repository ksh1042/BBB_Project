package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dao.MemberDAO;
import com.bbb.dto.MemberVO;

public class MemberServiceImpl implements MemberService {

	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO){
		this.memberDAO=memberDAO;
	}
	
	@Override
	public List<MemberVO> getMemberList(Criteria cri) throws SQLException {
		List<MemberVO> memberList=memberDAO.selectMemberList(cri);
		return memberList;
	}

	@Override
	public MemberVO getMemberById(String id) throws SQLException {
		MemberVO member=memberDAO.selectMemberById(id);
		return member;
	}

	@Override
	public void register(MemberVO member) throws SQLException {
		memberDAO.insertMember(member);

	}

	@Override
	public void modify(MemberVO member) throws SQLException {
		memberDAO.updateMember(member);

	}

	@Override
	public void remove(String id) throws SQLException {
		memberDAO.deleteMember(id);

	}


}
