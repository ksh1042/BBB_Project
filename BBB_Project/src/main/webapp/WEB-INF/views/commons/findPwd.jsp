<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>PMS | Registration Page</title>
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
</head>

<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<a href="loginForm"><b>PASSWORD를 찾을 수 있습니다.</b></a>
		</div>
		
		<div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"></h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form action="findPwd" method="post" name="findPwdForm" >
              <div class="box-body">
              	<div class="form-group">
                  <label for="exampleInputEmail1">ID</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" placeholder="아이디"  name="id" required>
                  <p style="font-size:9pt;">ID를 잊어 버린 경우, <a href="<%=request.getContextPath() %>/commons/findId">ID 찾기</a>를 누르세요!</p>
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">가입 이름</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" placeholder="이름"  name="name" required>
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">가입 Email 주소</label>
                  <input type="email" class="form-control"  placeholder="이메일" id="email" name="email" required><br/>
                  <button type="button" onclick="getEmailCode()">인증Code 받기</button><br/>
                </div>
                  <div class="form-group">
                  <label for="exampleInputPassword1">인증 code</label>
                  <input type="text" class="form-control"  placeholder="인증코드" name="emailCode" id="emailCode" disabled="disabled">
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer" style="text-align: center;">
              <button type="button" class="btn btn-primary" onclick="back_go();" style="margin-left:20px;padding-left:27px;padding-right:27px;">취소</button>
                <button type="button" class="btn btn-primary" style="margin-left:20px;" id="findButton" disabled="disabled" onclick="findPwd();">PWD 재설정</button>
              </div>
              
            </form>
          </div>
		
		<!-- /.form-box -->
	</div>
	<!-- /.register-box -->

	<!-- jQuery 3 -->
	<script src="/resources/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="/resources/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js"></script>


<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script>

	if(!${isExist eq null}){
		alert("없는 회원입니다.");
	};
	
	var tempKey;
	function getEmailCode() {
		
		var email = $("#email").val();
		 $.ajax({
	            async: true,
	            type : 'POST',
	            url:'getEmailCode',
	            data : email,
	            dataType : "json",
	            contentType: "application/json; charset=UTF-8",
	            success : function(data) {
	            	 $("#emailCode").attr("disabled",false);
	        		 $("#findButton").attr("disabled",false);
	        		 tempKey = data.tempKey
	        		 alert("해당 이메일로 인증코드가 발송되었습니다.");
	            },
	            error : function(error) {
	                alert("인증코드 발송을 실패했습니다.\n이메일 주소를 확인 후 다시 시도해주세요.");
	            }
	        });
		
	};
	
	function findPwd() {
		var emailCode = $("#emailCode").val();
		if(emailCode == tempKey){
			document.findPwdForm.submit();
		}else{
			alert("인증코드가 올바르지 않습니다.");
		}
	};
	
	function back_go(){
		history.go(-1);
	};
</script>

</body>
</html>