package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dao.FinanceDAO;
import com.bbb.dao.FinanceDetailDAO;
import com.bbb.dao.ProjectDAO;
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
	
	private ProjectDAO projectDAO;
	public void setProjectDAO(ProjectDAO projectDAO){
		this.projectDAO = projectDAO;
	}
	

	@Override
	public void create(FinanceDetailVO financeDetail) throws SQLException {
		financeDetailDAO.insertFinanceDetail(financeDetail);
		
	}
	@Override
	public int createTotal(int fNum) throws SQLException {
		int total = (financeDetailDAO.selectFinanceDetailByPricePlus(fNum)) - (financeDetailDAO.selectFinanceDetailByPriceMinus(fNum));
		System.out.println(total);
		financeDAO.updateFinanceTotal(fNum, total);
		
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
	public List<FinanceVO> readFinanceList(int fNum) throws SQLException {
		List<FinanceVO> financeList = financeDAO.selectFinanceList(fNum);
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
	@Override
	public int createFinance(int pjNum) throws SQLException {
		int fNum = financeDAO.getFinanceSeqNextValue();
		financeDAO.insertFinance(fNum);
		System.out.println(fNum);
		System.out.println(pjNum);
		projectDAO.updateFnum(pjNum, fNum);
		
		return fNum;		
	}
	
}
