package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.FinanceDetailVO;
import com.bbb.dto.FinanceVO;

public interface FinanceService {
	
	
	List<FinanceDetailVO> readFinanceDetailList(Criteria cri) throws SQLException;

	List<FinanceVO> readFinanceList(Criteria cri) throws SQLException;
	
	FinanceVO readByFnum(int fNum) throws Exception;
	
	void create(FinanceDetailVO financeDetail) throws Exception;
	
	








}
