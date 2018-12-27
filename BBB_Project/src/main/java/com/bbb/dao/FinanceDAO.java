package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.FinanceVO;

public interface FinanceDAO {
	
	// 프로젝트에 포함되어있는 예산관리챠트의 목록을 가져온다.
	List<Integer> selectFinanceList(Criteria cri) throws SQLException;
	
	FinanceVO selectFinanceTotalByFnum(int fNum) throws SQLException;
}
