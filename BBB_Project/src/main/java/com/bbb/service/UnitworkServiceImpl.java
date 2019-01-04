package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dao.ProjectDAO;
import com.bbb.dao.ProjectPartakeDAO;
import com.bbb.dao.RequirementDAO;
import com.bbb.dao.UnitworkDAO;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.ProjectVO;
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
	
	private ProjectDAO projectDAO;
	public void setProjectDAO(ProjectDAO projectDAO){
		this.projectDAO = projectDAO;
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
	public int createUD(ProjectVO project) throws SQLException {
		int udNum = unitworkDAO.selectUdNumSeqNextval();
		unitworkDAO.insertUD(udNum);
		project.setUdNum(udNum);
		projectDAO.insertUdNum(project);
		
		return udNum;
	}
	

	@Override
	public List<ProjectPartakeVO> readBindingMemberList(int pjNum) throws SQLException {
		return projectPartakeDAO.selectBindingMember(pjNum);
	}

	@Override
	public List<RequirementVO> readRequirementList(int rdNum) throws SQLException {
		return requirementDAO.selectRequirementListById(rdNum);
	}
	
	@Override
	public void deleteUDDbyUddNum(List<Integer> uddNumList) throws SQLException {
		
		for(int uddNum : uddNumList){
			unitworkDAO.deleteUDD(uddNum);
		}
		
	}

	@Override
	public void updateUDDbyList(List<UnitworkVO> unitList) throws SQLException {
		for(UnitworkVO unit : unitList){
			unitworkDAO.updateUDD(unit);
		}
	}

	@Override
	public void createUDDbyList(List<UnitworkVO> unitList, int udNum) throws SQLException {
		for(UnitworkVO unit : unitList){
			int uddNum = unitworkDAO.selectUddNumSeqNextval();
			unit.setUddNum(uddNum);
			unit.setUdNum(udNum);
			unitworkDAO.insertUDD(unit);
		}
	}
	

}
