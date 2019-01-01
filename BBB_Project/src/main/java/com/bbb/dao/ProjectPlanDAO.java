package com.bbb.dao;

import java.sql.SQLException;

import com.bbb.dto.ProjectPlanVO;

public interface ProjectPlanDAO {

	public void insertAttach(ProjectPlanVO planVO) throws SQLException;
	public ProjectPlanVO getPlan(String puuid) throws SQLException;
	public void deletePlan(String puuid) throws SQLException;
}
