package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bbb.dto.UseCaseVO;

public class UseCaseDAOImpl implements UseCaseDAO {

    private SqlSession session;
    public void setSession(SqlSession session){
       this.session=session;
    }
	@Override
	public void insertUseCase(UseCaseVO usecase) throws SQLException {
		session.update("UseCase.insertUseCase", usecase);

	}

	@Override
	public void deleteUseCase(String uUuid) throws SQLException {
		session.update("UseCase.deleteUseCase", uUuid);

	}

	@Override
	public List<UseCaseVO> selectUseCaseByuUuid(String uUuid) throws SQLException {
		List<UseCaseVO> usecaseList = session.selectList("UseCase.selectUseCaseByuUuid", uUuid);
		return usecaseList;
	}

}
