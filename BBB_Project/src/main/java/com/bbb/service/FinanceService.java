package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.FinanceDetailVO;
import com.bbb.dto.FinanceVO;

public interface FinanceService {
	
	void create(FinanceDetailVO financeDetail) throws SQLException;
	
	int createTotal(int fNum) throws SQLException;
	
	List<FinanceDetailVO> readFinanceDetailList(int fNum) throws SQLException;

	List<FinanceVO> readFinanceList() throws SQLException;
	
	FinanceVO readFnumByFinance(int fNum) throws SQLException;
	
	FinanceDetailVO readFnumByFinanceDetail(int fNum) throws SQLException;
	
	List<FinanceDetailVO> readRegdateByFnum(int fNum) throws SQLException;
}
