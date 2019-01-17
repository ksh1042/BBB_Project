package com.bbb.service;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dao.BoardAttachDAO;
import com.bbb.dao.FileboardDAO;
import com.bbb.dto.BoardAttachVO;
import com.bbb.dto.BoardVO;


public class FileBoardServiceImpl implements FileBoardService {

	private FileboardDAO fileboardDAO;
	public void setFileBoardDAO(FileboardDAO fileboardDAO){
		this.fileboardDAO=fileboardDAO;
	}
	private BoardAttachDAO attachDAO;
	public void setAttachDAO(BoardAttachDAO attachDAO){
		this.attachDAO=attachDAO;
	}
	@Override
	public void create(BoardVO board) throws Exception {
		int bNum = fileboardDAO.getSeqNextvalue();
		board.setbNum(bNum);
		fileboardDAO.insertBoard(board);
		
		
		List<BoardAttachVO> attachList=board.getAttachList();
		for(BoardAttachVO attach : attachList){
			attach.setbNum(bNum);
			
			System.out.println(attach);
			attachDAO.insertAttach(attach);
		}

	}

	@Override
	public BoardVO read(int bNum) throws Exception {
		BoardVO board=fileboardDAO.selectBoardByBnum(bNum);
		fileboardDAO.increaseCount(bNum);
		return board;
	}

	@Override
	public BoardVO readBybNum(int bNum) throws Exception {
		BoardVO board=fileboardDAO.selectBoardByBnum(bNum);
		
		return board;
	}
	@Override
	public void update(BoardVO board) throws Exception {
		int bNum = board.getbNum();
		
		fileboardDAO.updateBoard(board);
		attachDAO.deleteAllAttach(bNum);
		
		for(BoardAttachVO attach : board.getAttachList()){
			attach.setbNum(bNum);
			attachDAO.insertAttach(attach);
		}

	}

	@Override
	public void delete(int bNum) throws Exception {
		fileboardDAO.deleteBoard(bNum);

	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		List<BoardVO> boardList= fileboardDAO.selectBoardAll();
		return boardList;
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		List<BoardVO> boardList = fileboardDAO.selectBoardCriteria(cri);
		return boardList;
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri,int pjNum) throws Exception {
		List<BoardVO> boardList=fileboardDAO.selectSearchBoardList(cri,pjNum);
		
		return boardList;
	}

	@Override
	public int readSearchBoardCount(SearchCriteria cri, int pjNum) throws Exception {
		int count = fileboardDAO.selectSearchBoardListCount(cri,pjNum);
		return count;
	}

	@Override
	public List<BoardAttachVO> getAttach(int bNum) throws Exception {
		List<BoardAttachVO> attachList=attachDAO.selectAttachesBybNum(bNum);
		return attachList;
	}

}
