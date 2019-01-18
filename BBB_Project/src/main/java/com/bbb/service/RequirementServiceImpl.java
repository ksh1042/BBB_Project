package com.bbb.service;

import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dao.RequirementDAO;
import com.bbb.dto.ProjectVO;
import com.bbb.dto.RequirementHistVO;
import com.bbb.dto.RequirementVO;
import com.bbb.dto.UnitworkVO;

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
	public List<RequirementVO> selectReqList(Criteria cri,int rdNum) throws Exception {
		List<RequirementVO> reqList = null;
		if( cri == null){
			reqList = reqDAO.selectRequirementListAll(rdNum);
		} else {
			reqList = reqDAO.selectRequirementListByRdNum(cri,rdNum);
		}
		return reqList;
	}

	@Override
	public int selectReqListCount(Criteria cri, int rdNum) throws Exception {
		int count = reqDAO.selectRequirementListByRdNumCount(cri, rdNum);
		return count;
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

	@Override
	public List<RequirementHistVO> getRequireHistory(SearchCriteria cri, int rdNum) throws Exception {
		List<RequirementHistVO> reqHist = reqDAO.getReqHistory(cri, rdNum);
		return reqHist;
	}

	@Override
	public int getRequireHistoryCount(SearchCriteria cri, int rdNum) throws Exception {
		int histCount = reqDAO.getReqHistoryCount(cri, rdNum);
		return histCount;
	}

	@Override
	public List<RequirementVO> selectReqListAll(int rdNum) throws Exception {
		return reqDAO.selectRequirementListAll(rdNum);
	}


}
