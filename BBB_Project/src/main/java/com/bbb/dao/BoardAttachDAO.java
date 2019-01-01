package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import com.bbb.dto.BoardAttachVO;

public interface BoardAttachDAO {

	public void insertAttach(BoardAttachVO attach) throws SQLException;

	public void deleteAttach(String uuid) throws SQLException;

	public List<BoardAttachVO> selectAttachesBybNum(int bNum)throws SQLException;

	public void deleteAllAttach(int bNum)throws SQLException;
}
