package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dao.BoardDAO;
import com.bbb.dto.BoardVO;

public class BoardServiceImpl implements BoardService {

	private BoardDAO boardDAO;

	public void setBoardDAO(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}

	@Override
	public List<BoardVO> getSearchBoardList(Criteria cri) throws SQLException {
		List<BoardVO> boardList = boardDAO.selectSearchBoardList(cri);
		return boardList;
	}

	@Override
	public BoardVO getBoardByBnum(int bnum) throws SQLException {
		BoardVO board = boardDAO.selectBoardByBum(bnum);
		return board;
	}

	@Override
	public void register(BoardVO board) throws SQLException {
		boardDAO.insertBoard(board);
	}

	@Override
	public void modify(BoardVO board) throws SQLException {
		boardDAO.updateBoard(board);
	}

	@Override
	public void remove(int bnum) throws SQLException {
		boardDAO.deleteBoard(bnum);
	}

}
