package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.UseCaseVO;

public interface UseCaseDAO {
	
	void insertUseCase(UseCaseVO usecase) throws SQLException;
	
	void deleteUseCase(String uUuid) throws SQLException;
	
	List<UseCaseVO> selectUseCaseByuUuid(String uUuid) throws SQLException;
	
	
	
	
	
}
