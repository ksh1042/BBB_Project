package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dao.BoardDAO;
import com.bbb.dao.BoardNoticeDAO;
import com.bbb.dto.BoardNoticeVO;
import com.bbb.dto.BoardVO;

public class BoardServiceImpl implements BoardService {

	private BoardDAO boardDAO;
	
	private BoardNoticeDAO noticeDAO;
	public void setBoardNoticeDAO(BoardNoticeDAO noticeDAO){
		this.noticeDAO=noticeDAO;
	}

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
	public void update(BoardVO board) throws SQLException {
		boardDAO.updateBoard(board);
		
	}

	@Override
	public void delete(int bNum) throws SQLException {
		boardDAO.deleteBoard(bNum);
	}

	@Override
	public List<BoardVO> readListAll() throws SQLException {
		List<BoardVO> boardList = boardDAO.selectBoardAll();
		return boardList;
	}

	@Override
	public List<BoardVO> readListCriteria(Criteria cri) throws SQLException {
		List<BoardVO> boardList = boardDAO.selectBoardCriteria(cri);
		return boardList;
	}

	@Override
	public List<BoardVO> readListSearch(SearchCriteria cri, int pjNum) throws Exception {
		List<BoardVO> boardList=boardDAO.selectSearchBoardList(cri, pjNum);
		return boardList;
	}
	
	@Override
	public List<BoardVO> readlistSearch(SearchCriteria cri) throws SQLException {
		List<BoardVO> boardList = boardDAO.selectSearchBoardList(cri);
		return boardList;
	}

	@Override
	public int readSearchBoardCount(SearchCriteria cri,int pjNum) throws Exception {
		int count = boardDAO.selectSearchBoardListCount(cri , pjNum);
		return count;
	}
	@Override
	public int readSearchBoardCount(SearchCriteria cri) throws SQLException {
		int count = boardDAO.selectSearchBoardCount(cri);
		return count;
	}

	@Override
	public void createnotice(BoardVO board, BoardNoticeVO notice) throws SQLException {
		boardDAO.insertBoard(board);
		noticeDAO.insertBoardNotice(notice);
		
	}

	@Override
	public BoardVO readBybNum(int bNum) throws Exception {
		BoardVO board = boardDAO.selectBoardByBnum(bNum);
		return board;
	}
	
}
