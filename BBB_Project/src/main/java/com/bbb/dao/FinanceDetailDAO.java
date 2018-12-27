package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.FinanceDetailVO;

public interface FinanceDetailDAO {

	// 예산관리테이블의 모든 정보를 가져옴
	List<FinanceDetailVO> selectFinanceDetailList(Criteria cri) throws SQLException;

	// 예산관리 검색을 위한
	int selectFinanceDetailListCount(Criteria cri) throws SQLException;
	
	
	FinanceDetailVO selectFinanceDetailByFnum(int fNum) throws SQLException;
	
	// 예산 입력
	void insertFinanceDetail(FinanceDetailVO financeDetail) throws SQLException;
	
	// 입력시 시퀀스등록을 위한 메서드
	int getFinanceDetailSeqNextValue() throws SQLException;
	
}
