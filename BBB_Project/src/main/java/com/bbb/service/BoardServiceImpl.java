package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dao.BoardDAO;
import com.bbb.dto.BoardVO;

public class BoardServiceImpl implements BoardService {

	private BoardDAO boardDAO;

	public void setBoardDAO(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}

	@Override
	public void create(BoardVO board) throws SQLException {
		boardDAO.insertBoard(board);
	}

	@Override
	public BoardVO read(int bNum) throws SQLException {
		BoardVO board = boardDAO.selectBoardByBnum(bNum);
		boardDAO.increaseCount(bNum);
		return board;
	}

	@Override
	public BoardVO readByBnum(int bNum) throws SQLException {
		BoardVO board = boardDAO.selectBoardByBnum(bNum);
		return board;
	}

	@Override
	public void modify(BoardVO board) throws SQLException {
		boardDAO.updateBoard(board);
		
	}

	@Override
	public void remove(int bNum) throws SQLException {
		boardDAO.deleteBoard(bNum);
	}

	@Override
	public List<BoardVO> listAll() throws SQLException {
		List<BoardVO> boardList = boardDAO.selectBoardAll();
		return boardList;
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws SQLException {
		List<BoardVO> boardList = boardDAO.selectBoardCriteria(cri);
		return boardList;
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws SQLException {
		List<BoardVO> boardList = boardDAO.selectSearchBoardList(cri);
		return boardList;
	}

	@Override
	public int readSearchBoardCount(SearchCriteria cri) throws SQLException {
		int count = boardDAO.selectSearchBoardCount(cri);
		return count;
	}
}
