package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.ProjectPlanVO;

public interface ProjectPlanDAO {

	public void insertAttach(ProjectPlanVO planVO) throws SQLException;
	public ProjectPlanVO getPlan(String puuid) throws SQLException;
	public void deletePlan(String puuid) throws SQLException;
	public List<ProjectPlanVO> selectPlansByPuuid(String puuid) throws SQLException;
}
