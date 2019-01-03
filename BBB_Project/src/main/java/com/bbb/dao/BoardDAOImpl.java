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

public class BoardDAOImpl implements BoardDAO {

	private SqlSession session;
	public void setSession(SqlSession session){
		this.session =session;
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
	public void deleteBoard(int bNum) throws SQLException {
		session.update("Board.deleteBoard", bNum);

	}

	@Override
	public List<BoardVO> selectSearchBoardList(SearchCriteria cri ,int pjNum ) throws SQLException {
		Map<String,Object> paramMap = new HashMap<String,Object>();
		int offset=cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset, limit);
		paramMap.put("cri",cri );
		paramMap.put("pjNum", pjNum);
		List<BoardVO> boardList=
				session.selectList("Board.selectSearchBoardList",(SearchCriteria)cri,rowBounds);
		return boardList;
		
	}

	@Override
	public int selectSearchBoardListCount(SearchCriteria cri) throws SQLException {
		int count = session.selectOne("Board.selectSearchBoardCount",(SearchCriteria)cri);
		return count;
		
	}

	@Override
	public BoardVO selectBoardBybNum(int bNum) throws SQLException {
		BoardVO board= session.selectOne("Board.selectBoardBybNum", bNum);
		
		return board;
	}
	@Override
	public void increaseViewcnt(int bNum) throws Exception {
		session.update("Board.increaseViewCnt",bNum);
		
	}
	@Override
	public List<BoardVO> selectBoardCriteria(Criteria cri) throws SQLException {
		int offset=cri.getPageStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<BoardVO> boardList=
		session.selectList("Board.selectSearchBoardList",cri,rowBounds);
		return boardList;
	}
	@Override
	public List<BoardVO> selectBoardAll() throws Exception {
		List<BoardVO> boardList=
				session.selectList("Board.selectBoardAll");
		return boardList;
	}
	@Override
	public int getSeqNextvalue() throws Exception {
		
		return session.selectOne("Board.getSeqNextvalue");
	}

}
