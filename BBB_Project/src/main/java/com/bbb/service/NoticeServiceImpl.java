package com.bbb.service;

import java.sql.SQLException;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dao.NoticeDAO;
import com.bbb.dto.NoticeVO;

public class NoticeServiceImpl implements NoticeService {
	
	private NoticeDAO dao;
	public void setNoticeDAO(NoticeDAO dao){
		this.dao = dao;
	}
	
	@Override
	public void create(NoticeVO notice) throws SQLException {
		dao.insertNotice(notice);
	}

	@Override
	public void update(NoticeVO notice) throws SQLException {
		dao.updateNotice(notice);
	}

	@Override
	public void delete(int nNum) throws SQLException {
		dao.deleteNotice(nNum);
	}

	@Override
	public NoticeVO readByNnum(int nNum) throws SQLException {
		NoticeVO notice = dao.selectNoticeByNnum(nNum);
		return notice;
	}


	@Override
	public NoticeVO read(int nNum) throws SQLException {
		NoticeVO notice = dao.selectNoticeByNnum(nNum);
		return notice;
	}

	@Override
	public List<NoticeVO> readlistAll() throws SQLException {
		List<NoticeVO> noticeList = dao.selectNoticeAll();
		return noticeList;
	}

	@Override
	public List<NoticeVO> readlistSearch(SearchCriteria cri) throws SQLException {
		List<NoticeVO> noticeList = dao.selectSearchNoticeList(cri);
		return noticeList;
	}

	@Override
	public List<NoticeVO> readlistCriteria(Criteria cri) throws SQLException {
		List<NoticeVO> noticeList = dao.selectNoticeCriteria(cri);
		return noticeList;
	}

	@Override
	public int readSearchNoticeCount(SearchCriteria cri) throws SQLException {
		int count = dao.selectSearchNoticeCount(cri);
		return count;
	}

}
