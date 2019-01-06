package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.BoardNoticeVO;
import com.bbb.dto.BoardVO;

public interface BoardNoticeDAO {
	
	void insertBoard(BoardVO board)throws SQLException;
	
	void insertBoardNotice(BoardNoticeVO notice)throws SQLException;

	int selectBoardNoticebNum()throws SQLException;
	
	BoardVO selectBoardByBnum(int bNum)throws SQLException;
	
	BoardNoticeVO selectBoardNoticeByBnum(int bNum)throws SQLException;
	
	void updateBoard(BoardVO board)throws SQLException;
	
	void deleteBoardNotice(int bNum)throws SQLException;
	
	void deleteBoard(int bNum)throws SQLException;

	List<BoardNoticeVO> selectSearchBoardNoticeList(SearchCriteria cri) throws SQLException;
	
	List<BoardVO> selectSearchBoardList(SearchCriteria cri) throws SQLException;
	
	List<BoardNoticeVO> seletBoardNoticeCriteria(Criteria cri) throws SQLException;
	
	List<BoardNoticeVO> selectBoardNoticeAll()throws SQLException;
	
	List<BoardVO> selectBoardAll()throws SQLException;
	
	int selectSearchBoardCount(SearchCriteria cri)throws SQLException;
	
	int selectSearchBoardNoticeCount(SearchCriteria cri)throws SQLException;
	
	
	
}
