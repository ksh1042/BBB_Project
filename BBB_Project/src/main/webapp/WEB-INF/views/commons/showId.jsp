<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="/resources/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="/resources/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/dist/css/AdminLTE.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="/resources/plugins/iCheck/square/blue.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->

<style>
#divId{
	border:1px solid #BDBDBD;
	padding:10px;
	margin-left:50px;
	margin-right:50px;
	text-align:center;
}
</style>
</head>

<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<a href="loginForm"><b>Forgot id?</b></a>
		</div>
		
		<div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">아이디 찾기</h3>
            </div>
            <!-- /.box-header -->
            <div>
            	<c:if test="${findedID ne null}">
            		<br/>&nbsp;&nbsp;회원님의 정보와 일치하는 아이디입니다.<br/><br/><br/>
            		<div id="divId">
	            		${findedID }
	            	</div>
            	</c:if>
            	<c:if test="${findedID eq null}">
            		<br/><br/>
            		<div style="text-align: center;">
	            		회원님의 정보와 일치하는 아이디가 존재하지 않습니다.<br/><br/>
            		</div>
            	</c:if>
            	
            </div>	
              <!-- /.box-body -->
			
            <div class="box-footer">
              <br/>
              <button type="button" class="btn btn-primary" style="margin-left:55px;background-color:#00c0ef;border:1px solid #00c0ef;" onclick="login_go();" >로그인 하기</button>
              <c:if test="${findedID ne null}">
	              <button type="button" class="btn btn-primary" style="margin-left:20px;" onclick="findPwd_go();" >패스워드 찾기</button>
            	</c:if>
            	<c:if test="${findedID eq null}">
	              <button type="button" class="btn btn-primary" style="margin-left:20px;" onclick="location.href='<%=request.getContextPath() %>/commons/findId';" >아이디 찾기</button>
            	</c:if>
              
            </div>
            <br/>
          </div>
		
		<!-- /.form-box -->
	</div>
	<!-- /.register-box -->
</body>
	<!-- jQuery 3 -->
	<script src="/resources/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js"></script>
	
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script type="text/javascript">
	function login_go(){
		location.href="<%=request.getContextPath() %>/commons/loginForm";
	};
	
	
	
</script>

</html>
