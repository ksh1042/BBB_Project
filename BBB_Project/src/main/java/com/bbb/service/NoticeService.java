package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.NoticeVO;

public interface NoticeService {
	
	public void create(NoticeVO notice) throws SQLException;
	
	public NoticeVO read(int nNum)throws SQLException;
	
	public NoticeVO readByNnum(int nNum) throws SQLException;
	
	public void modify(NoticeVO notice) throws SQLException;
	
	public void remove(int nNum) throws SQLException;
	
	List<NoticeVO> listAll() throws SQLException;
	
	List<NoticeVO> listSearch(SearchCriteria cri) throws SQLException;
	
	List<NoticeVO> listCriteria(Criteria cri)throws SQLException;
	
	int readSearchNoticeCount(SearchCriteria cri)throws SQLException;
	
}
