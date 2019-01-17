package com.bbb.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.BoardVO;

public class FileboardDAOImpl implements FileboardDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertBoard(BoardVO board) throws SQLException {
		session.insert("FileBoard.insertBoard",board);
		
	}

	@Override
	public BoardVO selectBoardByBnum(int bNum) throws SQLException {
		BoardVO board = (BoardVO)session.selectOne("FileBoard.selectBoardBybNum",bNum);
		return board;
	}

	@Override
	public void updateBoard(BoardVO board) throws SQLException {
		session.update("FileBoard.updateBoard",board);
		
	}

	@Override
	public void deleteBoard(int bNum) throws SQLException {
		session.update("FileBoard.deleteBoard",bNum);
	}

	@Override
	public void increaseCount(int bNum) throws SQLException {
		session.update("FileBoard.increaseViewCnt",bNum);
		
	}

	@Override
	public List<BoardVO> selectSearchBoardList(SearchCriteria cri ,int pjNum) throws SQLException {
		Map<String,Object> paramMap = new HashMap<String,Object>();
		int limit = cri.getPerPageNum();
		int offset=cri.getPageStartRowNum();
		RowBounds rowBounds=new RowBounds(offset, limit);
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("pjNum", pjNum);
		List<BoardVO> boardList=
		session.selectList("FileBoard.selectSearchBoardList",paramMap,rowBounds);
		return boardList;
	}
	@Override
	public List<BoardVO> selectSearchBoardList(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		List<BoardVO> boardList = session.selectList("FileBoard.selectSearchBoardList",cri,rowBounds);
		return boardList;
	}

	@Override
	public int selectSearchBoardListCount(SearchCriteria cri, int pjNum) throws SQLException {
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("cri", cri);
		paramMap.put("pjNum", pjNum);
		
		int count = session.selectOne("FileBoard.selectSearchBoardCount", paramMap);
		
		return count;
		
	}
	@Override
	public List<BoardVO> selectBoardAll() throws SQLException {
		List<BoardVO> boardList = session.selectList("FileBoard.selectBoardAll");
		return boardList;
	}

	@Override
	public List<BoardVO> selectBoardCriteria(Criteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds bounds = new RowBounds(offset,limit);
		
		List<BoardVO> boardList = session.selectList("FileBoard.selectBoardAll",null,bounds);
		
		return boardList;
	}

	@Override
	public int selectSearchBoardCount(SearchCriteria cri) throws SQLException {
		int rowCount = session.selectOne("FileBoard.selectSearchBoardCount",cri);
		return rowCount;
	}
	@Override
	public int getSeqNextvalue() throws SQLException {
		return session.selectOne("FileBoard.getSeqNextvalue");
	}

}