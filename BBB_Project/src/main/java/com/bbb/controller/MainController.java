package com.bbb.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bbb.dto.MemberVO;
import com.bbb.dto.ProjectPartakeVO;
import com.bbb.dto.ProjectVO;
import com.bbb.mail.MimeAttachNotifier;
import com.bbb.service.MemberService;
import com.bbb.service.ProjectService;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private MimeAttachNotifier notifier;
	
	@Resource(name="uploadProfile")
	String uploadProfile;
	
	@RequestMapping(value="" ,method=RequestMethod.GET)
	public String memberTurningPoint(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO loginUser = (MemberVO)request.getSession().getAttribute("loginUser");
		
		String url = "";
		if(loginUser.getOperatoryn() == 1 ){
			url = "redirect:/admin/mainForm";
		}else{
			url = "redirect:/main/myPartakeList";
		}
		
		return url;
	}
	
	@RequestMapping(value="/searchPList", method=RequestMethod.GET)
	public void searchList(@ModelAttribute("cri")SearchCriteria cri,Model model,HttpServletRequest request) throws Exception{
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		cri.setPerPageNum(5);
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		List<ProjectVO> searchPList = projectService.searchProjectList(cri);
		List<ProjectPartakeVO> sampleList = projectService.getBindingProject(id);
		List<ProjectPartakeVO> bindList = new ArrayList<ProjectPartakeVO>();
		boolean copy = false;
		
		
		for(ProjectVO project : searchPList){
			copy = false;
			for(ProjectPartakeVO partake : sampleList){
				if(project.getPjNum() == partake.getPjNum()){
					bindList.add(partake);
					copy =true;
				}
			}
			if(!copy){
				bindList.add(new ProjectPartakeVO(id,project.getPjNum(),2));
			}
		}
		
		
		
		int totalCount = projectService.searchProjectCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("searchPList",searchPList);
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("bindList",bindList);
		
	}
	
	@RequestMapping(value="/joinProject", method=RequestMethod.POST)
	public ResponseEntity<String> joinProject(@RequestBody ProjectPartakeVO takeVO){
		
		ResponseEntity<String> entity = null;

		try {
				projectService.joinProject(takeVO);
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			} catch (Exception e1) {
				e1.printStackTrace();
				entity=new ResponseEntity<String>(e1.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
		return entity;
	}
	
	@RequestMapping(value="/joinCancel", method=RequestMethod.POST)
	public ResponseEntity<String> cancelJoinProject(@RequestBody ProjectPartakeVO takeVO){
		ResponseEntity<String> entity = null;

		try {
				projectService.cancelJoinProject(takeVO);
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			} catch (Exception e1) {
				e1.printStackTrace();
				entity=new ResponseEntity<String>(e1.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
		return entity;
	}
	
	@RequestMapping("/mainForm")
	public String mainForm() throws Exception{
		return "/main/main";
	}
	
	// 로그인 후 나의 프로젝트 참여 목록을 보여준다.
	@RequestMapping(value="/myPartakeList", method=RequestMethod.GET)
	public void partakeList(Model model, HttpServletRequest request) throws Exception{
		
		HttpSession session=request.getSession();
		//로그인 유저의 아이디
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		String id = loginUser.getId();
		// 참여 또는 신청중인 프로젝트 리스트
		List<ProjectPartakeVO> myPartakeList = projectService.getBindingProject(id);
		// 비교하기 위한 모든 프로젝트 리스트
		List<ProjectVO> projectList = projectService.readMyProjectList();
		// pjNum으로 비교한 현재 참여중인 프로젝트 리스트
		List<ProjectVO> myProjectList = new ArrayList<ProjectVO>();
		// pjNum으로 비교한 현재 신청중인 프로젝트 리스트
		List<ProjectVO> bindProjectList = new ArrayList<ProjectVO>();
				
		for(ProjectVO project : projectList){
			for(ProjectPartakeVO myPartake : myPartakeList){
				if(project.getPjNum() == myPartake.getPjNum()){
					if(myPartake.getAssignYn() == 1){
						myProjectList.add(project);
					}else{
						bindProjectList.add(project);
					}
				}
			}
		}
		model.addAttribute("myPartakeList",myProjectList);
		model.addAttribute("bindProject", bindProjectList);
	}
	
	@RequestMapping(value="/addProject", method=RequestMethod.GET)
	public void addProjectGET() throws Exception {
		
	}
	
	@RequestMapping(value="/addProject", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> addProject(@RequestBody ProjectVO project, HttpServletRequest request) throws Exception {
		ResponseEntity<String> entity = null;
		
		int pjNum = projectService.getSeq();
		ProjectPartakeVO takeVO = new ProjectPartakeVO();
		try{
			project.setPjNum(pjNum);
			projectService.addProject(project);
			takeVO.setPjNum(pjNum);
			takeVO.setId(project.getCreator());
			projectService.addProjectake(takeVO);
						
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}catch(SQLException e){
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return entity;
	}
	
	@RequestMapping(value="/mypage/modify",method=RequestMethod.POST)
	public String mypageModify(MultipartFile file,MemberVO member, HttpServletRequest request,@RequestParam String origin)throws Exception{
		if(origin == null){
				String savedName=file.getOriginalFilename();
				File target = new File(uploadProfile,savedName);
				
				FileCopyUtils.copy(file.getBytes(), target);
			
		}
		
		service.modify(member);
		MemberVO loginUser=service.getMemberById(member.getId());
		request.getSession().setAttribute("loginUser", loginUser);
		return "redirect:/main/myPartakeList";
	}
	
	@RequestMapping(value="/mypage/changeOrigin", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> changeOrigin(@RequestParam String id,HttpSession session)throws Exception{
		ResponseEntity<String> entity = null;
		System.out.println("아이디 : " +id);
		try {
			service.updateOriginProfile(id);
			MemberVO member = (MemberVO) session.getAttribute("loginUser");
			System.out.println("member : "+member);
			MemberVO loginUser=service.getMemberById(member.getId());
			session.setAttribute("loginUser", loginUser);

			entity=new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/mypage/resetPwd")
	public String resetPwd()throws Exception{
		return "member/mypage/resetPwd";
	}
	
	@RequestMapping(value="/mypage/resetPwd",method=RequestMethod.POST)
	public String resetPwdPOST(MemberVO member,String newPwd)throws Exception{
		
		member.setPwd(newPwd);
		service.resetMemberPwd(member);
		return "redirect:/main/myPartakeList";
		/*MemberVO loginUser=(MemberVO)request.getSession().getAttribute("loginUser");
		if((loginUser.getPwd()).equals(member.getPwd())){
			member.setPwd(newPwd);
			service.resetMemberPwd(member);
			return "redirect:/main/myPartakeList";
		}else{
			return "redirect:/member/mypage/resetPwd";
		}*/
	}
	
	@RequestMapping("/mypage/resetEmail")
	public String resetEmail()throws Exception{
		return "member/mypage/resetEmail";
	}
	
	@RequestMapping(value="/getEmailCode")
    @ResponseBody
    public Map<Object, Object> getEmailCode(@RequestBody String email) throws Exception {
		
		String tempKey = notifier.sendMail(email);
		
        Map<Object, Object> map = new HashMap<Object, Object>();
        map.put("tempKey", tempKey);
 
        return map;
    }
	
	@RequestMapping(value="/mypage/resetEmail" ,method=RequestMethod.POST)
	public String resetEmailPOST(MemberVO member,String newEmail,HttpServletRequest request)throws Exception{
		
		member.setEmail(newEmail);
		service.modifyEmail(member);
		MemberVO loginUser=service.getMemberById(member.getId());
		request.getSession().setAttribute("loginUser", loginUser);
		
		return "redirect:/main/myPartakeList";
	}
	
	
	
	
}
