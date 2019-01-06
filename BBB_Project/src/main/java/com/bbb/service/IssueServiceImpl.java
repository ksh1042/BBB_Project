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
	public List<IssueVO> getSearchIssueList(Criteria cri,int pjNum) throws Exception {
		List<IssueVO> issueList=issueDAO.selectSearchIssueList(cri, pjNum);
		return issueList;
	}

	@Override
	public void createIssue(IssueVO issue) throws Exception {
		int iNum=issueDAO.getQnaSeqNextValue();
		issue.setiNum(iNum);
		issueDAO.insertIssue(issue);
		
	}

	@Override
	public IssueVO readIssueByINum(int iNum) throws Exception {
		IssueVO issue=issueDAO.selectIssueByINum(iNum);
		return issue;
	}

	@Override
	public void updateIssue(IssueVO issue) throws Exception {
		issueDAO.modifyIssue(issue);
		
	}

	@Override
	public void updateIssueClose(int iNum) throws Exception {
		issueDAO.modifyIssueClose(iNum);
		
	}

	@Override
	public void updateIssueOpen(int iNum) throws Exception {
		issueDAO.modifyIssueOpen(iNum);
		
	}

}
