package com.bbb.service;

import java.util.List;

import com.bbb.dao.ManageDAO;
import com.bbb.dto.ProjectPartakeVO;

public class ManageServiceImpl implements ManageService {

	private ManageDAO manageDao;
	public void setManageDAO(ManageDAO manageDao){
		this.manageDao = manageDao;
	}
	
	@Override
	public List<ProjectPartakeVO> getJoinList(int pjNum) throws Exception {
		List<ProjectPartakeVO> joinList = manageDao.getJoinList(pjNum);
		return joinList;
	}

	@Override
	public List<ProjectPartakeVO> teamMemberList(int pjNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
