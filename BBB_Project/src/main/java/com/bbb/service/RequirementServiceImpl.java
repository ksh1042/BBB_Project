package com.bbb.service;

import java.util.List;

import com.bbb.dao.RequirementDAO;
import com.bbb.dto.ProjectVO;
import com.bbb.dto.RequirementHistVO;
import com.bbb.dto.RequirementVO;

public class RequirementServiceImpl implements RequirementService {

	private RequirementDAO reqDAO;
	public void setRequirementDAO(RequirementDAO reqDAO){
		this.reqDAO = reqDAO;
	}
	
	@Override
	public int rdNumNextval() throws Exception {
		return reqDAO.rdNumNextVal();
	}

	@Override
	public void insertRdNum(ProjectVO project) throws Exception {
		reqDAO.insertRdNum(project);
	}

	@Override
	public List<RequirementVO> selectReqList(int rdNum) throws Exception {
		List<RequirementVO> reqList = reqDAO.selectRequirementListByRdNum(rdNum);
		return reqList;
	}

	@Override
	public void createRequirement(int rdNum) throws Exception {
		reqDAO.createRequirement(rdNum);
		
	}

	@Override
	public void deleteRequirement(int delNum) throws Exception {
		reqDAO.deleteRequirement(delNum);
	}

	@Override
	public void createRequirementBySetRddNum(RequirementVO require) throws Exception {
		reqDAO.createRequirementBySetRddNum(require);
	}

	@Override
	public void updateRequirement(RequirementVO require) throws Exception {
		reqDAO.updateRequirement(require);
	}

	@Override
	public void insertRequireHist(RequirementHistVO reqHist) throws Exception {
		reqDAO.insertRequireHist(reqHist);
	}

}
