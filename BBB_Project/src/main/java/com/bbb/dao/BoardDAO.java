package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.BoardVO;

public interface BoardDAO {
	
	void insertBoard(BoardVO board)throws SQLException;

	BoardVO selectBoardByBnum(int bNum) throws SQLException;

	List<BoardVO> selectSearchBoardList(SearchCriteria cri , int pjNum) throws SQLException;

	void updateBoard(BoardVO board)throws SQLException;
	
	void deleteBoard(int bNum)throws SQLException;
		
	void increaseCount(int bNum)throws SQLException;
	
	List<BoardVO> selectBoardCriteria(Criteria cri) throws SQLException;
	
	int selectSearchBoardListCount(SearchCriteria cri , int pjNum) throws SQLException;
	
	List<BoardVO> selectSearchBoardList(SearchCriteria cri)throws SQLException;
	
	int selectSearchBoardCount(SearchCriteria cri)throws SQLException;
	
	List<BoardVO> selectBoardAll() throws SQLException;
	
	public int getSeqNextvalue() throws SQLException;
}
