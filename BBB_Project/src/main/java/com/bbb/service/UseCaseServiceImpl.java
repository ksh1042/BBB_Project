package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dao.UseCaseDAO;
import com.bbb.dto.UseCaseVO;

public class UseCaseServiceImpl implements UseCaseService {

	private UseCaseDAO usecaseDAO;
	public void setUseCaseDAO(UseCaseDAO usecaseDAO){
		this.usecaseDAO = usecaseDAO;
	}
	
	@Override
	public void create(UseCaseVO usecase) throws SQLException {
		usecaseDAO.insertUseCase(usecase);

	}

	@Override
	public void delete(String uUuid) throws SQLException {
		usecaseDAO.deleteUseCase(uUuid);

	}

	@Override
	public UseCaseVO read(String uUuid) throws SQLException {
		UseCaseVO usecase = (UseCaseVO)usecaseDAO.selectUseCaseByuUuid(uUuid);
		return usecase;
	}

	@Override
	public List<UseCaseVO> readList(String uUuid) throws SQLException {
		List<UseCaseVO> usecaseList = usecaseDAO.selectUseCaseByuUuid(uUuid);
		return usecaseList;
	}

}
