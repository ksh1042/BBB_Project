package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dao.MemberDAO;
import com.bbb.dto.MemberVO;

public class MemberServiceImpl implements MemberService {

	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO){
		this.memberDAO=memberDAO;
	}
	
	@Override
	public List<MemberVO> getMemberList() throws SQLException {
		List<MemberVO> memberList=memberDAO.selectMemberList();
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
	@Override
	public int idCheckSer(String id) throws SQLException {
		int count=memberDAO.idCheck(id);
		return count;
	}

	@Override
	public int emailCheckSer(String email) throws SQLException {
		int count=memberDAO.emailCheck(email);
		return count;
	}

	@Override
	public String findID(MemberVO member) throws SQLException {
		String id = memberDAO.findID(member);
		return id;
	}

	@Override
	public void resetMemberPwd(MemberVO member) throws SQLException {
		memberDAO.resetPwd(member);
		
	}

}
