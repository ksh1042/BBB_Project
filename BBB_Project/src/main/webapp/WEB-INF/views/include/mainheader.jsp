<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><decorator:title default="내 사서함"></decorator:title></title>
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
</head>

<body class="hold-transition skin-blue layout-top-nav">
	<div class="wrapper">
		<header class="main-header">
			<nav class="navbar navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<a href="<%= request.getContextPath() %>/main/myPartakeList" class="navbar-brand"><b>PMS</b>&nbsp;Project</a>
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar-collapse">
							<i class="fa fa-bars"></i>
						</button>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse pull-left"
						id="navbar-collapse">
						<ul class="nav navbar-nav">
							<li class="dropdown"><a href="<%= request.getContextPath() %>/main/myPartakeList">프로젝트 리스트 </a></li>
						</ul>
						
					</div>
					<!-- /.navbar-collapse -->
					<!-- Navbar Right Menu -->
					<div class="navbar-custom-menu">
						<!-- TODO --- header 우측 메뉴바 -->
						<ul class="nav navbar-nav">
							<li class="dropdown messages-menu">
								<!-- Menu toggle button --> 
								<a href="#" onclick="postbox_go();">
									<script>
										function postbox_go() {
											var url = "/postbox/list?id=${ loginUser.id }";
											window.open(url,"_blank_1","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=900, height=800, top=300, left=300, ");
										}
									</script><i class="fa fa-envelope-o"></i><span class="label label-success"></span>
								</a>
							</li>
							
							<li>
								<form class="navbar-form navbar-left" role="search">
									<div class="form-group">
										<input type="text" class="form-control" id="navbar-search-input"
											placeholder="프로젝트 검색...">
										<button type="button" class="btn btn-default" onclick="search_go();">검색</button>
										<script>
											function search_go(){
												var keyword = $('input#navbar-search-input').val();
												location.href='<%= request.getContextPath() %>/main/searchPList/?searchType=&keyword='+keyword;
											}
										</script>
									</div>
								</form>
							</li>
							<!-- Usermenu  -->
							<li class="dropdown user user-menu">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
									<img src="<%=request.getContextPath()%>/resources/dist/img/user2-160x160.jpg" class="user-image" alt="User Image"> 
									<span class="hidden-xs">${loginUser.name } 님 환영합니다.</span>
								</a>
								<ul class="dropdown-menu">
									<!-- User image -->
									<li class="user-header">
										<img src="<%=request.getContextPath()%>/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
										<p>${loginUser.name } <small>Member sinceNov. 2012</small></p>
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
						</ul>
						
					</div>
					<!-- /.navbar-custom-menu -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</header>
		<body>
			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
			
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
		                  <label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
		
		                  <div class="col-sm-10">
		                    <input type="text" class="form-control" id="inputEmail3" name="id" readonly value="${loginUser.id }"/><br/>
		                  </div>
		                </div>
		                
		                <div class="form-group">
		                  <label for="inputPassword3" class="col-sm-2 control-label">패스워드</label>
		
		                  <div class="col-sm-10">
		                    <!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
		                    <button type="button" class="btn btn-block btn-warning" style="width:150px;">패스워드 변경</button><br/>
		                  </div>
		                </div>
		                
		                 <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">이름</label>
		
		                  <div class="col-sm-10">
		                    <input type="text" class="form-control" id="inputEmail3" name="name" value="${loginUser.name }"/><br/>
		                  </div>
		                </div>
		                
		                 <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">이메일</label>
		
		                  <div class="col-sm-10" >
		                    <input type="email" class="form-control" id="inputEmail3" name="email" readonly value="${loginUser.email }" style="margin-bottom:10px;"/>
		                    <button type="button" class="btn btn-block btn-warning" style="width:150px;">이메일 변경</button><br/>
		                  </div>
		                </div>
		                
		                 <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">핸드폰</label>
		
		                  <div class="col-sm-10">
		                    <input type="text" class="form-control" id="inputEmail3" name="phone"  value="${loginUser.phone }">
		                  </div>
		                </div>
		                
		                <div class="form-group">
		                  <div class="col-sm-offset-2 col-sm-10">
		                  </div>
		                </div>
		              </div>
				       
	              </div>
	              
	              <div class="modal-footer">
	                <button type="button" class="btn btn-primary">수정</button>
	              </div>
	            </div>
	            <!-- /.modal-content -->
	          </div>
	          <!-- /.modal-dialog -->
	        </div>
        
        
      