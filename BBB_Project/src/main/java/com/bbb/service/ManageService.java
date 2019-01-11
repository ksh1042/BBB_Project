package com.bbb.service;

import java.util.List;

import com.bbb.controller.SearchCriteria;
import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectPartakeVO;

public interface ManageService {
	
	//신청 받은 리스트
	public List<MemberVO> getJoinList(int pjNum) throws Exception;
	
	//참여중인 멤버
	public List<MemberVO> teamMemberList(int pjNum, String id, SearchCriteria cri) throws Exception;
	public int teamMemberCount(int pjNum, String id, SearchCriteria cri) throws Exception;
	/*public List<MemberVO> getTeamMember(int pjNum) throws Exception;*/
	
	public void fireMember(ProjectPartakeVO partake) throws Exception;
	
	public void applyMember(String id,int pjNum) throws Exception;
	public void refuseMember(String id,int pjNum) throws Exception;
}
