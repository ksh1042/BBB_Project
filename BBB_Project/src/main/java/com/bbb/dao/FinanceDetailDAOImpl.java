package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.FinanceDetailVO;

public class FinanceDetailDAOImpl implements FinanceDetailDAO {

	private SqlSession session;
	public void setSession(SqlSession session){
		this.session = session;
	}
	
	@Override
	public List<FinanceDetailVO> selectFinanceDetailList(Criteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<FinanceDetailVO> financeDetailList = session.selectList("FinanceDetail.selectFinanceDetailList", (SearchCriteria)cri, rowBounds);
		return financeDetailList;
	}

	@Override
	public int selectFinanceDetailListCount(Criteria cri) throws SQLException {
		int rowCount = session.selectOne("FinanceDetail.selectFinanceDetailListCount", cri);
		return rowCount;
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
	public int getFinanceDetailSeqNextValue() throws SQLException {
		return session.selectOne("FinanceDetail.getFinanceDetailSeqNextValue");
	}



}
