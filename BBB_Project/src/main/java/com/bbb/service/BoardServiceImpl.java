package com.bbb.service;

import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.BoardAttachVO;
import com.bbb.dto.BoardVO;

public class BoardServiceImpl implements BoardService {

	@Override
	public void create(BoardVO board) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public BoardVO read(int bNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO readByBno(int bNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modify(BoardVO board) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void remove(int bNum) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int readSearchBoardCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardAttachVO> getAttach(int bNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
