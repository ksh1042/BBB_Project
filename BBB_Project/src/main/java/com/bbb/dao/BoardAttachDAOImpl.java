package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bbb.dto.BoardAttachVO;

public class BoardAttachDAOImpl implements BoardAttachDAO {

	private SqlSession session;
	public void setSession(SqlSession session){
		this.session=session;
	}
	
	@Override
	public void insertAttach(BoardAttachVO attach) throws SQLException {
		session.update("Board.insertAttach",attach);

	}

	@Override
	public void deleteAttach(String uUid) throws SQLException {
		session.update("Board.deleteAttach",uUid);

	}

	@Override
	public List<BoardAttachVO> selectAttachesByBno(int bNum) throws SQLException {
		List<BoardAttachVO> attachList =
				session.selectList("Board.selectAttachBybNum",bNum);
		return attachList;
	}

	@Override
	public void deleteAllAttach(int bNum) throws SQLException {
		session.update("Board.deleteAllAttach", bNum);

	}
	
}
