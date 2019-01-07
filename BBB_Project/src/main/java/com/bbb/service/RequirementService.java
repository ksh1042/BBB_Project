package com.bbb.service;

import java.util.List;

import com.bbb.dto.ProjectVO;
import com.bbb.dto.RequirementHistVO;
import com.bbb.dto.RequirementVO;

public interface RequirementService {

	public int rdNumNextval() throws Exception;
	public void insertRdNum(ProjectVO project) throws Exception;
	public void createRequirement(int rdNum) throws Exception;
	public void deleteRequirement(int delNum) throws Exception;
	public void createRequirementBySetRddNum(RequirementVO require) throws Exception;
	public void updateRequirement(RequirementVO require) throws Exception;
	public void insertRequireHist(RequirementHistVO reqHist) throws Exception;
	public List<RequirementVO> selectReqList(int rdNum) throws Exception;
}
