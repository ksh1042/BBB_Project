package com.bbb.service;

import java.util.List;

import com.bbb.controller.Criteria;
import com.bbb.dto.IssueVO;

public interface IssueService {
	List<IssueVO> getSearchIssueList(Criteria cri)throws Exception;
}
