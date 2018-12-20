package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.NoticeVO;

public interface NoticeDAO {
	
	void insertNotice(NoticeVO notice)throws SQLException;
	
	void updateNotice(NoticeVO notice)throws SQLException;
	
	void deleteNotice(int nNum)throws SQLException;
	
	NoticeVO selectNoticeByNnum(int nNum)throws SQLException;
	
	List<NoticeVO> selectNoticeList()throws SQLException;
	
	int selectNoticeListCount(Criteria cri)throws SQLException;
	
}
