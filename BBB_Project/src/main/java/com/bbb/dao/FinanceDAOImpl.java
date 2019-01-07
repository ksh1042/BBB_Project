package com.bbb.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bbb.dto.FinanceVO;

public class FinanceDAOImpl implements FinanceDAO {

	private SqlSession session;
	public void setSession(SqlSession session){
		this.session = session;
	}
	
	@Override
	public int getFinanceSeqNextValue() throws SQLException {
		int fNum = session.selectOne("Finance.getFinanceSeqNextValue");
		return fNum;
	}
	
	@Override
	public List<FinanceVO> selectFinanceList(int fNum) throws SQLException {
		List<FinanceVO> finList = session.selectList("Finance.selectFinanceList");
		return finList;
	}

	@Override
	public FinanceVO selectFinanceTotalByFnum(int fNum) throws SQLException {
		FinanceVO finance = session.selectOne("Finance.selectFinanceTotalByFnum", fNum);
		
		if(finance==null){
			return null;
		}else{
			return finance;
		}
	}

	@Override
	public void insertFinance(int fNum) throws SQLException {
		session.update("Finance.insertFinance", fNum);
		
	}

	@Override
	public void updateFinanceTotal(int fNum, int total) throws SQLException {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("fNum", fNum);
		map.put("total", total);
		session.update("Finance.updateFinanceTotal", map);
		
	}


	

}
