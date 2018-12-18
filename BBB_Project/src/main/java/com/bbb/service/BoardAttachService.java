package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.BoardAttachVO;

public interface BoardAttachService {
	
	List<BoardAttachVO> getSearchBoardAttachList(Criteria cri) throws SQLException;
	//조회
	BoardAttachVO getBoardAttachByUuid(String uuid) throws SQLException;
	//작성
	void register(BoardAttachVO boardAttach) throws SQLException;
	//수정
	void modify(BoardAttachVO boardAttach) throws SQLException;
	//삭제
	void remove(String uuid) throws SQLException;
}
