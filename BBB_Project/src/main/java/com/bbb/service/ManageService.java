package com.bbb.service;

import java.util.List;

import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectPartakeVO;

public interface ManageService {
	
	//신청 받은 리스트
	public List<MemberVO> getJoinList(int pjNum) throws Exception;
	
	//참여중인 멤버
	public List<MemberVO> teamMemberList(int pjNum, String id) throws Exception;
	/*public List<MemberVO> getTeamMember(int pjNum) throws Exception;*/
	
	public void fireMember(ProjectPartakeVO partake) throws Exception;
	
	public void applyMember(ProjectPartakeVO partake) throws Exception;
	public void refuseMember(ProjectPartakeVO partake) throws Exception;
}
