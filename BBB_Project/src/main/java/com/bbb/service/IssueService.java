package com.bbb.service;

import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.IssueVO;

public interface IssueService {
	List<IssueVO> getSearchIssueList(Criteria cri,int pjNum)throws Exception;
	
	void createIssue(IssueVO issue) throws Exception;
	
	IssueVO readIssueByINum(int iNum)throws Exception;
	
	void updateIssue(IssueVO issue) throws Exception; 
	
	void updateIssueClose(int iNum)throws Exception;
	
	void updateIssueOpen(int iNum)throws Exception;
}
