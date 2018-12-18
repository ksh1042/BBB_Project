package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dao.BoardAttachDAO;
import com.bbb.dto.BoardAttachVO;

public class BoardAttachServiceImpl implements BoardAttachService {

	private BoardAttachDAO boardAttachDAO;
	public void setBoardAttachDAO(BoardAttachDAO boardAttachDAO){
		this.boardAttachDAO = boardAttachDAO;
	}
	
	@Override
	public List<BoardAttachVO> getSearchBoardAttachList(Criteria cri) throws SQLException {
		List<BoardAttachVO> boardAttachList = boardAttachDAO.selectSearchBoardAttachList(cri);
		return boardAttachList;
	}

	@Override
	public BoardAttachVO getBoardAttachByUuid(String uuid) throws SQLException {
		BoardAttachVO boardAttach = boardAttachDAO.selectBoardAttachByUuid(uuid);
		return boardAttach;
	}

	@Override
	public void register(BoardAttachVO boardAttach) throws SQLException {
		boardAttachDAO.insertBoardAttach(boardAttach);
	}

	@Override
	public void modify(BoardAttachVO boardAttach) throws SQLException {
		boardAttachDAO.updateBoardAttach(boardAttach);
	}

	@Override
	public void remove(String uuid) throws SQLException {
		boardAttachDAO.deleteBoardAttach(uuid);
	}

}
