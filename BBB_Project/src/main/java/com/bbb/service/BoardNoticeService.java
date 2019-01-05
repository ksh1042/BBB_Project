package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.BoardNoticeVO;
import com.bbb.dto.BoardVO;

public interface BoardNoticeService {
	
	BoardNoticeVO read(int bNum)throws SQLException;
	
	BoardNoticeVO readBoardNoticeByBnum(int bNum) throws SQLException;
 	
	void createNotice(BoardNoticeVO notice) throws SQLException;
	
	void create(BoardVO board) throws SQLException;
	
	void updateNotice(BoardNoticeVO notice) throws SQLException;
	
	void delete(int bNum)throws SQLException;
	
	void deleteNotice(int bNum) throws SQLException;
	
	int readSearchBoardCount(SearchCriteria cri) throws SQLException;
	
	int readSearchBoardNoticeCount(SearchCriteria cri)throws SQLException;
	
	List<BoardNoticeVO> readNoticelistAll() throws SQLException;
	
	List<BoardVO> readlistAll() throws SQLException;
	
	List<BoardVO> readlistSearch(SearchCriteria cri)throws SQLException;
	
	List<BoardNoticeVO> readNoticelistSearch(SearchCriteria cri)throws SQLException;
	
	List<BoardNoticeVO> readlistCriteria(Criteria cri) throws SQLException;
	
	int readBoardNoticebNum() throws SQLException;
}
