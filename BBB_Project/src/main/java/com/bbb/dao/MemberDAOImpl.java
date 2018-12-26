package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.MemberVO;

public class MemberDAOImpl implements MemberDAO {
	
	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<MemberVO> selectMemberList(Criteria cri) throws SQLException {
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<MemberVO> memberList=session.selectList("Member.selectMemberList",(SearchCriteria)cri, rowBounds);
		
		return memberList;
	}
	
	@Override
	public int selectMemberListCount(Criteria cri) throws SQLException {
		int count = session.selectOne("Member.selectMemberListCount", (SearchCriteria)cri);
		return count;
	}

	@Override
	public MemberVO selectMemberById(String id) throws SQLException {
		MemberVO member=session.selectOne("Member.selectMemberById",id);
		return member;
	}

	@Override
	public void insertMember(MemberVO member) throws SQLException {
		session.update("Member.insertMember",member);

	}

	@Override
	public void updateMember(MemberVO member) throws SQLException {
		session.update("Member.updateMember",member);

	}

	@Override
	public void deleteMember(String id) throws SQLException {
		session.update("Member.deleteMember",id);

	}
	
	@Override
	public int idCheck(String id) throws SQLException {
		int count = session.selectOne("Member.idCheck", id);
		return count;
	}

	@Override
	public int emailCheck(String email) throws SQLException {
		int count = session.selectOne("Member.emailCheck", email);
		return count;
	}

	@Override
	public String findID(MemberVO member) throws SQLException {
		String id = session.selectOne("Member.findID",member);
		return id;
	}

	@Override
	public void resetPwd(MemberVO member) throws SQLException {
		session.update("Member.resetPwd",member);
		
	}



}
