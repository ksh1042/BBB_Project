package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.BoardNoticeVO;
import com.bbb.dto.BoardVO;

public interface BoardService {
	
	void create(BoardVO board) throws SQLException;
	//작성
	
	public BoardVO read(int bNum)throws SQLException;
	//조회
	
	public BoardVO readByBnum(int bNum)throws SQLException;
	
	
	public void update(BoardVO board) throws SQLException;
	//수정
	
	public void delete(int bNum) throws SQLException;
	//삭제
	
	public List<BoardVO> readlistAll() throws SQLException;
	
	public List<BoardVO> readlistCriteria(Criteria cri) throws SQLException;
	
	public List<BoardVO> readlistSearch(SearchCriteria cri) throws SQLException;
	
	int readSearchBoardCount(SearchCriteria cri) throws SQLException;
	
	void createnotice(BoardVO board, BoardNoticeVO notice) throws SQLException;
	
	
}
