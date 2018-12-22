package com.bbb.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bbb.dto.QnaReplyVO;
import com.bbb.service.QnaReplyService;

@RestController
@RequestMapping("/replies")
public class QnaReplyController {

//url : /replies
///replies/all/{bno}		GET방식 : bno번 게시글의 댓글 목록
///replies/{rno}			PUT,PATCH방식 : rno 댓글의 수정 
///replies/{rno}			DELETE 방식 : rno 댓글의 삭제
///replies 				POST 방식 : 댓글 입력
///replies/{bno}/{page} 	GET방식 : bno번 게시글의 페이징 처리된 댓글 목록


	@Resource(name = "qnaReplyService")
	private QnaReplyService service;

	@RequestMapping(value = "/all/{qaNum}", method = RequestMethod.GET)
	public ResponseEntity<List<QnaReplyVO>> list(@PathVariable("qaNum") int qaNum) throws Exception {

		List<QnaReplyVO> replyList = service.getReplyList(qaNum);

		ResponseEntity<List<QnaReplyVO>> entity = new ResponseEntity<List<QnaReplyVO>>(replyList, HttpStatus.OK);
		return entity;
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody QnaReplyVO reply) {

		ResponseEntity<String> entity = null;

		try {

			service.createReply(reply);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping(value = "/{qaNum}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("qaNum") int qaNum, @PathVariable("page") int page)
			throws Exception {

		ResponseEntity<Map<String, Object>> entity = null;

		Criteria cri = new Criteria();
		cri.setPage(page);
		cri.setPerPageNum(5);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.countReply(qaNum));

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageMaker", pageMaker);
		try {
			List<QnaReplyVO> replyList = service.getReplyListPage(qaNum, cri);
			map.put("list", replyList);
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping(value = "/{qarNum}", method = { RequestMethod.PUT, 
												 RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("qarNum") int qarNum,
										 @RequestBody QnaReplyVO reply) 
												 	throws Exception {
		ResponseEntity<String> entity = null;

		reply.setQarNum(qarNum);
		try {
			service.modifyReply(reply);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
	
	@RequestMapping(value="/{qarNum}",method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("qarNum") int qarNum)
									throws Exception{
		
		ResponseEntity<String> entity=null;
		try{
			service.deleteReply(qarNum);
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(SQLException e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
}


