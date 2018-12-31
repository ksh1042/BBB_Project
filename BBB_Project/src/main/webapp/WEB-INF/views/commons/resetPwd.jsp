<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	href="/resources/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="/resources/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="/resources/Ionicons/css/ionicons.min.css">
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
			<a href="loginForm"><b>Forgot password?</b></a>
		</div>
		
		<div class="box box-primary">
			<div class="box-header with-border">
              <h3 class="box-title">패스워드 재설정</h3>
            </div>
            <!-- /.box-header -->
        <form action="resetPwd" method="post" name="resetPwdForm">
        	<input type="hidden" name="id" value="${id }"/>
            <div>
            	<br/>&nbsp;&nbsp;회원님의 패스워드를 재설정해주세요.<br/><br/>
            	<div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">New password</label>
                  <input type="password" class="form-control" placeholder="새 비밀번호 입력" id="newPwd" name="pwd">
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Confirm new password</label>
                  <input type="password" class="form-control" placeholder="새 비밀번호 확인" id="reNewPwd">
                </div>
              </div>
              <!-- /.box-body -->
            <div class="box-footer" style="text-align: center;">
              <br/>
              <button type="button" class="btn btn-primary" style="margin-right:20px; background-color:#00c0ef;padding-left:20px;padding-right:20px;border:1px solid #00c0ef;" onclick="login_go()">취소</button>
              <button type="button" class="btn btn-primary" style="margin-left:20px;" onclick="findPwd_go()">패스워드 재설정</button>
            </div>
            <br/>
          </div>
		</form>
		
	
		<!-- /.form-box -->
	</div>
	<!-- /.register-box -->
</body>
	<!-- jQuery 3 -->
	<script src="/resources/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="/resources/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js"></script>
	
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script type="text/javascript">
	function login_go(){
		location.href="<%=request.getContextPath() %>/commons/login";
	}
	
	function findPwd_go(){
		var newPwd=$("#newPwd").val();
		var reNewPwd=$("#reNewPwd").val();
		
		if(newPwd==null || reNewPwd==null){
			alert("패스워드를 입력해주세요.");
			
		}else{

			if(newPwd.length < 8 || newPwd.length > 16) {  
				alert("패스워드는  8~15자를 입력해주세요.");
			}else{
				if (!newPwd.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)) {
					alert("패스워드는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 입력해주세요.");
				}else{
					if(newPwd==reNewPwd){
						alert("패스워드가 변경되었습니다.");
						document.resetPwdForm.submit();
					}else{
						alert("패스워드가 일치하지 않습니다.");
					}
				}
			}

		}
	}
	
	
</script>

</html>
