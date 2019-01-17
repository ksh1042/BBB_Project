<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>
<!DOCTYPE html>
<html>
<link rel="shortcut icon" href="http://example.com/favicon.ico">
<head>
<meta charset="UTF-8">
<title>Project Management System</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.7 -->
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

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/dist/css/projectskin.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<decorator:head />
<style>
.profile-change{
width:150px;
height:150px;
}
</style>
</head>

<body class="hold-transition skin-blue layout-boxed layout-top-nav">
	<div class="wrapper">
	<%@ include file="/WEB-INF/views/commons/include/emailyn.jsp" %>
		<header class="main-header">
			
			<nav class="navbar navbar-static-top" role="navigation">
		
	           	<sec:authorize access="hasAuthority('ROLE_USER')">
				<a href="<%= request.getContextPath() %>/main/myPartakeList" class="logo">
	           		<span class="logo-lg"><b>프로젝트 목록</b></span>
				</a>
				</sec:authorize>
				<sec:authorize access="hasAuthority('ROLE_ADMIN')">
				<a href="<%= request.getContextPath() %>/admin/mainForm" class="logo">
      				<span class="logo-lg"><b>관리자 페이지</b></span>
				</a>
				</sec:authorize>	
				
				<div class="navbar-custom-menu">
					<!-- TODO --- header 우측 메뉴바 -->
					<ul class="nav navbar-nav">
						
						<!-- 프로젝트 검색 -->
						<sec:authorize access="hasAuthority('ROLE_USER')">
						<li class="hidden-xs">
							<form action="searchPList" class="navbar-form" onsubmit="return check()">
		
								<input type="text" class="form-control" name="keyword" id="navbar-search-input" placeholder="search">
								<button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
								
								<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
								<script>
									function check(){
										if($('input[name=keyword]').val()==''){
											alert("검색할 키워드를 입력해주세요.");
											$('input[name=keyword]').focus();
											return false;
										}
									}
								</script>
			
							</form>
						</li>
						</sec:authorize>
					
						<!-- 사서함 버튼 -->
						<li>
							<a href="#" onclick="postbox_go();">
								<script>
									function postbox_go() {
										var url = "/postbox/list?id=${ loginUser.id }";
										window.open(url,"_blank_1","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=900, height=800, top=300, left=300, ");
									}
								</script><i class="fa fa-envelope-o"></i><span class="label label-success"></span>
							</a>
						</li>
						
					<!-- 알림 Menu -->
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
			                  <!-- 새로운 내용 -->
			                  <li>
			                    <a href="#">
			                      <i class="fa fa-users text-aqua"></i>초대가 온 프로젝트명
			                    </a>
			                  </li>
			                  <li>
			                  	  <div>
			                      <button type="button" class="btn btn-block btn-success" style="float:left; margin-left:10px; width:40%;">수락</button>
			                      <button type="button" class="btn btn-block btn-danger" style="float:right; margin-right:10px; width:40%; margin-top:0;">거절</button>
			                  	  </div>
			                  </li>
			                  <!-- end notification -->
			                </ul>
			              </li>
			              <li class="footer"><a href="#">View all</a></li>
			            </ul>
			          </li>
						 <!-- Domain Menu -->
						<sec:authorize access="hasAuthority('ROLE_USER')">
						<li class="dropdown notifications-menu">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
								<i class="fa fa-gear"></i> 
							</a>
							<ul class="dropdown-menu">
								<li class="header">Support PMS</li>
								<li>
									<ul class="menu">
										<li>
											<a href="<%=request.getContextPath()%>/question/listQna"> 
												<i class="glyphicon glyphicon-question-sign"></i>QnA
											</a> 
											<a href="<%=request.getContextPath()%>/notice/listPage">
												<i class="glyphicon glyphicon-exclamation-sign"></i>Notice
											</a>
										</li>
								
									</ul>
								</li>
								<li class="footer"></li>
							</ul>
						</li>
						</sec:authorize>
						
						<!-- Usermenu  -->
						<li class="dropdown user user-menu">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
								<c:if test="${loginUser.image ne null }">
			                    	<img src="<spring:url value='/profile/${loginUser.image}'/>" class="user-image myOriginProfile" alt="User Image"/>
			                    </c:if>
			                    <c:if test="${loginUser.image eq null }">
			                    	<img src="/resources/images/profile.png" class="user-image" alt="User Image"/>
			                    </c:if>
								<span class="hidden-xs">${loginUser.name } 님 환영합니다.</span>
							</a>
							<ul class="dropdown-menu">
								<!-- User image -->

								<li class="user-header">
									<c:if test="${loginUser.image ne null }">
			                    		<img src="<spring:url value='/profile/${loginUser.image}'/>" class="img-circle myOriginProfile"  alt="User Image"/>
				                    </c:if>
				                    <c:if test="${empty loginUser.image }">
				                    	<img src="/resources/images/profile.png" class="img-circle"  alt="User Image"/>
				                    </c:if>
									<p><strong>${loginUser.id }</strong>(${loginUser.name }) <small>Member since <fmt:formatDate value="${loginUser.indate }" pattern="yyyy-MM"/>
									</small></p>
								</li>
								<!-- Menu Body -->
								<!-- <li class="user-body">
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
									</div> /.row
								</li> -->
								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<button id="profileBtn" type="button" class="btn btn-default btn-flat" data-toggle="modal" data-target="#modal-default">내정보</button>
									</div>
									<div class="pull-right">
										<a href="<%= request.getContextPath() %>/commons/logout" class="btn btn-default btn-flat">로그아웃</a>
									</div>
								</li>
							</ul>
						</li>
						
						<!-- 관리자 Control Sidebar Toggle Button -->
          				<sec:authorize access="hasAuthority('ROLE_ADMIN')">
				          <li>
				            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
				          </li>
				         </sec:authorize>
						
					</ul>
					
				</div>
				<!-- /.navbar-custom-menu -->
			
				<!-- /.container-fluid -->
			</nav>
		</header>
		<body>
			<!-- Content Wrapper. Contains page content -->
			
	              
            <form action="/main/mypage/modify" method="post" name="mypageForm" id="mypageForm" enctype="multipart/form-data">
			<div class="modal fade in" id="modal-default" style="display: none; padding-right: 16px;height: auto;">
	          <div class="modal-dialog">
	            <div class="modal-content">
	              <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                  <span aria-hidden="true">×</span></button>
	                <h4 class="modal-title">내 정보</h4>
	              </div>
	             
	              <div class="modal-body" >
					<div class="box-body">
					
						<div class="form-group" >
							<c:if test="${loginUser.image ne null }">
		                    	<img src="<spring:url value='/profile/${loginUser.image}'/>" class="profile-user-img img-circle profile-change myOriginProfile" style="cursor:pointer;display: block;" onclick="profile_go();"/><br/>
		                    </c:if>
		                    <c:if test="${loginUser.image eq null }">
		                    	<img src="/resources/images/profile.png" class="profile-user-img img-circle profile-change " style="cursor:pointer;display: block;" onclick="profile_go();"/><br/>
		                    </c:if>
		                    <input type="file" name="file" accept="image/jpeg, image/png, image/jpg" id="uploadProfile" style="display:none;">
		                </div>
		                
		                <div class="form-group" >
		                	<label for="inputEmail3" class="col-sm-2 control-label">이미지</label>
			                <div class="col-sm-10">
			                    <button type="button" class="btn btn-block btn-warning" style="width:150px;" onclick="origin_change()">기본 이미지 변경</button><br/>
							</div>
						</div>			
							
		                <div class="form-group" >
		                  <label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
		
		                  <div class="col-sm-10">
		                    <input type="text" class="form-control"  name="id" readonly value="${loginUser.id }"/><br/>
		                  </div>
		                </div>
		                
		                <div class="form-group">
		                  <label for="inputPassword3" class="col-sm-2 control-label">패스워드</label>
		
		                  <div class="col-sm-10">
		                    <!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
		                    <button type="button" class="btn btn-block btn-warning" style="width:150px;" onclick="location.href='<%=request.getContextPath()%>/main/mypage/resetPwd'">패스워드 변경</button><br/>
		                  </div>
		                </div>
		                
		                 <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">이름</label>
		
		                  <div class="col-sm-10">
		                    <input type="text" class="form-control" name="name" value="${loginUser.name }"/><br/>
		                  </div>
		                </div>
		                
		                 <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">이메일</label>
		
		                  <div class="col-sm-10" >
		                    <input type="email" class="form-control"  name="email" readonly value="${loginUser.email }" style="margin-bottom:10px;"/>
		                    <button type="button" class="btn btn-block btn-warning" style="width:150px;" onclick="location.href='<%=request.getContextPath()%>/main/mypage/resetEmail'">이메일 변경</button><br/>
		                  </div>
		                </div>
		                
		                 <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">핸드폰</label>
		
		                  <div class="col-sm-10">
		                    <input type="text" class="form-control" name="phone"  value="${loginUser.phone }">
		                  </div>
		                </div>
		                
		                <div class="form-group">
		                  <div class="col-sm-offset-2 col-sm-10">
		                  </div>
		                </div>
		              </div>
				       
	              </div>
	              
	              <div class="modal-footer">
	                <button onclick="profileModify_go(); "type="button" class="btn btn-primary">수정</button>
	              </div>
	            </div>
	            <!-- /.modal-content -->
	          </div>
	          <!-- /.modal-dialog -->
	        </div>
	        </form>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script>
        	function profileModify_go(){
        		
        		var profileValue = $("#uploadProfile").val().split("\\");
        		var profileName ="";
        		var origin ="";
        		if(profileValue == ""){
        			origin+="origin";
        		}else{
        			origin+="change";
        			profileName = profileValue[profileValue.length-1]; //파일명 추출
        			
        		}
        		
        		var input1=$('<input>').attr('type','hidden').attr('name','image').val(profileName);
        		var input2=$('<input>').attr('type','hidden').attr('name','origin').val(origin);
        		
        		$('form#mypageForm').append(input1).append(input2);
        		document.mypageForm.submit();
        		alert("회원정보가 수정되었습니다.");
        	}
        	
        	function profile_go(){
        		
        		$("#uploadProfile").click();
        		
        		function readURL(input) {
        			 
        		    if (input.files && input.files[0]) {
        		        var reader = new FileReader();
        		 
        		        reader.onload = function (e) {
        		            $('.profile-change').attr('src', e.target.result);
        		        }
        		 
        		        reader.readAsDataURL(input.files[0]);
        		    }
        		}
        		 
        		$("#uploadProfile").change(function(){
        		    readURL(this);
        		});
        		
        	}
        	
        	function origin_change(){
        		var id = "${loginUser.id}";
        		
        		$.ajax({
    				url:"<%=request.getContextPath()%>/main/mypage/changeOrigin",
    				type:"post",
    				data:{
    					"id":id
    				},
    				success:function(data){
    					if(data == "success"){
    						$(".myOriginProfile").attr('src','/resources/images/profile.png');
    					}
    				},
    				error:function(data){
    					alert("이미지 변경에 실패했습니다.");
    				}
    			});	
        	}
        </script>
      
        <div class="content-wrapper">
      