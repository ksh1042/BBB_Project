package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.BoardAttachVO;

public class BoardAttachDAOImpl implements BoardAttachDAO {

	private SqlSession session;
	public void setSession(SqlSession session){
		this.session = session;
	}
	
	@Override
	public void insertBoardAttach(BoardAttachVO boardAttach) throws SQLException {
		session.update("BoardAttach.insertBoardAttach",boardAttach);
	}

	@Override
	public void updateBoardAttach(BoardAttachVO boardAttach) throws SQLException {
		session.update("BoardAttach.updateBoardAttach",boardAttach);
	}

	@Override
	public void deleteBoardAttach(String uuid) throws SQLException {
		session.update("BoardAttach.deleteBoardAttach",uuid);

	}

	@Override
	public List<BoardAttachVO> selectSearchBoardAttachList(Criteria cri) throws SQLException {
		int offset = cri.getPageStart(); 
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		List<BoardAttachVO> boardAttachlist = session.selectList("BoardAttach.selectSearchBoardAttachList",(SearchCriteria)cri,rowBounds);
		return boardAttachlist;
	}

	@Override
	public BoardAttachVO selectBoardAttachByUuid(String uuid) throws SQLException {
		BoardAttachVO boardAttach = session.selectOne("BoardAttach.selectBoardAttachByUuid", uuid);
		return boardAttach;
	}

}
