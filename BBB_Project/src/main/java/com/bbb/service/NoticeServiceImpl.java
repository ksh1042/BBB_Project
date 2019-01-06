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
	public void modify(NoticeVO notice) throws SQLException {
		dao.updateNotice(notice);
	}

	@Override
	public void remove(int nNum) throws SQLException {
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
	public List<NoticeVO> listAll() throws SQLException {
		List<NoticeVO> noticeList = dao.selectNoticeAll();
		return noticeList;
	}

	@Override
	public List<NoticeVO> listSearch(SearchCriteria cri) throws SQLException {
		List<NoticeVO> noticeList = dao.selectSearchNoticeList(cri);
		return noticeList;
	}

	@Override
	public List<NoticeVO> listCriteria(Criteria cri) throws SQLException {
		List<NoticeVO> noticeList = dao.selectNoticeCriteria(cri);
		return noticeList;
	}

}
