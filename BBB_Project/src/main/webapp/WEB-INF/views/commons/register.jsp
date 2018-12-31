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
</head>

<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<a href="loginForm"><b>Sign Up</b></a>
		</div>

		<div class="register-box-body">
			<p class="login-box-msg" style="font-size: 11pt;">Try PMS right
				now !</p>

			<form action="register" method="post" name="registerForm" id="registerForm" > <!--enctype="multipart/form-data"  -->
				<div>
				<img class="profile-user-img img-responsive img-circle" src="/resources/images/profile.png" alt="User profile picture" id="profile" onclick="profile_go();"><br/>
				<input type="file" name="image" id="uploadProfile" style="display:none;"/>
				</div>
				<div class="form-group has-feedback">
					<input type="text" name="id" class="form-control" placeholder="아이디"
						onblur="checkId();" id="id"> <span
						class="glyphicon glyphicon-log-in form-control-feedback"></span> <label
						id="idState" style="font-size: 0.8em;"></label>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" id="pwd" name="pwd"
						placeholder="패스워드" oninput="checkPwd();"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span> <label
						id="pwdState" style="font-size: 0.8em;"></label>
				</div>
				<div class="form-group has-feedback">
					<input type="email" name="email" class="form-control"
						placeholder="이메일" oninput="checkEmail();" id="email"> <span
						class="glyphicon glyphicon-envelope form-control-feedback"></span>
					<label id="emailState" style="font-size: 0.8em;"></label>
				</div>
				<div class="form-group has-feedback">
					<input type="text" name="name" class="form-control"
						placeholder="이름"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" name="phone" class="form-control"
						placeholder="핸드폰"> <span
						class="glyphicon glyphicon-phone form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck"></div>
					</div>
					<!-- /.col -->
					<div class="box-footer" style="text-align:center;">
						<button type="button" class="btn btn-primary btn-flat"
							onclick="login_go()" style="margin-left:20px;padding-left:20px;padding-right:20px;">취소</button>
						<button type="button" class="btn btn-primary btn-flat"
							onclick="register_go()"style="margin-left:55px;">회원가입</button>
					
					</div>
					<!-- /.col -->
				</div>
			</form>

		</div>
		<!-- /.form-box -->
	</div>
	<!-- /.register-box -->

	<!-- jQuery 3 -->
	<script src="/resources/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script	src="/resources/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js"></script>

	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>

	<script type="text/javascript">
	 
	function register_go() {
		if($("#idState").css("color")=="rgb(67, 116, 217)"){
			if($("#pwdState").css("color")=="rgb(67, 116, 217)"){
				if($("#emailState").css("color")=="rgb(67, 116, 217)"){
					document.registerForm.submit();
				}else{
					alert("이메일이 존재합니다.이메일을 다시 입력해주세요.");
				}
				
			}else{
				alert("패스워드는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 입력해주세요.");
			}
		}else{
			alert("아이디가 존재합니다.다시 입력해주세요.");
		}
	};
		
	function checkPwd() {
			var UserPassword = $("#pwd").val();
	
			if (UserPassword.length < 8 || UserPassword.length > 16){
				$("#pwdState").text("패스워드는  8~15자를 입력해주세요.");
				$("#pwdState").css("color","#F15F5F");
			}else{
				if (!UserPassword
						.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)) {
					$("#pwdState").text("패스워드는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 입력해주세요.");
					$("#pwdState").css("color","#F15F5F");
				}else{
					$("#pwdState").text("사용가능한 패스워드입니다.");
					$("#pwdState").css("color","#4374D9");
				}
			}
		};
		
	function checkId(){
		   var userid =  $("#id").val();
	        $.ajax({
	            async: true,
	            type : 'POST',
	            url:'idCheck',
	            data : userid,
	            dataType : "json",
	            contentType: "application/json; charset=UTF-8",
	            success : function(data) {
	            	if (data.cnt > 0) {
	            		$("#idState").text("아이디가 존재합니다.");
						$("#idState").css("color","#F15F5F");
	                } else {
	                	$("#idState").text("사용가능한 아이디입니다.");
	                	$("#idState").css("color","#4374D9");
	                }
	            },
	            error : function(error) {
	                
	                alert("아이디를 입력해주세요.");
	            }
	        });
	};	

	function checkEmail(){
		
        var userEmail =  $("#email").val(); 
        $.ajax({
            async: true,
            type : 'POST',
            url:'emailCheck',
            data : userEmail,
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
            	if (data.cnt > 0) {
            		$("#emailState").text("이메일이 존재합니다.");
            		$("#emailState").css("color","#F15F5F");
                } else {
                	$("#emailState").text("사용가능한 이메일입니다.");
                	$("#emailState").css("color","#4374D9");
                }
            },
            error : function(error) {
                
                alert("이메일을 입력해주세요.");
            }
        });
	};
	
	function login_go(){
		location.href="/commons/loginForm";
	};
	
	<%-- function profile_go(){
		$("#uploadProfile").click();
		
		$("#uploadProfile").change(function(){
			$("#registerForm").submit();
			$("#uploadProfile").val();
			
			var frm=document.getElementById('profile');
			frm.method="POST";
			frm.enctype='multipart/form-data';
			
			var fileData=new FormData(frm);
			
			$.ajax({
				type:'POST',
				url:'profile',
				data:fileData,
				processData:false,
				contentType:false,
				success : function(data){
					<% System.out.println("------profile upload success.---------");%>
					alert(data);
				},
				error:function(error){
					alert("파일 업로드를 실패했습니다.");
				}
				
			});
		});
	}; --%>
	 
  
  
</script>


</body>
</html>
