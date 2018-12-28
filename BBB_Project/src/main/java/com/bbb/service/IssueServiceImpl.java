package com.bbb.service;

import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dao.IssueDAO;
import com.bbb.dto.IssueVO;

public class IssueServiceImpl implements IssueService{

	private IssueDAO issueDAO;
	public void setIssueDAO(IssueDAO issueDAO){
		this.issueDAO=issueDAO;
	}
	
	@Override
	public List<IssueVO> getSearchIssueList(Criteria cri) throws Exception {
		List<IssueVO> issueList=issueDAO.selectSearchIssueList(cri);
		return issueList;
	}
	
}
