package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.UnitworkHistVO;
import com.bbb.dto.UnitworkVO;

public interface UnitworkDAO {

	public List<UnitworkVO> selectUnitworkListByRdNum(int udNum) throws SQLException;
	public List<UnitworkHistVO> selectUnitworkHistoryByRdNum(int udNum) throws SQLException;
	public int selectUdNumSeqNextval() throws SQLException;
	public void insertUD(UnitworkVO unit) throws SQLException;
	public void insertUDD(UnitworkVO unit) throws SQLException;
	public void insertUDH(UnitworkHistVO unitHist) throws SQLException;
	public void updateUDD(UnitworkVO unit) throws SQLException;
	public void deleteUDD(UnitworkVO unit) throws SQLException;
	
}
