package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.RequirementVO;

public interface RequirementDAO {
	public List<RequirementVO> selectRequirementListById(int rdNum) throws SQLException;
}
