<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   response.setHeader("Pragma", "No-cache");
   response.setHeader("Cache-Control", "no-cache");
   response.addHeader("Cache-Control", "no-store");
   response.setDateHeader("Expires", 1L);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Project Management System</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/dist/css/skins/skin-blue.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/dist/css/projectskin.css">
 
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <decorator:head />
</head>
<body class="hold-transition skin-blue layout-boxed sidebar-mini">
<div class="wrapper">
  <%@ include file="/WEB-INF/views/commons/include/emailyn.jsp" %>
  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="/main/" class="logo">
      <span class="logo-lg"><b>${logonProject.name }</b></span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          
          <!-- 사서함 버튼 -->
          <li class="dropdown messages-menu">
            <!-- Menu toggle button -->
            <a href="#" onclick="postbox_go();">
               <script>
                  function postbox_go(){
                     var url="/postbox/list?id=${ loginUser.id }";
                     window.open( url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=900, height=800, top=300, left=300, ");                  
                  }
               </script>
            <i class="fa fa-envelope-o"></i>
            </a>
          </li>
          <!-- /.사서함 버튼 -->

          <!-- Notifications Menu -->
          <li class="dropdown notifications-menu">
            <!-- Menu toggle button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">10</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 10 notifications</li>
              <li>
                <!-- Inner Menu: contains the notifications -->
                <ul class="menu">
                  <li><!-- start notification -->
                    <a href="#">
                      <i class="fa fa-users text-aqua"></i> 5 new members joined today
                    </a>
                  </li>
                  <!-- end notification -->
                </ul>
              </li>
              <li class="footer"><a href="#">View all</a></li>
            </ul>
          </li>
          
          <!-- Domain Menu -->
          <li class="dropdown notifications-menu">
            <!-- Menu toggle button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-gear"></i>
            </a>
            <ul class="dropdown-menu">
              <li class="header">Support PMS</li>
              <li>
                <!-- Inner Menu: contains the notifications -->
                <ul class="menu">
                  <li><!-- start notification -->
                    <a href="<%=request.getContextPath()%>/question/listQna">
                      <i class="glyphicon glyphicon-question-sign"></i>QnA
                    </a>
                    <a href="<%=request.getContextPath()%>/notice/listPage">
                      <i class="glyphicon glyphicon-exclamation-sign"></i>Notice
                    </a>
                  </li>
                  <!-- end notification -->
                </ul>
              </li>
              <li class="footer"></li>
            </ul>
          </li>
             
              
          <!-- ----------------상단 헤더 사용자 정보창 ----------------- -->
          <!-- User Account Menu -->
            <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- The user image in the navbar-->
              <img src="<%=request.getContextPath()%>/resources/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              
              <!-- 접속한 사람의 아이디 혹은 이름 노출 -->
              <span class="hidden-xs">${loginUser.name }</span>
              
            </a>
            
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img src="<%=request.getContextPath()%>/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                <p>
                  ${loginUser.name }
                  <small>Member since&nbsp; <fmt:formatDate pattern="yyyy-MM-dd" value="${loginUser.indate}" /></small>
                </p>
              </li>
              
              <!-- Menu Body -->
           	  <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
              </li>
              
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
               		<button id="profileBtn" type="button" class="btn btn-default btn-flat" data-toggle="modal" data-target="#modal-default">내정보</button>
            	</div>
                <div class="pull-right">
                  <a href="<%= request.getContextPath() %>/commons/logout" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>

          
        </ul>
      </div>
    </nav>
  </header>

<!-- 마이페이지 modal -->
<form action="/main/mypage/modify" method="post" name="mypageForm">
   <div class="modal fade in" id="modal-default" style="display: none; padding-right: 16px; height: auto;">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span>
               </button>
               <h4 class="modal-title">내 정보</h4>
            </div>

            <div class="modal-body">
               <div class="box-body">
               
                  <div class="form-group">
                     <label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
                     <div class="col-sm-10">
                        <input type="text" class="form-control" name="id" readonly value="${loginUser.id }" /><br />
                     </div>
                  </div>
                  
                  <div class="form-group">
                     <label for="inputPassword3" class="col-sm-2 control-label">패스워드</label>
                     <div class="col-sm-10">
                        <!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
                        <button type="button" class="btn btn-block btn-warning" style="width: 150px;" onclick="location.href='<%=request.getContextPath()%>/main/mypage/resetPwd'">패스워드 변경</button>
                        <br/>
                     </div>
                  </div>

                  <div class="form-group">
                     <label for="inputEmail3" class="col-sm-2 control-label">이름</label>
                     <div class="col-sm-10">
                        <input type="text" class="form-control" name="name" value="${loginUser.name }" />
                        <br />
                     </div>
                  </div>

                  <div class="form-group">
                     <label for="inputEmail3" class="col-sm-2 control-label">이메일</label>
                     <div class="col-sm-10">
                        <input type="email" class="form-control" name="email" readonly
                           value="${loginUser.email }" style="margin-bottom: 10px;" />
                        <button type="button" class="btn btn-block btn-warning" style="width: 150px;" onclick="location.href='<%=request.getContextPath()%>/main/mypage/resetEmail'">이메일 변경</button>
                        <br />
                     </div>
                  </div>

                  <div class="form-group">
                     <label for="inputEmail3" class="col-sm-2 control-label">핸드폰</label>
                     <div class="col-sm-10">
                        <input type="text" class="form-control" name="phone" value="${loginUser.phone }">
                     </div>
                  </div>

                  <div class="form-group">
                     <div class="col-sm-offset-2 col-sm-10"></div>
                  </div>
               </div>
            </div>

            <div class="modal-footer">
               <button onclick="profileModify_go(); " type="button"
                  class="btn btn-primary">수정</button>
            </div>
            
         </div>
         <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
   </div>
</form>

<script>
   function profileModify_go() {
      document.mypageForm.submit();
      alert("회원정보가 수정되었습니다.");
   }
</script>
<!-- /.마이페이지 modal -->

<!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="<%=request.getContextPath()%>/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${loginUser.name}</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- search form (Optional) -->
      <sec:authorize access="hasAuthority('ROLE_USER')">
      <form action="<%=request.getContextPath()%>/main/searchPList" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" id="keywordInput" name="keyword" class="form-control" placeholder="프로젝트명 검색">
          <span class="input-group-btn">
              <button type="submit" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
        </div>
      </form>
      </sec:authorize>
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">Menu</li>
     	<!-- Optionally, you can add icons to the links -->
		<sec:authorize access="hasAuthority('ROLE_USER')">
			<li class="treeview">
				<a href="#"><i class="fa fa-link"></i>
					<span>계획설계</span> 
						<span class="pull-right-container"> 
						<i class="fa fa-angle-left pull-right"></i>
					</span> 
				</a>
				<ul class="treeview-menu">
					<c:choose>
						<c:when test="${loginUser.id eq logonProject.creator }">
							<c:if test="${empty logonProject.puuid }">
								<li><a href="/plan/registerPlan"><i class="fa fa-circle-o"></i>프로젝트 계획서</a></li>
							</c:if>
							<c:if test="${!empty logonProject.puuid }">
								<li><a href="/plan/modifyPlan"><i class="fa fa-circle-o"></i>프로젝트 계획서</a></li>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${empty logonProject.puuid }">
								<li><a href="empty"><i class="fa fa-circle-o"></i>프로젝트 계획서</a></li>
							</c:if>
							<c:if test="${!empty logonProject.puuid }">
								<li><a href="/plan/viewPlan" target="_blank"><i class="fa fa-circle-o"></i>프로젝트 계획서</a></li>
							</c:if>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${loginUser.id eq logonProject.creator }">
							<c:if test="${logonProject.rdNum eq 0 }">
								<li><a href="/project/requirement/create"><i class="fa fa-circle-o"></i>요구사항 정의서</a></li>
							</c:if>
							<c:if test="${logonProject.rdNum ne 0 }">
								<li><a href="/project/requirement/list"><i class="fa fa-circle-o"></i>요구사항 정의서</a></li>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${logonProject.rdNum eq 0 }">
								<li><a href="empty"><i class="fa fa-circle-o"></i>요구사항 정의서</a></li>
							</c:if>
							<c:if test="${logonProject.rdNum ne 0 }">
								<li><a href="/project/requirement/list"><i class="fa fa-circle-o"></i>요구사항 정의서</a></li>
							</c:if>
						</c:otherwise>
					</c:choose>
					
					<li>
						<c:if test="${ logonProject.creator eq loginUser.id }">
							<c:if test="${ logonProject.udNum == 0 }">
								<a href="<%=request.getContextPath()%>/project/unitwork/create">
									<i class="fa fa-circle-o"></i>단위업무 생성
								</a>
							</c:if>
							<c:if test="${ logonProject.udNum != 0 }">
								<a href="<%=request.getContextPath()%>/project/unitwork/list">
									<i class="fa fa-circle-o"></i>단위업무 정의서
								</a>
							</c:if>
						</c:if> <c:if test="${ logonProject.creator != loginUser.id }">
							<c:if test="${ logonProject.udNum == 0 }">
								<a href="empty"> <i class="fa fa-circle-o"></i>단위업무 정의서
								</a>
							</c:if>
							<c:if test="${ logonProject.udNum != 0 }">
								<a href="<%=request.getContextPath()%>/project/unitwork/list">
									<i class="fa fa-circle-o"></i>단위업무 정의서
								</a>
							</c:if>
						</c:if>
					</li>
					
					<li>
						<c:if test="${ logonProject.creator eq loginUser.id }">
							<c:if test="${ logonProject.gcNum == 0 }">
								<a href="<%=request.getContextPath()%>/project/gantt/create">
									<i class="fa fa-circle-o"></i>간트차트 생성
								</a>
							</c:if>
							<c:if test="${ logonProject.gcNum != 0 }">
								<a href="<%=request.getContextPath()%>/project/gantt/list">
									<i class="fa fa-circle-o"></i>간트차트
								</a>
							</c:if>
						</c:if> 
						<c:if test="${ logonProject.creator != loginUser.id }">
							<c:if test="${ logonProject.gcNum == 0 }">
								<a href="empty"> <i class="fa fa-circle-o"></i>간트차트
								</a>
							</c:if>
							<c:if test="${ logonProject.gcNum != 0 }">
								<a href="<%=request.getContextPath()%>/project/gantt/list">
									<i class="fa fa-circle-o"></i>간트차트
								</a>
							</c:if>
						</c:if>
					</li>
					
					<li>
						<a href="<%=request.getContextPath()%>/project/usecase/view">
						<i class="fa fa-circle-o"></i>U-C Diagram</a></li>
				</ul>
			</li>


			<li>
				<a href="<%=request.getContextPath() %>/project/finance/list?fNum=${logonProject.fNum}">
					<i class="fa fa-link"></i> <span>예산관리</span>
				</a>
			</li>

			<li>
				<a href="#"> 
					<i class="fa fa-link"></i><span>캘린더</span>
				</a>
			</li>

			<li class="treeview">
				<a href="#"><i class="fa fa-link"></i>
					<span>게시판</span>
					<span class="pull-right-container"> 
					<i class="fa fa-angle-left pull-right"></i>
					</span> 
				</a>
				<ul class="treeview-menu">
					<li>
						<a href="<%=request.getContextPath()%>/fileboard/fileboardlist">
						<i class="fa fa-circle-o"></i>자료실</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/boardnotice/listPage">
						<i class="fa fa-circle-o"></i>공지사항</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/board/listPage">
						<i class="fa fa-circle-o"></i>자유게시판</a>
					</li>
				</ul>
			</li>

			<li>
				<a href="<%=request.getContextPath()%>/project/issue/list"> 
					<i class="fa fa-link"></i><span>ISSUE</span>
				</a>
			</li>
			
			<c:if test="${loginUser.id ne logonProject.creator}">
				<li>
					<a href="#" class="leave" data-toggle="modal" data-target="#modal-leaveProject">
						<i class="fa fa-link" data-toggle="modal" data-target="#modal-leaveProject"></i> <span>프로젝트 탈퇴</span>
					</a>
				</li>
			</c:if>
			
			<c:if test="${loginUser.id eq logonProject.creator }">
			<li class="treeview">
				<a href="#"><i class="fa fa-link"></i>
					<span>팀 관리</span>
					<span class="pull-right-container"> 
					<i class="fa fa-angle-left pull-right"></i>
					</span> 
				</a>
				<ul class="treeview-menu">
					<li>
						<a href="<%=request.getContextPath()%>/project/manage/member">
						<i class="fa fa-circle-o"></i>참여중인 멤버관리</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/project/manage/joinMember">
						<i class="fa fa-circle-o"></i>참여신청 관리</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/boardnotice/listPage">
						<i class="fa fa-circle-o"></i>프로젝트 수정</a>
					</li>
				</ul>
			</li>
			</c:if>
		</sec:authorize>

	</ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$("a[href='empty']").on("click", function(e) {
		e.preventDefault();
		alert("아직 계획서가 등록되지 않았습니다.");
	});
	
	$("button[type=submit]").on("click", function(e){
		if($("input[type=keyword]").val()==''){
			alert("검색할 키워드를 입력해주세요.");
			return;
		}
	});
	
		
</script>
<body>
<div class="modal fade" id="modal-leaveProject">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">프로젝트 탈퇴</h4>
				</div>
				<div class="modal-body">
					<input type="hidden" name="id" value="${ loginUser.id }">
					<label class="control-label">해당 프로젝트에서 탈퇴하시려면 '탈퇴'를 입력해주세요.</label>
					<input class="form-control" type="text" name="leave" placeholder="탈퇴">
					<span class="help-block" id="pNameHelp"><i class=""></i></span>
					<span class="glyphicon glyphicon-pencil form-control-feedback" id="pjNameIcon"></span><br/>
				</div>
				<div class="modal-footer">
					<!-- 프로젝트 기간.end -->
					<button type="button" id="leave_btn" class="btn btn-block btn-success btn-lg" disabled>탈 퇴</button>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
	$('.leave').on("click", function(e){
		e.preventDefault();
	});
	
	var lText = '';
	var pjNum = ${logonProject.pjNum};
	var id = '${loginUser.id}';
	
	$('input[name=leave]').on('blur', function(e){
		$(this).css({ borderColor : 'red' });
		lText = $(this).val();
		
		if(lText == null || lText == ''){
			$('#pNameHelp').css({ color : 'red' });
			$(this).focus();
			$('button#leave_btn').prop('disabled', true);
			return;
		}
		if(lText == '탈퇴'){
			$(this).css({ borderColor : 'green' });
			$('#pNameHelp').css({ color : 'green', fontWeight : 'bold' });
			$('button#leave_btn').prop('disabled', false);
		}
	});
		
		$('#leave_btn').on('click', function(e){
			if(lText != "탈퇴"){
				$('#pNameHelp').css({ color : 'red' });
				$('input[name=leave]').focus();
				$('button#leave_btn').prop('disabled', true);
				return;
			}
			$.ajax({
				url : '<%=request.getContextPath()%>/project/leaveProject',
				method : 'POST',
				data : JSON.stringify({
					'id': id,
					'pjNum':pjNum
				}),
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"post"
				},
				success : function(data){
					alert('프로젝트에서 탈퇴했습니다.');
					location.href="<%= request.getContextPath()%>/main/myPartakeList"
				},
				error : function(error){
					alert('서버 내부오류가 발생했습니다. 자세한 사항은 관리자에게 문의바랍니다.');
				}
			});
		});
	</script>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">