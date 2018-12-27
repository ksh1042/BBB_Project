package com.bbb.service;

import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dao.BoardAttachDAO;
import com.bbb.dao.BoardDAO;
import com.bbb.dto.BoardAttachVO;
import com.bbb.dto.BoardVO;
import com.bbb.dto.MemberVO;

public class BoardServiceImpl implements BoardService {

	private BoardDAO boardDAO;
	public void setBoardDAO(BoardDAO boardDAO){
		this.boardDAO=boardDAO;
	}
	private BoardAttachDAO attachDAO;
	public void setAttachDAO(BoardAttachDAO attachDAO){
		this.attachDAO=attachDAO;
	}
	@Override
	public void create(BoardVO board) throws Exception {
		int bNum = boardDAO.getSeqNextvalue();
		board.setbNum(bNum);
		boardDAO.insertBoard(board);
		
		List<BoardAttachVO> attachList=board.getAttachList();
		for(BoardAttachVO attach : attachList){
			attach.setbNum(bNum);
			System.out.println(attach);
			attachDAO.insertAttach(attach);
		}

	}

	@Override
	public BoardVO read(int bNum) throws Exception {
		BoardVO board=boardDAO.selectBoardBybNum(bNum);
		boardDAO.increaseViewcnt(bNum);
		return board;
	}

	@Override
	public BoardVO readByBno(int bNum) throws Exception {
		BoardVO board=boardDAO.selectBoardBybNum(bNum);
		
		return board;
	}
	@Override
	public void update(BoardVO board) throws Exception {
		int bNum = board.getbNum();
		
		boardDAO.updateBoard(board);
		attachDAO.deleteAllAttach(bNum);
		
		for(BoardAttachVO attach : board.getAttachList()){
			attach.setbNum(bNum);
			attachDAO.insertAttach(attach);
		}

	}

	@Override
	public void delete(int bNum) throws Exception {
		boardDAO.deleteBoard(bNum);

	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		List<BoardVO> boardList= boardDAO.selectBoardAll();
		return boardList;
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		List<BoardVO> boardList = boardDAO.selectBoardCriteria(cri);
		return boardList;
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		List<BoardVO> boardList=boardDAO.selectSearchBoardList(cri);
		
		return boardList;
	}

	@Override
	public int readSearchBoardCount(SearchCriteria cri) throws Exception {
		int count = boardDAO.selectSearchBoardListCount(cri);
		return count;
	}

	@Override
	public List<BoardAttachVO> getAttach(int bNum) throws Exception {
		List<BoardAttachVO> attachList=attachDAO.selectAttachesBybNum(bNum);
		return attachList;
	}

}
