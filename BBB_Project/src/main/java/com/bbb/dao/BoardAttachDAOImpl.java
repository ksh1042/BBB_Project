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
		session.update("BoardAttachMapper.insertAttach",attach);

	}

	@Override
	public void deleteAttach(String uuid) throws SQLException {
		session.update("BoardAttachMapper.deleteAttach",uuid);

	}

	@Override
	public List<BoardAttachVO> selectAttachesBybNum(int bNum) throws SQLException {
		List<BoardAttachVO> attachList =
				session.selectList("BoardAttachMapper.selectAttachBybNum",bNum);
		return attachList;
	}

	@Override
	public void deleteAllAttach(int bNum) throws SQLException {
		session.update("BoardAttachMapper.deleteAllAttach", bNum);
		
	}
	
}
