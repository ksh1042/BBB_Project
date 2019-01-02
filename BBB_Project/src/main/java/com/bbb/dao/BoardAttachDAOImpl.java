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
	
	private final String namespace = "BoardAttachMapper";
	
	
	
	
	@Override
	public void insertAttach(BoardAttachVO attach) throws SQLException {
		session.update(namespace+".insertAttach",attach);
	}

	@Override
	public void deleteAttach(String uuid) throws SQLException {
		session.update(namespace+".deleteAttach",uuid);
	}

	@Override
	public List<BoardAttachVO> selectAttachesBybNum(int bNum) throws SQLException {
		List<BoardAttachVO> attachList=
				session.selectList(namespace+".selectAttachBybNum",bNum);
		return attachList;
	}

	@Override
	public void deleteAllAttach(int bNum) throws SQLException {
		session.update(namespace+".deleteAllAttach",bNum);
	}

}
