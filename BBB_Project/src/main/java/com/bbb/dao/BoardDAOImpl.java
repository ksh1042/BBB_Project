package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.BoardVO;

public class BoardDAOImpl implements BoardDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}


	@Override
	public void insertBoard(BoardVO board) throws SQLException {
		session.update("Board.insertBoard",board);
	}

	@Override
	public void updateBoard(BoardVO board) throws SQLException {
		session.update("Board.updateBoard",board);
	}

	@Override
	public void deleteBoard(int bnum) throws SQLException {
		session.update("Board.deleteBoard",bnum);

	}

	@Override
	public List<BoardVO> selectSearchBoardList(Criteria cri) throws SQLException {
		int offset=cri.getPageStart();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		List<BoardVO> boardlist = session.selectList("Board.selectSearchBoardList", (SearchCriteria)cri, rowBounds);
		return boardlist;
	}

	@Override
	public int selectSearchBoardListCount(Criteria cri) throws SQLException {
		int count = session.selectOne("Board.selectSearchBoardListCount", cri);
		return count;
	}

	@Override
	public BoardVO selectBoardByBum(int bnum) throws SQLException {
		BoardVO board = session.selectOne("Board.selectBoardByBum", bnum);
		return board;
	}

}
