package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.FinanceVO;

public interface FinanceDAO {
	
	// 입력시 시퀀스등록을 위한 메서드
	int getFinanceSeqNextValue() throws SQLException;
	
	// 신규 예산내역 입력
	void insertFinance(int fNum) throws SQLException;
	
	// 잔여예산내역 갱신
	void updateFinanceTotal(int fNum, int total) throws SQLException;
		
	// 예산관리 테이블의 모든 정보를 가져온다.
	List<FinanceVO> selectFinanceList(int fNum) throws SQLException;
	
	// 예산의 잔여 금액을 가져온다.
	FinanceVO selectFinanceTotalByFnum(int fNum) throws SQLException;
	

}



















