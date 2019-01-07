package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dao.BoardNoticeDAO;
import com.bbb.dto.BoardNoticeVO;
import com.bbb.dto.BoardVO;

public class BoardNoticeServiceImpl implements BoardNoticeService {

	private BoardNoticeDAO boardnoticeDAO;
	public void setBoardNoticeDAO(BoardNoticeDAO boardnoticeDAO){
		this.boardnoticeDAO = boardnoticeDAO;
	}
	
	@Override
	public BoardNoticeVO readBoardNoticeByBnum(int bNum) throws SQLException {
		BoardNoticeVO boardnotice = boardnoticeDAO.selectBoardNoticeByBnum(bNum);
		return boardnotice;
	}
	@Override
	public void createNotice(BoardNoticeVO notice) throws SQLException {
		boardnoticeDAO.insertBoardNotice(notice);
		
	}
	@Override
	public void delete(int bNum) throws SQLException {
		boardnoticeDAO.deleteBoardNotice(bNum);
		
	}
	@Override
	public int readSearchBoardCount(SearchCriteria cri) throws SQLException {
		int count = boardnoticeDAO.selectSearchBoardCount(cri);
		return count;
	}
	@Override
	public List<BoardVO> readlistAll() throws SQLException {
		List<BoardVO> boardlist = boardnoticeDAO.selectBoardAll();
		return boardlist;
	}
	@Override
	public List<BoardVO> readlistSearch(SearchCriteria cri) throws SQLException {
		List<BoardVO> boardlist = boardnoticeDAO.selectSearchBoardList(cri);
		return boardlist;
	}
	@Override
	public List<BoardNoticeVO> readlistCriteria(Criteria cri) throws SQLException {
		List<BoardNoticeVO> boardlist = boardnoticeDAO.seletBoardNoticeCriteria(cri);
		return boardlist;
	}

	@Override
	public BoardNoticeVO read(int bNum) throws SQLException {
		BoardNoticeVO boardnotice = boardnoticeDAO.selectBoardNoticeByBnum(bNum);
		return boardnotice;
	}

	@Override
	public void create(BoardVO board) throws SQLException {
		boardnoticeDAO.insertBoard(board);
		
	}

	@Override
	public void deleteNotice(int bNum) throws SQLException {
		boardnoticeDAO.deleteBoard(bNum);
		
	}

	@Override
	public List<BoardNoticeVO> readNoticelistAll() throws SQLException {
		List<BoardNoticeVO> boardnoticeList = boardnoticeDAO.selectBoardNoticeAll();
		return boardnoticeList;
	}

	@Override
	public List<BoardNoticeVO> readNoticelistSearch(SearchCriteria cri) throws SQLException {
		List<BoardNoticeVO> boardnoticeList = boardnoticeDAO.selectSearchBoardNoticeList(cri);
		return boardnoticeList;
	}

	@Override
	public int readSearchBoardNoticeCount(SearchCriteria cri) throws SQLException {
		int count = boardnoticeDAO.selectSearchBoardNoticeCount(cri);
		return count;
	}

	@Override
	public int readBoardNoticebNum() throws SQLException {
		int bNum = boardnoticeDAO.selectBoardNoticebNum();
		return bNum;
	}

	@Override
	public BoardVO readBoardByBnum(int bNum) throws SQLException {
		BoardVO board = boardnoticeDAO.selectBoardByBnum(bNum);
		return board;
	}

	@Override
	public void update(BoardVO board) throws SQLException {
		boardnoticeDAO.updateBoard(board);
		
	}
	

}
