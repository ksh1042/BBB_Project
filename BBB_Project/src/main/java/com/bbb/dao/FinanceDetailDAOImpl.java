package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bbb.dto.FinanceDetailVO;

public class FinanceDetailDAOImpl implements FinanceDetailDAO {

	private SqlSession session;
	public void setSession(SqlSession session){
		this.session = session;
	}
	
	
	
	@Override
	public List<FinanceDetailVO> selectFinanceDetailList(int fNum) throws SQLException {
		List<FinanceDetailVO> financeDetailList = session.selectList("FinanceDetail.selectFinanceDetailList", fNum);
		return financeDetailList;
	}


	@Override
	public FinanceDetailVO selectFinanceDetailByFnum(int fNum) throws SQLException {
		FinanceDetailVO financeDetail = (FinanceDetailVO)session.selectOne("FinanceDetail.selectFinanceDetailByFnum", fNum);
		return financeDetail;
	}

	@Override
	public void insertFinanceDetail(FinanceDetailVO financeDetail) throws SQLException {
		session.update("FinanceDetail.insertFinanceDetail", financeDetail);

	}

	@Override
	public List<FinanceDetailVO> selectRegdateByFnum(int fNum) throws SQLException {
		List<FinanceDetailVO> financeDetailRegList = session.selectList("FinanceDetail.selectRegdateByFnum", fNum);
		return financeDetailRegList;
	}

	@Override
	public int selectFinanceDetailByPricePlus(int fNum) throws SQLException {
		
		if((session.selectOne("FinanceDetail.selectFinanceByPricePlus", fNum))==null){
			return 0;
		}else{
			return session.selectOne("FinanceDetail.selectFinanceByPricePlus", fNum);
		}
		
		
	}

	@Override
	public int selectFinanceDetailByPriceMinus(int fNum) throws SQLException {
		
		if(session.selectOne("FinanceDetail.selectFinanceByPriceMinus", fNum)==null){
			return 0;
		}else{
			return session.selectOne("FinanceDetail.selectFinanceByPriceMinus", fNum);
		}
	}


	
	




}
