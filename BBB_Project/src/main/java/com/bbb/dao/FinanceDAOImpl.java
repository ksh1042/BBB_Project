package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.FinanceDetailVO;
import com.bbb.dto.FinanceVO;

public class FinanceDAOImpl implements FinanceDAO {

	private SqlSession session;
	public void setSession(SqlSession session){
		this.session = session;
	}
	
	@Override
	public List<FinanceVO> selectFinanceList() throws SQLException {
		List<FinanceVO> finList = session.selectList("Finance.selectFinanceList");
		return finList;
	}

	@Override
	public FinanceVO selectFinanceTotalByFnum(int fNum) throws SQLException {
		FinanceVO finance = session.selectOne("Finance.selectFinanceTotalByFnum", fNum);
		return finance;
	}


	

}
