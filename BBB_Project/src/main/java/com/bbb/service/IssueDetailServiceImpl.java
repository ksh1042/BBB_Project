package com.bbb.service;

import java.util.List;

import com.bbb.dao.IssueDetailDAO;
import com.bbb.dto.IssueDetailVO;

public class IssueDetailServiceImpl implements IssueDetailService {

	private IssueDetailDAO issueDetailDAO;
	public void setIssueDetailDAO(IssueDetailDAO issueDetailDAO){
		this.issueDetailDAO=issueDetailDAO;
	}
	
	@Override
	public List<IssueDetailVO> getIssueDetailList(int iNum) throws Exception {
		List<IssueDetailVO> issueDetailList=issueDetailDAO.selectIssueDetailList(iNum);
		return issueDetailList;
	}

	@Override
	public void createIssueDetail(IssueDetailVO issueDetail) throws Exception {
		issueDetailDAO.insertIssueDetail(issueDetail);
		
	}

	@Override
	public void updateIssueDetail(IssueDetailVO issueDetail) throws Exception {
		issueDetailDAO.updateIssueDetail(issueDetail);
		
	}

	@Override
	public void deleteIssueDetail(int idNum) throws Exception {
		issueDetailDAO.deleteIssueDetail(idNum);
		
	}

	

}
