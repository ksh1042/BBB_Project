package com.bbb.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.Criteria;
import com.bbb.dto.UnitworkHistVO;
import com.bbb.dto.UnitworkVO;

public class UnitworkDAOImpl implements UnitworkDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session){
		this.session = session;
	}
	
	@Override
	public List<UnitworkVO> selectUnitworkListByRdNum(int udNum) throws SQLException {
		return session.selectList("Unitwork.selectUnitworkListByRdNum", udNum);
	}

	@Override
	public List<UnitworkHistVO> selectUnitworkHistoryByRdNum(Criteria cri, int udNum) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds bound = new RowBounds(offset, limit);
		
		return session.selectList("Unitwork.selectUnitworkHistoryByRdNum", udNum, bound);
	}
	
	@Override
	public int selectUnitworkHistoryCountByRdNum(int udNum) throws SQLException {
		return session.selectOne("Unitwork.selectUnitworkHistoryCountByRdNum", udNum);
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
	public void deleteUDD(int udNum) throws SQLException {
		session.update("Unitwork.deleteUDD", udNum);
	}

	

}
