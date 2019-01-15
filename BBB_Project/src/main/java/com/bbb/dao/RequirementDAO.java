package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.ProjectVO;
import com.bbb.dto.RequirementHistVO;
import com.bbb.dto.RequirementVO;

public interface RequirementDAO {
	public int rdNumNextVal() throws SQLException;
	public void insertRdNum(ProjectVO project) throws SQLException;
	public void createRequirement(int rdNum) throws SQLException;
	public void deleteRequirement(int delNum) throws SQLException;
	public void createRequirementBySetRddNum(RequirementVO require) throws SQLException;
	public void updateRequirement(RequirementVO require) throws SQLException;
	public void insertRequireHist(RequirementHistVO reqHist) throws SQLException; 
	public List<RequirementVO> selectRequirementListById(int rdNum) throws SQLException;
	public List<RequirementVO> selectRequirementListAll(int rdNum) throws SQLException;
	public List<RequirementVO> selectRequirementListByRdNum(Criteria cri,int rdNum) throws SQLException;
	public int selectRequirementListByRdNumCount(Criteria cri,int rdNum) throws SQLException;
	public List<RequirementHistVO> getReqHistory(SearchCriteria cri,int rdNum) throws SQLException;
	public int getReqHistoryCount(SearchCriteria cri,int rdNum) throws SQLException;
}
