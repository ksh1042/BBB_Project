package com.bbb.service;

import java.util.List;

import com.bbb.dto.IssueDetailVO;

public interface IssueDetailService {
	
	List<IssueDetailVO> getIssueDetailList(int iNum)throws Exception;
	void createIssueDetail(IssueDetailVO issueDetail)throws Exception;
	void updateIssueDetail(IssueDetailVO issueDetail)throws Exception;
	void deleteIssueDetail(int idNum)throws Exception;
	
}
