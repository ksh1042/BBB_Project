package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.FinanceDetailVO;

public interface FinanceDetailDAO {

	
	
	// 예산관리 디테일 테이블의 모든 정보를 가져온다
	List<FinanceDetailVO> selectFinanceDetailList(int fNum) throws SQLException;

	// fnum을 기준으로 비교를 하여 프로젝트별로 값을 가져오기위해 사용
	FinanceDetailVO selectFinanceDetailByFnum(int fNum) throws SQLException;
	
	// 예산 입력
	void insertFinanceDetail(FinanceDetailVO financeDetail) throws SQLException;
	
	List<FinanceDetailVO> selectRegdateByFnum(int fNum) throws SQLException;
	
	// 추가예산을 받을 경우 값을 계산하기 위한 메서드
	int selectFinanceDetailByPricePlus(int fNum) throws SQLException;
	
	// 예산을 사용했을경우 값을 계산하기 위한 메서드
	int selectFinanceDetailByPriceMinus(int fNum) throws SQLException;
}
