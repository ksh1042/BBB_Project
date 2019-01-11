package com.bbb.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bbb.controller.Criteria;
import com.bbb.dao.GanttDAO;
import com.bbb.dao.ProjectDAO;
import com.bbb.dao.ProjectPartakeDAO;
import com.bbb.dao.RequirementDAO;
import com.bbb.dao.UnitworkDAO;
import com.bbb.dto.GanttVO;
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
	
	private GanttDAO ganttDAO;
	public void setGanttDAO(GanttDAO ganttDAO){
		this.ganttDAO = ganttDAO;
	}
	
	@Override
	public List<UnitworkVO> readUnitworkList(Criteria cri, int udNum) throws SQLException {
		List<UnitworkVO> unitworkList = null;
		if( cri == null){
			unitworkList = unitworkDAO.selectUnitworkListByRdNumAll(udNum);
		} else {
			unitworkList = unitworkDAO.selectUnitworkListByRdNum(cri, udNum);
		}
		return unitworkList;
	}

	@Override
	public List<UnitworkHistVO> readUnitworkHistoryList(Criteria cri, int udNum) throws SQLException {
		return unitworkDAO.selectUnitworkHistoryByRdNum(cri, udNum);
	}
	
	@Override
	public int readUnitworkCount(Criteria cri, int udNum) throws SQLException {
		return unitworkDAO.selectUnitworkCountByRdNum(cri, udNum);
	}
	@Override
	public int readUnitworkHistoryCount(Criteria cri, int udNum) throws SQLException {
		return unitworkDAO.selectUnitworkHistoryCountByRdNum(cri, udNum);
	}
	
	
	@Override
	public Map<String, Integer> createUD(ProjectVO project) throws SQLException {
		int udNum = unitworkDAO.selectUdNumSeqNextval();
		int gcNum = ganttDAO.selectGcNumSeqNextval();
		
		unitworkDAO.insertUD(udNum);
		ganttDAO.createGanttChart(gcNum);
		project.setUdNum(udNum);
		project.setGcNum(gcNum);
		projectDAO.insertUdNum(project);
		projectDAO.insertGcNum(project);
		
		Map<String, Integer> returnMap = new HashMap<String, Integer>();
		returnMap.put("udNum", udNum);
		returnMap.put("gcNum", gcNum);
		
		return returnMap;
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
	public void updateUDD(List<UnitworkVO> updateList, List<UnitworkVO> createList, List<Integer> removeList, UnitworkHistVO hist,
			ProjectVO project) throws SQLException {
		for(int uddNum : removeList){
			ganttDAO.deleteGanttDetailByUddNum(uddNum);
			unitworkDAO.deleteUDD(uddNum);
		}
		for(UnitworkVO unit : updateList){
			unitworkDAO.updateUDD(unit);
		}
		for(UnitworkVO unit : createList){
			
			int uddNum = unitworkDAO.selectUddNumSeqNextval();
			unit.setUddNum(uddNum);
			unit.setUdNum(project.getUdNum());
			
			GanttVO gantt = new GanttVO();
			gantt.setGcNum(project.getGcNum());
			gantt.setUddNum(uddNum);
			gantt.setStartDate(project.getStartDate());
			gantt.setEndDate(project.getStartDate());
			
			
			unitworkDAO.insertUDD(unit);
			ganttDAO.insertGanttDetail(gantt);
		}
		unitworkDAO.insertUDH(hist);
		
	}

	

}
