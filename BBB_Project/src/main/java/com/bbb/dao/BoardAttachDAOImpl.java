package com.bbb.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bbb.dto.BoardAttachVO;

public class BoardAttachDAOImpl implements BoardAttachDAO {
<<<<<<< HEAD

   private SqlSession session;
   public void setSession(SqlSession session){
      this.session=session;
   }
   
   @Override
   public void insertAttach(BoardAttachVO attach) throws SQLException {
      session.update("Board.insertAttach",attach);

   }
=======
	
	private SqlSession session;
	public void setSession(SqlSession session){
		this.session=session;
	}
	
	private final String namespace = "BoardAttachMapper";
	
	
	
	
	@Override
	public void insertAttach(BoardAttachVO attach) throws SQLException {
		session.update(namespace+".insertAttach",attach);
	}
>>>>>>> refs/remotes/origin/IMC

<<<<<<< HEAD
   @Override
   public void deleteAttach(String uUid) throws SQLException {
      session.update("Board.deleteAttach",uUid);

   }
=======
	@Override
	public void deleteAttach(String uuid) throws SQLException {
		session.update(namespace+".deleteAttach",uuid);
	}
>>>>>>> refs/remotes/origin/IMC

<<<<<<< HEAD
   @Override
   public List<BoardAttachVO> selectAttachesBybNum(int bNum) throws SQLException {
      List<BoardAttachVO> attachList =
            session.selectList("Board.selectAttachBybNum",bNum);
      return attachList;
   }
=======
	@Override
	public List<BoardAttachVO> selectAttachesBybNum(int bNum) throws SQLException {
		List<BoardAttachVO> attachList=
				session.selectList(namespace+".selectAttachBybNum",bNum);
		return attachList;
	}
>>>>>>> refs/remotes/origin/IMC

<<<<<<< HEAD
   @Override
   public void deleteAllAttach(int bNum) throws SQLException {
      session.update("Board.deleteAllAttach", bNum);
      
   }
   
}
=======
	@Override
	public void deleteAllAttach(int bNum) throws SQLException {
		session.update(namespace+".deleteAllAttach",bNum);
	}

}
>>>>>>> refs/remotes/origin/IMC
