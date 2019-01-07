package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.BoardNoticeVO;
import com.bbb.dto.BoardVO;

public class BoardNoticeDAOImpl implements BoardNoticeDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session){
		this.session=session;
	}
	
	@Override
	public void insertBoard(BoardVO board) throws SQLException {
		session.update("BoardNotice.insertBoard",board);
		
	}
	@Override
	public void insertBoardNotice(BoardNoticeVO notice) throws SQLException {
		session.update("BoardNotice.insertBoardNotice",notice);
		
	}
	@Override
	public int selectBoardNoticebNum() throws SQLException {
		int bNum = session.selectOne("BoardNotice.selectBoardNoticebNum");
		return bNum;
	}
	@Override
	public void deleteBoardNotice(int bNum) throws SQLException {
		session.update("BoardNotice.deleteBoardNotice",bNum);
		
	}
	@Override
	public void deleteBoard(int bNum) throws SQLException {
		session.update("BoardNotice.deleteBoard",bNum);
		
	}
	@Override
	public List<BoardNoticeVO> selectSearchBoardNoticeList(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<BoardNoticeVO> boardnoticeList = session.selectList("BoardNotice.selectSearchBoardNoticeList",cri,rowBounds);
		return boardnoticeList;
	}
	@Override
	public List<BoardVO> selectSearchBoardList(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<BoardVO> boardList = session.selectList("BoardNotice.selectSearchBoardList");
		return boardList;
	}
	@Override
	public List<BoardNoticeVO> seletBoardNoticeCriteria(Criteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds bounds = new RowBounds(offset,limit);
		
		List<BoardNoticeVO> boardnoticeList = session.selectList("BoardNotice.selectBoardNoticeCriteria",null,bounds); 
		return boardnoticeList;
	}
	@Override
	public List<BoardNoticeVO> selectBoardNoticeAll() throws SQLException {
		List<BoardNoticeVO> boardnoticeList = session.selectList("BoardNotice.selectBoardNoticeAll");
		return boardnoticeList;
	}
	@Override
	public List<BoardVO> selectBoardAll() throws SQLException {
		List<BoardVO> boardList = session.selectList("BoardNotice.selectBoardAll");
		return boardList;
	}
	@Override
	public int selectSearchBoardCount(SearchCriteria cri) throws SQLException {
		int rowCount = session.selectOne("BoardNotice.selectSearchBoardCount",cri);
		return rowCount;
	}

	@Override
	public BoardVO selectBoardByBnum(int bNum) throws SQLException {
		BoardVO board = (BoardVO)session.selectOne("BoardNotice.selectBoardByBnum",bNum);
		return board;
	}

	@Override
	public BoardNoticeVO selectBoardNoticeByBnum(int bNum) throws SQLException {
		BoardNoticeVO notice = (BoardNoticeVO)session.selectOne("BoardNotice.selectBoardNoticeByBnum",bNum);
		return notice;
	}

	@Override
	public int selectSearchBoardNoticeCount(SearchCriteria cri) throws SQLException {
		int rowCount = session.selectOne("BoardNotice.selectSearchBoardNoticeCount",cri);
		return rowCount;
	}

	@Override
	public void updateBoard(BoardVO board) throws SQLException {
		session.update("BoardNotice.updateBoard",board);
		
	}
	
	
	

}
