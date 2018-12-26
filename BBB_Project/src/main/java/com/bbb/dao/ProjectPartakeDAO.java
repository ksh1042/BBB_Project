package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

public interface ProjectPartakeDAO {
	
	//프로젝트 리스트를 불러온다.
	List<Integer> selectProjectPartakeList(String id) throws SQLException;


}
