package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

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
	public void create(FinanceDetailVO financeDetail) throws SQLException {
		financeDetailDAO.insertFinanceDetail(financeDetail);
		
	}
	@Override
	public int createTotal(int fNum) throws SQLException {
		int plus = financeDetailDAO.selectFinanceDetailByPricePlus(fNum);
		int minus = financeDetailDAO.selectFinanceDetailByPriceMinus(fNum);
		int total = plus-minus;
		return total;
	}
	@Override
	public List<FinanceDetailVO> readFinanceDetailList(int fNum) throws SQLException {
		List<FinanceDetailVO> financeDetailList = financeDetailDAO.selectFinanceDetailList(fNum);
		return financeDetailList;
	}
	@Override
	public FinanceDetailVO readFnumByFinanceDetail(int fNum) throws SQLException {
		FinanceDetailVO financeDetail = financeDetailDAO.selectFinanceDetailByFnum(fNum);
		return financeDetail;
	}
	
	@Override
	public List<FinanceVO> readFinanceList() throws SQLException {
		List<FinanceVO> financeList = financeDAO.selectFinanceList();
		return financeList;
	}
	@Override
	public FinanceVO readFnumByFinance(int fNum) throws SQLException {
		FinanceVO finance = financeDAO.selectFinanceTotalByFnum(fNum);
		return finance;
	}
	@Override
	public List<FinanceDetailVO> readRegdateByFnum(int fNum) throws SQLException {
		List<FinanceDetailVO> financeDetailRegList = financeDetailDAO.selectRegdateByFnum(fNum);
		return financeDetailRegList;
	}

	
	
}
