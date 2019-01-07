package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.BoardNoticeVO;
import com.bbb.dto.BoardVO;

public interface BoardService {
	public void create(BoardVO board) throws Exception ;

	public BoardVO read(int bNum) throws Exception;

	public BoardVO readBybNum(int bNum) throws Exception;

	public void update(BoardVO board) throws Exception;

	public void delete(int bNum) throws Exception;

	public List<BoardVO> readListAll() throws SQLException;

	public List<BoardVO> readListCriteria(Criteria cri) throws Exception;

	public List<BoardVO> readListSearch(SearchCriteria cri, int pjNum) throws Exception;

	int readSearchBoardCount(SearchCriteria cri ,int pjNum) throws Exception;
	
	public List<BoardVO> readlistSearch(SearchCriteria cri) throws SQLException;
	
	int readSearchBoardCount(SearchCriteria cri) throws SQLException;
	
	void createnotice(BoardVO board, BoardNoticeVO notice) throws SQLException;
	
	
}
