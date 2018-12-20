package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dao.NoticeDAO;
import com.bbb.dto.NoticeVO;

public class NoticeServiceImpl implements NoticeService {
	private NoticeDAO dao;
	public void setNoticeDAO(NoticeDAO dao){
		this.dao = dao;
	}
	
	@Override
	public void register(NoticeVO notice) throws SQLException {
		dao.insertNotice(notice);

	}

	@Override
	public void modify(NoticeVO notice) throws SQLException {
		dao.updateNotice(notice);

	}

	@Override
	public void remove(int nNum) throws SQLException {
		dao.deleteNotice(nNum);

	}

	@Override
	public NoticeVO getNoticeByNnum(int nNum) throws SQLException {
		NoticeVO notice = dao.selectNoticeByNnum(nNum);
		return notice;
	}

	@Override
	public List<NoticeVO> getNoticeList() throws SQLException {
		List<NoticeVO> noticeList = dao.selectNoticeList(); 
		return noticeList;
	}

}
