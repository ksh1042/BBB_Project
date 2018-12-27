package com.bbb.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dao.FinanceDAO;
import com.bbb.dao.FinanceDetailDAO;
import com.bbb.dto.FinanceDetailVO;
import com.bbb.dto.FinanceVO;

public class FinanceServiceImpl implements FinanceService {
	
	private FinanceDetailDAO financeDetailDAO;
	public void setFinanceDetailDAO(FinanceDetailDAO financeDetailDAO){
		this.financeDetailDAO = financeDetailDAO;
	}
	
	private FinanceDAO financeDAO;
	public void setFinanceDAO(FinanceDAO financeDAO){
		this.financeDAO = financeDAO;
	}
	
	
	@Override
	public List<FinanceDetailVO> readFinanceDetailList(Criteria cri) throws SQLException {
		
		// 프로젝트별 가지고있는 예산정보
		List<Integer> financeList = financeDAO.selectFinanceList(cri);
		// Detail에 저장되어있는 예산정보 전체
		List<FinanceDetailVO> financeDetailList = financeDetailDAO.selectFinanceDetailList(cri);
		// 비교값을 저장하기 위한 배열
		List<FinanceDetailVO> financeDetailListByFnum = new ArrayList<FinanceDetailVO>();
		
		for(FinanceDetailVO  financeDetail : financeDetailList){
			for(int finance : financeList){
				if(financeDetail.getfNum() == finance){
					financeDetailListByFnum.add(financeDetail);
				}
			}
		}
		
		
		return financeDetailListByFnum;
	}

	@Override
	public List<FinanceVO> readFinanceList(Criteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 예산관리 총액을 가져오기 위한 메서드
	@Override
	public FinanceVO readByFnum(int fNum) throws Exception {
		return financeDAO.selectFinanceTotalByFnum(fNum);
	}

	@Override
	public void create(FinanceDetailVO financeDetail) throws Exception {
		int fNum = financeDetailDAO.getFinanceDetailSeqNextValue();
		financeDetail.setfNum(fNum);
		financeDetailDAO.insertFinanceDetail(financeDetail);
		
	}

}
