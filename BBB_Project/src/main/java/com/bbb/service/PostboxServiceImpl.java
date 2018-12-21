package com.bbb.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dao.MemberDAO;
import com.bbb.dao.PostboxDAO;
import com.bbb.dto.MemberVO;
import com.bbb.dto.PostboxVO;

public class PostboxServiceImpl implements PostboxService {
	
	private PostboxDAO postboxDAO;
	public void setPostboxDAO(PostboxDAO postboxDAO){
		this.postboxDAO = postboxDAO;
	}
	
	/*
	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO){
		this.memberDAO = memberDAO;
	}
	*/
	
	@Override
	public List<PostboxVO> readPostboxList(String id) throws SQLException {
		List<PostboxVO> resultList = new ArrayList<PostboxVO>();
		List<PostboxVO> rootList = postboxDAO.selectPostboxListById(id);
		System.out.println(rootList);
		for(PostboxVO post : rootList){
			
			resultList.add(post);	// 댓글의 주체가 되는 글
			
			int pbNum = post.getPbNum();
			
			List<PostboxVO> childList = postboxDAO.selectPostboxReplyList(pbNum);
			
			for(PostboxVO child : childList){
				resultList.add(child);	// 위의 글 기준으로 댓글들을 순차적으로 가져온다.
			}
			
		}
		 
		return resultList;
	}

	@Override
	public void createPostbox(PostboxVO postbox) throws SQLException {
		postboxDAO.insertPostbox(postbox);
	}

	@Override
	public List<MemberVO> readMemberList(Criteria cri) throws SQLException {
		return postboxDAO.selectSearchMemberList(cri);
	}

	@Override
	public int readMemberListCount(Criteria cri) throws SQLException {
		return postboxDAO.selectSearchMemberListCount(cri);
	}

}
