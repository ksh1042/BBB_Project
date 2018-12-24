package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.BoardVO;
import com.bbb.dto.MemberVO;

public interface BoardDAO {

	public void insertBoard(BoardVO board) throws SQLException;

	BoardVO selectBoardBybNum(int bNum) throws SQLException;
	
	public void updateBoard(BoardVO board) throws SQLException;

	public void deleteBoard(int bNum) throws SQLException;

	void increaseViewcnt(int bNum) throws Exception;
	
	List<MemberVO> selectSearchBoardList(Criteria cri) throws SQLException;
	
	List<BoardVO> selectBoardCriteria(SearchCriteria cri) throws SQLException;
	
	int selectSearchBoardListCount(SearchCriteria cri) throws SQLException;
	
	List<BoardVO> selectBoardAll() throws Exception;
	
	int getSeqNextvalue() throws Exception;
}
