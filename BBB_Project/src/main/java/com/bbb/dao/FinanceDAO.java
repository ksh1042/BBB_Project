package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.FinanceVO;

public interface FinanceDAO {
	
	// 예산관리 테이블의 모든 정보를 가져온다.
	List<FinanceVO> selectFinanceList() throws SQLException;
	
	// 예산의 잔여 금액을 가져온다.
	FinanceVO selectFinanceTotalByFnum(int fNum) throws SQLException;
	

}
