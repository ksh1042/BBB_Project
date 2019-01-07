package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.ProjectPlanVO;

public interface ProjectPlanService {

	public void create(ProjectPlanVO planVO) throws SQLException;
	public ProjectPlanVO getPlan(String puuid) throws SQLException;
	public void deletePlan(String puuid) throws SQLException;
	public List<ProjectPlanVO> getAttach(String puuid) throws SQLException;
}
