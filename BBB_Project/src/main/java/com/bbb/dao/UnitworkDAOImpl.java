package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bbb.dto.UnitworkHistVO;
import com.bbb.dto.UnitworkVO;

public class UnitworkDAOImpl implements UnitworkDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session){
		this.session = session;
	}
	
	@Override
	public List<UnitworkVO> selectUnitworkListByRdNum(int rdNum) throws SQLException {
		return session.selectList("Unitwork.selectUnitworkListByRdNum", rdNum);
	}

	@Override
	public List<UnitworkHistVO> selectUnitworkHistoryByRdNum(int rdNum) throws SQLException {
		return session.selectList("Unitwork.selectUnitworkHistoryByRdNum", rdNum);
	}

	@Override
	public int selectUdNumSeqNextval() throws SQLException {
		return (Integer)session.selectOne("Unitwork.selectUdNumSeqNextval");
	}

	@Override
	public void insertUD(UnitworkVO unit) throws SQLException {
		session.update("Unitwork.insertUD", unit);
	}

	@Override
	public void insertUDD(UnitworkVO unit) throws SQLException {
		session.update("Unitwork.insertUDD", unit);

	}

	@Override
	public void insertUDH(UnitworkHistVO unitHist) throws SQLException {
		session.update("Unitwork.insertUDH", unitHist);

	}

	@Override
	public void updateUDD(UnitworkVO unit) throws SQLException {
		session.update("Unitwork.updateUDD", unit);

	}

	@Override
	public void deleteUDD(UnitworkVO unit) throws SQLException {
		session.update("Unitwork.deleteUDD", unit);
	}

}
