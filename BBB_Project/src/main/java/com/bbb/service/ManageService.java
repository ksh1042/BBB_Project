package com.bbb.service;

import java.util.List;

import com.bbb.dto.ProjectPartakeVO;

public interface ManageService {
	
	//신청 받은 리스트
	public List<ProjectPartakeVO> getJoinList(int pjNum) throws Exception;
	
	//참여중인 멤버
	public List<ProjectPartakeVO> teamMemberList(int pjNum) throws Exception;
	/*public List<MemberVO> getTeamMember(int pjNum) throws Exception;*/
}
