package com.bbb.service;

import java.util.List;

import com.bbb.controller.SearchCriteria;
import com.bbb.dao.ManageDAO;
import com.bbb.dao.MemberDAO;
import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectPartakeVO;

public class ManageServiceImpl implements ManageService {

	private ManageDAO manageDao;
	public void setManageDAO(ManageDAO manageDao){
		this.manageDao = manageDao;
	}
	
	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO){
		this.memberDAO = memberDAO;
	}
	
	@Override
	public List<MemberVO> getJoinList(int pjNum) throws Exception {
		List<MemberVO> joinList = manageDao.getJoinList(pjNum);
		return joinList;
	}

	@Override
	public List<MemberVO> teamMemberList(int pjNum, String id, SearchCriteria cri) throws Exception {
		List<MemberVO> teamMemList = manageDao.getTeamMember(pjNum, id, cri);
		return teamMemList;
	}

	@Override
	public int teamMemberCount(int pjNum, String id, SearchCriteria cri) throws Exception {
		return manageDao.getTeamMemberCount(pjNum, id, cri);
	}
	
	@Override
	public void fireMember(ProjectPartakeVO partake) throws Exception {
		manageDao.fireMember(partake);
	}

	@Override
	public void applyMember(String id,int pjNum) throws Exception {
		manageDao.applyMember(id,pjNum);
	}

	@Override
	public void refuseMember(String id,int pjNum) throws Exception {
		manageDao.refuseMember(id,pjNum);
	}


}
