package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.NoticeVO;

public interface NoticeService {
	
	void register(NoticeVO notice) throws SQLException;
	
	void modify(NoticeVO notice) throws SQLException;
	
	void remove(int nNum) throws SQLException;
	
	NoticeVO getNoticeByNnum(int nNum) throws SQLException;
	
	List<NoticeVO> getNoticeList() throws SQLException;
}
