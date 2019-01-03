package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.UseCaseVO;

public interface UseCaseService {
	
	void create(UseCaseVO usecase) throws SQLException;
	
	void delete(String uUuid) throws SQLException;
	
	UseCaseVO read(String uUuid) throws SQLException;
	
	List<UseCaseVO> readList(String uUuid) throws SQLException;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
