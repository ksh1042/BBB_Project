package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dao.ProjectPartakeDAO;
import com.bbb.dao.RequirementDAO;
import com.bbb.dao.UnitworkDAO;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.RequirementVO;
import com.bbb.dto.UnitworkHistVO;
import com.bbb.dto.UnitworkVO;

public class UnitworkServiceImpl implements UnitworkService {
	
	private ProjectPartakeDAO projectPartakeDAO;
	public void setProjectPartakeDAO(ProjectPartakeDAO projectPartakeDAO){
		this.projectPartakeDAO = projectPartakeDAO;
	}
	
	private UnitworkDAO unitworkDAO;
	public void setUnitworkDAO(UnitworkDAO unitworkDAO){
		this.unitworkDAO = unitworkDAO;
	}
	
	private RequirementDAO requirementDAO;
	public void setRequirementDAO(RequirementDAO requirementDAO){
		this.requirementDAO = requirementDAO;
	}
	
	@Override
	public List<UnitworkVO> readUnitworkList(int udNum) throws SQLException {
		return unitworkDAO.selectUnitworkListByRdNum(udNum);
	}

	@Override
	public List<UnitworkHistVO> readUnitworkHistoryList(Criteria cri, int udNum) throws SQLException {
		return unitworkDAO.selectUnitworkHistoryByRdNum(cri, udNum);
	}


	@Override
	public int readUnitworkHistoryCount(int udNum) throws SQLException {
		return unitworkDAO.selectUnitworkHistoryCountByRdNum(udNum);
	}
	
	
	@Override
	public void createUD(UnitworkVO unit) throws SQLException {
		unitworkDAO.insertUD(unit);
	}
	
	@Override
	public void updateUDD(List<UnitworkVO> unitList, UnitworkHistVO unitHist, int udNum) throws SQLException {
		unitworkDAO.deleteUDD(udNum);
		for(UnitworkVO unit : unitList){
			unit.setUdNum(udNum);
			unitworkDAO.insertUDD(unit);
		}
		unitworkDAO.insertUDH(unitHist);
	}
	
	@Override
	public void deleteUDD(int udNum) throws SQLException {
		unitworkDAO.deleteUDD(udNum);

	}

	@Override
	public List<ProjectPartakeVO> readBindingMemberList(int pjNum) throws SQLException {
		return projectPartakeDAO.selectBindingMember(pjNum);
	}

	@Override
	public List<RequirementVO> readRequirementList(int rdNum) throws SQLException {
		return requirementDAO.selectRequirementListById(rdNum);
	}

	

	

}
