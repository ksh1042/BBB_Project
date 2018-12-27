package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO {
	
	private SqlSession session;
	public void setSession(SqlSession session){
		this.session = session;
	}
	
	@Override
	public void insertNotice(NoticeVO notice) throws SQLException {
		session.update("Notice.insertNotice",notice);

	}

	@Override
	public void updateNotice(NoticeVO notice) throws SQLException {
		session.update("Notice.updateNotice",notice);

	}

	@Override
	public void deleteNotice(int nNum) throws SQLException {
		session.update("Notice.deleteNotice",nNum);

	}

	@Override
	public NoticeVO selectNoticeByNnum(int nNum) throws SQLException {
		NoticeVO notice = (NoticeVO)session.selectOne("Notice.selectNoticeByNnum", nNum);
		return notice;
	}

	@Override
	public List<NoticeVO> selectNoticeList() throws SQLException {
		List<NoticeVO> noticeList = session.selectList("Notice.selectNoticeList");
		return noticeList;
	}

	@Override
	public List<NoticeVO> selectNoticeCriteria(Criteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds bounds = new RowBounds(offset,limit);
		
		List<NoticeVO> noticeList = session.selectList("Notice.selectNoticeCriteria",null,bounds);
		return noticeList;
	}

	@Override
	public List<NoticeVO> selectSearchNoticeList(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<NoticeVO> noticeList = session.selectList("Notice.selectSearchNoticeList",cri,rowBounds);
		return noticeList;
	}

	@Override
	public List<NoticeVO> selectNoticeAll() throws SQLException {
		List<NoticeVO> noticeList = session.selectList("Notice.selectNoticeAll");
		return noticeList;
	}


}
