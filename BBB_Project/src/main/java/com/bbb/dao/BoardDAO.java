package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.BoardVO;

public interface BoardDAO {
	
	void insertBoard(BoardVO board)throws SQLException;
	
	void updateBoard(BoardVO board)throws SQLException;
	
	void deleteBoard(int bNum)throws SQLException;
	
	List<BoardVO> selectSearchBoardList(Criteria cri)throws SQLException;
	
	int selectSearchBoardListCount(Criteria cri)throws SQLException;
	
	BoardVO selectBoardByBum(int bNum) throws SQLException;
}
