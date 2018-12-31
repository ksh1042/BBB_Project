package com.bbb.service;

import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.IssueVO;
import com.bbb.dto.QnaVO;

public interface IssueService {
	List<IssueVO> getSearchIssueList(Criteria cri,int pjNum)throws Exception;
	void createIssue(IssueVO issue) throws Exception;
	
}
