package com.bbb.service;

import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.BoardAttachVO;
import com.bbb.dto.BoardVO;

public interface FileBoardService {

	public void create(BoardVO board) throws Exception ;

	public BoardVO read(int bNum) throws Exception;

	public BoardVO readBybNum(int bNum) throws Exception;

	public void update(BoardVO board) throws Exception;

	public void delete(int bNum) throws Exception;

	public List<BoardVO> listAll() throws Exception;

	public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	public List<BoardVO> listSearch(SearchCriteria cri,int pjNum) throws Exception;

	int readSearchBoardCount(SearchCriteria cri,int pjNum) throws Exception;
	
	public List<BoardAttachVO> getAttach(int bNum) throws Exception;
}