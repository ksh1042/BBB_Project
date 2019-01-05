package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.UseCaseVO;

public interface UseCaseService {
	
	void create(UseCaseVO usecase) throws SQLException;
	
	void delete(String uuuid) throws SQLException;
	
	UseCaseVO read(String uuuid) throws SQLException;
	
	List<UseCaseVO> readList(String uuuid) throws SQLException;

	
}
