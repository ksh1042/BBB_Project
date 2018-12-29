package com.bbb.service;

import java.sql.SQLException;

import com.bbb.dao.ProjectPlanDAO;
import com.bbb.dto.ProjectPlanVO;

public class ProjectPlanServiceImpl implements ProjectPlanService {

	private ProjectPlanDAO projectPlanDAO;
	public void setProjectDAO(ProjectPlanDAO projectPlanDAO){
		this.projectPlanDAO = projectPlanDAO;
	}
	
	@Override
	public void create(ProjectPlanVO planVO) throws SQLException {
		projectPlanDAO.insertAttach(planVO);
		
	}

	@Override
	public ProjectPlanVO getPlan(String puuid) throws SQLException {
		ProjectPlanVO plan = projectPlanDAO.getPlan(puuid);
		return plan;
	}

}
