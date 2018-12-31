package com.bbb.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bbb.controller.Criteria;
import com.bbb.dto.ReplyVO;

public class ReplyDAOImpl implements ReplyDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session){
		this.session = session;
	}
	
	@Override
	public List<ReplyVO> selectReplyList(int bNum) throws Exception {
		List<ReplyVO> replyList = session.selectList("Reply.selectReplyList",bNum);
		return replyList;
	}

	@Override
	public void insertReply(ReplyVO reply) throws Exception {
		session.update("Reply.insertReply",reply);

	}

	@Override
	public void updateReply(ReplyVO reply) throws Exception {
		session.update("Reply.updateReply",reply);

	}

	@Override
	public void deleteReply(int rNum) throws Exception {
		session.update("Reply.deleteReply",rNum);
	}

	@Override
	public List<ReplyVO> selectReplyListPage(int bNum, Criteria cri) throws Exception {
		int offset=cri.getPageStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<ReplyVO> replyList = session.selectList("Reply.selectReplyList",bNum,rowBounds);
		return replyList;
	}

	@Override
	public int countReply(int bNum) throws Exception {
		int count =(Integer)session.selectOne("Reply.countReply",bNum);
		return count;
	}

}
