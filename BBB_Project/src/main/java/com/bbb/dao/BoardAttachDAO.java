package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.BoardAttachVO;

public interface BoardAttachDAO {
	
	void insertBoardAttach(BoardAttachVO boardAttach)throws SQLException;
	
	void updateBoardAttach(BoardAttachVO boardAttach) throws SQLException;
	
	void deleteBoardAttach(String uuid) throws SQLException;
	
	List<BoardAttachVO> selectSearchBoardAttachList(Criteria cri) throws SQLException;
	
	BoardAttachVO selectBoardAttachByUuid(String uuid) throws SQLException;
}
