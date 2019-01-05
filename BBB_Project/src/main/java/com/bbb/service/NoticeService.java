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
	
	public void update(NoticeVO notice) throws SQLException;
	
	public void delete(int nNum) throws SQLException;
	
	List<NoticeVO> readlistAll() throws SQLException;
	
	List<NoticeVO> readlistSearch(SearchCriteria cri) throws SQLException;
	
	List<NoticeVO> readlistCriteria(Criteria cri)throws SQLException;
	
	int readSearchNoticeCount(SearchCriteria cri)throws SQLException;
	
}
