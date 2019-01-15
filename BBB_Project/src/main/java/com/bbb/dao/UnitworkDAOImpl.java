package com.bbb.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.UnitworkHistVO;
import com.bbb.dto.UnitworkVO;

public class UnitworkDAOImpl implements UnitworkDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session){
		this.session = session;
	}
	
	@Override
	public List<UnitworkVO> selectUnitworkListByRdNum(Criteria cri, int udNum) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds bound = new RowBounds(offset, limit);
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("cri", (SearchCriteria)cri);
		paramMap.put("udNum", udNum);
		return session.selectList("Unitwork.selectUnitworkListByRdNum", paramMap, bound);
	}

	@Override
	public List<UnitworkHistVO> selectUnitworkHistoryByRdNum(Criteria cri, int udNum) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds bound = new RowBounds(offset, limit);
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("cri", (SearchCriteria)cri);
		paramMap.put("udNum", udNum);
		
		return session.selectList("Unitwork.selectUnitworkHistoryByRdNum", paramMap, bound);
	}
	
	@Override
	public int selectUnitworkHistoryCountByRdNum(Criteria cri, int udNum) throws SQLException {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("cri", (SearchCriteria)cri);
		paramMap.put("udNum", udNum);
		return session.selectOne("Unitwork.selectUnitworkHistoryCountByRdNum", paramMap);
	}

	@Override
	public int selectUdNumSeqNextval() throws SQLException {
		return (Integer)session.selectOne("Unitwork.selectUdNum");
	}
	@Override
	public int selectUddNumSeqNextval() throws SQLException {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("Unitwork.selectUdNum");
	}

	@Override
	public void insertUD(int udNum) throws SQLException {
		session.update("Unitwork.insertUD", udNum);
	}

	@Override
	public void deleteUDD(int uddNum) throws SQLException {
		session.update("Unitwork.deleteUDD", uddNum);
	}

	@Override
	public void updateUDD(UnitworkVO unit) throws SQLException {
		session.update("Unitwork.updateUDD", unit);
	}

	@Override
	public void insertUDD(UnitworkVO unit) throws SQLException {
		session.update("Unitwork.insertUDD", unit);
		
	}

	@Override
	public int selectUnitworkCountByRdNum(Criteria cri, int udNum) throws SQLException {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("cri", (SearchCriteria)cri);
		paramMap.put("udNum", udNum);
		return session.selectOne("Unitwork.selectUnitworkCountByRdNum", paramMap);
	}

	@Override
	public List<UnitworkVO> selectUnitworkListByRdNumAll(int udNum) throws SQLException {
		return session.selectList("Unitwork.selectUnitworkListByRdNumAll", udNum);
	}

	@Override
	public void insertUDH(UnitworkHistVO hist) throws SQLException {
		session.update("Unitwork.insertUDH", hist);
		
	}

	

}
