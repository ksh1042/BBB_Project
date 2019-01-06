package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.RequirementVO;
import com.bbb.dto.UnitworkHistVO;
import com.bbb.dto.UnitworkVO;

public interface UnitworkService {
	public List<UnitworkVO> readUnitworkList(int udNum) throws SQLException;
	public List<UnitworkHistVO> readUnitworkHistoryList(Criteria cri, int udNum) throws SQLException;
	public List<ProjectPartakeVO> readBindingMemberList(int pjNum) throws SQLException;
	public List<RequirementVO> readRequirementList(int rdNum) throws SQLException;
	
	public int readUnitworkHistoryCount(int udNum) throws SQLException;
	
	public void createUD(UnitworkVO unit) throws SQLException;
	public void updateUDD(List<UnitworkVO> unitList, UnitworkHistVO unitHist, int udNum) throws SQLException;
	public void deleteUDD(int udNum) throws SQLException;
}
