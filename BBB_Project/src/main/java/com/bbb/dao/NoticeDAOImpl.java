package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

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
		NoticeVO notice = session.selectOne("Notice.selectNoticeByNnum", nNum);
		return notice;
	}

	@Override
	public List<NoticeVO> selectNoticeList() throws SQLException {
		List<NoticeVO> noticeList = session.selectList("Notice.selectNoticeList");
		return noticeList;
	}

	@Override
	public int selectNoticeListCount(Criteria cri) throws SQLException {
		int count = session.selectOne("Notice.selectNoticeListCount",(SearchCriteria)cri);
		return count;
	}
	

}
