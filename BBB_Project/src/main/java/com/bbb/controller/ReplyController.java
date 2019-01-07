package com.bbb.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbb.dto.ReplyVO;
import com.bbb.service.ReplyService;

@Controller
@RequestMapping("/board/replies")
public class ReplyController {
	
	@Resource(name ="replyService")
	private ReplyService service;
	
	@RequestMapping(value="/all/{bNum}", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("bNum") int bNum, Model model) throws Exception{

		List<ReplyVO> replyList = service.getReplyList(bNum);
		model.addAttribute("replyList",replyList);

		ResponseEntity<List<ReplyVO>> entity = new ResponseEntity<List<ReplyVO>>(replyList,HttpStatus.OK);
			return entity;
	}
	
	@RequestMapping(value="",method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO reply){
		ResponseEntity<String> entity = null;
		
		try{
			service.create(reply);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/{bNum}/{page}",method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, Object>>listPage(@PathVariable("bNum") int bNum, @PathVariable("page") int page,Model model) throws Exception{
		
		ResponseEntity<Map<String,Object>> entity = null;
		
		Criteria cri = new Criteria();
		cri.setPage(page);
		cri.setPerPageNum(5);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.countReply(bNum));
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("pageMaker", pageMaker);
		
		try{
			List<ReplyVO> List = service.getReplyList(bNum,cri);
			map.put("list", List);
			model.addAttribute("list",List);
			entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}catch(SQLException e){
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	@RequestMapping(value = "/{rNum}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("rNum") int rNum, @RequestBody ReplyVO reply) throws Exception {
		ResponseEntity<String> entity = null;

		reply.setrNum(rNum);
		try {
			service.modify(reply);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	@RequestMapping(value="/{rNum}",method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("rNum") int rNum) throws Exception{
		
		ResponseEntity<String> entity = null;
		try{
			service.remove(rNum);
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(SQLException e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	
}
