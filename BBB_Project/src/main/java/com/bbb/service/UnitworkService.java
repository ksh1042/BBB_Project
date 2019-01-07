package com.bbb.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bbb.controller.Criteria;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.ProjectVO;
import com.bbb.dto.RequirementVO;
import com.bbb.dto.UnitworkHistVO;
import com.bbb.dto.UnitworkVO;

public interface UnitworkService {
	public List<UnitworkVO> readUnitworkList(int udNum) throws SQLException;
	public List<UnitworkHistVO> readUnitworkHistoryList(Criteria cri, int udNum) throws SQLException;
	public List<ProjectPartakeVO> readBindingMemberList(int pjNum) throws SQLException;
	public List<RequirementVO> readRequirementList(int rdNum) throws SQLException;
	
	public int readUnitworkHistoryCount(int udNum) throws SQLException;
	
	public Map<String, Integer> createUD(ProjectVO project) throws SQLException;
	public void updateUDD(List<UnitworkVO> updateList, List<UnitworkVO> createList, List<Integer> removeList, ProjectVO project) throws SQLException;
	
}
