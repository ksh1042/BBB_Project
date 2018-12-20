package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.BoardVO;

public interface BoardService {
	
	List<BoardVO> getSearchBoardList(Criteria cri) throws SQLException;
	
	BoardVO getBoardByBnum(int bNum) throws SQLException;
	//조회
	
	void register(BoardVO board) throws SQLException;
	//작성
	
	void modify(BoardVO board) throws SQLException;
	//수정
	
	void remove(int bNum) throws SQLException;
	//삭제
}
