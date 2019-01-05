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
		session.insert("Board.insertBoard",board);
		
	}

	@Override
	public BoardVO selectBoardByBnum(int bNum) throws SQLException {
		BoardVO board = (BoardVO)session.selectOne("Board.selectBoardByBnum",bNum);
		return board;
	}

	@Override
	public void updateBoard(BoardVO board) throws SQLException {
		session.update("Board.updateBoard",board);
		
	}

	@Override
	public void deleteBoard(int bNum) throws SQLException {
		session.update("Board.deleteBoard",bNum);
	}

	@Override
	public void increaseCount(int bNum) throws SQLException {
		session.update("Board.increaseCount",bNum);
		
	}

	@Override
	public List<BoardVO> selectSearchBoardList(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<BoardVO> boardList = session.selectList("Board.selectSearchBoardList",cri,rowBounds);
		return boardList;
	}

	@Override
	public List<BoardVO> selectBoardAll() throws SQLException {
		List<BoardVO> boardList = session.selectList("Board.selectBoardAll");
		return boardList;
	}

	@Override
	public List<BoardVO> selectBoardCriteria(Criteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds bounds = new RowBounds(offset,limit);
		
		List<BoardVO> boardList = session.selectList("Board.selectBoardAll",null,bounds);
		
		return boardList;
	}

	@Override
	public int selectSearchBoardCount(SearchCriteria cri) throws SQLException {
		int rowCount = session.selectOne("Board.selectSearchBoardCount",cri);
		return rowCount;
	}



}
