package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.UnitworkHistVO;
import com.bbb.dto.UnitworkVO;

public interface UnitworkService {
	public List<UnitworkVO> readUnitworkList(int udNum) throws SQLException;
	public List<UnitworkHistVO> readUnitworkHistoryList(int udNum) throws SQLException;
	public List<ProjectPartakeVO> readBindingMemberList(int pjNum) throws SQLException;
	
	public void createUD(UnitworkVO unit) throws SQLException;
	public void insertUDD(UnitworkVO unit, UnitworkHistVO unitHist) throws SQLException;
	public void updateUDD(UnitworkVO unit) throws SQLException;
	public void deleteUDD(UnitworkVO unit) throws SQLException;
}
