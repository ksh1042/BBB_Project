package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.NoticeVO;

public interface NoticeDAO {
	
	public void insertNotice(NoticeVO notice)throws SQLException;
	
	public void updateNotice(NoticeVO notice)throws SQLException;
	
	public void deleteNotice(int nNum)throws SQLException;
	
	public NoticeVO selectNoticeByNnum(int nNum)throws SQLException;
	
	public List<NoticeVO> selectNoticeList()throws SQLException;
	
	List<NoticeVO> selectNoticeCriteria(Criteria cri) throws SQLException;
	
	List<NoticeVO> selectSearchNoticeList(SearchCriteria cri)throws SQLException;
	
	public List<NoticeVO> selectNoticeAll () throws SQLException;
	
	
}
