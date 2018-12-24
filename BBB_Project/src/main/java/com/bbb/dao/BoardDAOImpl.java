package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.Criteria;
import com.bbb.controller.SearchCriteria;
import com.bbb.dto.BoardVO;
import com.bbb.dto.MemberVO;

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
	public List<MemberVO> selectSearchBoardList(Criteria cri) throws SQLException {
		int offset=cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset, limit);
		List<MemberVO> memberList=
				session.selectList("Board.selectSearchBoardList",(SearchCriteria)cri,rowBounds);
		return memberList;
		
	}

	@Override
	public int selectSearchBoardListCount(SearchCriteria cri) throws SQLException {
		int count = session.selectOne("Board.selectSearchBoardListCount",(SearchCriteria)cri);
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
	public List<BoardVO> selectBoardCriteria(SearchCriteria cri) throws SQLException {
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
		
		return session.selectOne("Board.getSeqNextValue");
	}

}
