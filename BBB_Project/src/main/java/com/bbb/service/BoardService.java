package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.BoardVO;

public interface BoardService {
	
	void register(BoardVO board) throws SQLException;
	//작성
	
	BoardVO read(int bNum)throws SQLException;
	//조회
	
	BoardVO readByBnum(int bNum)throws SQLException;
	
	
	void modify(BoardVO board) throws SQLException;
	//수정
	
	void remove(int bNum) throws SQLException;
	//삭제
	
	List<BoardVO> listAll() throws SQLException;
	
	List<BoardVO> listCriteria(Criteria cri) throws SQLException;
	
	List<BoardVO> listSearch(SearchCriteria cri) throws SQLException;
	
	int readSearchBoardCount(SearchCriteria cri) throws SQLException;
}
