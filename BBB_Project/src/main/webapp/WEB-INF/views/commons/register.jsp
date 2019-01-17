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
<link rel="stylesheet" href="/resources/font-awesome/css/font-awesome.min.css">
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
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<style>
.inputPhone{
	width:95.4px;
	height:34px;
	border: 1px solid #CFCFCF;
}

</style>
</head>

<body class="hold-transition register-page">
	<div class="login-box">
		<div class="login-logo">
			<b>Project</b>Management
		</div>

		<div class="register-box-body">
			<p class="login-box-msg" style="font-size: 15pt;font-bold:2em;">회원가입</p>

			<form action="register" method="post" name="registerForm" id="registerForm" enctype="multipart/form-data"> 
				<div>
					<img class="profile-user-img img-circle" style="cursor:pointer;display:block;width:120px;height:120px;" src="/resources/images/profile.png" alt="User profile picture" id="profile" onclick="profile_go();"><br/>
					<input type="file" name="file" accept="image/jpeg, image/png, image/jpg" id="uploadProfile" style="display:none;">
				</div>
				<div class="form-group has-feedback">
					<input type="text" name="id" class="form-control" placeholder="아이디" onblur="checkId();" id="id"> 
					<span class="glyphicon glyphicon-log-in form-control-feedback"></span> 
					<label id="idState" style="font-size: 0.8em;"></label>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" id="pwd" name="pwd"
						placeholder="패스워드" oninput="checkPwd();"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span> <label
						id="pwdState" style="font-size: 0.8em;"></label>
				</div>
				<div class="form-group has-feedback">
				<input type="password" class="form-control" id="pwd2" oninput="checkRePwd();"
					placeholder="패스워드 재입력" > <span
					class="glyphicon glyphicon-lock form-control-feedback"></span> <label
					id="pwd2State" style="font-size: 0.8em;"></label>
				</div>
				<div class="form-group has-feedback">
					<input type="email" name="email" class="form-control"
						placeholder="이메일" oninput="checkEmail();" id="email"> <span
						class="glyphicon glyphicon-envelope form-control-feedback"></span>
					<label id="emailState" style="font-size: 0.8em;"></label>
				</div>
				<div class="form-group has-feedback">
					<input type="text" onblur="checkName_go()" id="name" name="name" class="form-control"	placeholder="이름"> 
					<span class="glyphicon glyphicon-user form-control-feedback"></span>
					<label id="nameState" style="font-size: 0.8em;"></label>
				</div>
				<div class="form-group has-feedback"  oninput="checkPhone_go()">
					<select class="inputPhone" id="phone1">
						<option value="">::선택::</option>
					    <option value="011">011</option>
					    <option value="016">016</option>
					    <option value="017">017</option>
					    <option value="019">019</option>
					    <option value="010">010</option>
					</select>&nbsp;-&nbsp;
					<input class="inputPhone" type="text" id="phone2" name="phone2" maxLength="4" placeholder="  4자리" required="required">&nbsp;-&nbsp;
					<input class="inputPhone" type="text" id="phone3" name="phone3" maxLength="4" placeholder="  4자리">
					<span class="glyphicon glyphicon-phone form-control-feedback"></span>
					<label id="phoneState" style="font-size: 0.8em;"></label>
					<input type="hidden" name="phone">
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
							onclick="register_go()"style="margin-left:55px;">가입하기</button>
					
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
	 
	function login_go(){
		location.href="/commons/loginForm";
	};
	 
	function checkId(){
		//var url = $("#uploadProfile").val();
		//var fileName = url.substring( url.lastIndexOf('/')+1, url.length());
		
		var userid =  $("#id").val();
		var UserPassword = $("#pwd").val();
		
		if (userid.length > 25){
			$("#idState").text("아이디는 25자 이하로 입력해주세요.");
			$("#idState").css("color","#F15F5F");
		}else{

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
	                	if(userid == UserPassword){
							$("#idState").text("아이디와 패스워드는 동일할 수 없습니다.");
							$("#idState").css("color","#F15F5F");						
						}else{
		                	$("#idState").text("사용가능한 아이디입니다.");
		                	$("#idState").css("color","#4374D9");
	                	}
	                }
	            },
	            error : function(error) {
	                
	                alert("아이디를 입력해주세요.");
	            }
	            
	        });
		}
	};	
		
	function checkPwd() {
			
			var userid =  $("#id").val();
			var UserPassword = $("#pwd").val();
	
			if (UserPassword.length < 8 || UserPassword.length > 16){
				$("#pwdState").text("패스워드는  8~15자를 입력해주세요.");
				$("#pwdState").css("color","#F15F5F");
			}else{
				if (!UserPassword.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)) {
					$("#pwdState").text("패스워드는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 입력해주세요.");
					$("#pwdState").css("color","#F15F5F");
				}else{
					if(userid == UserPassword){
						$("#pwdState").text("패스워드와 아이디는 동일할 수 없습니다.");
						$("#pwdState").css("color","#F15F5F");						
					}else{
						$("#pwdState").text("사용가능한 패스워드입니다.");
						$("#pwdState").css("color","#4374D9");
					}
				}
			}
		};
		
	function checkRePwd() {
			
			var UserPassword = $("#pwd").val();
			var UserPassword2 = $("#pwd2").val();
	
			if(UserPassword != UserPassword2){
				$("#pwd2State").text("패스워드가 동일하지 않습니다.");
				$("#pwd2State").css("color","#F15F5F");						
			}else{
				$("#pwd2State").text("패스워드가 동일합니다.");
				$("#pwd2State").css("color","#4374D9");
			}
			
		}
		
	

	function checkEmail(){
		
        var userEmail =  $("#email").val(); 
        
        if(!userEmail.match(/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/)){
        	$("#emailState").text("잘못된 이메일 형식입니다.");
    		$("#emailState").css("color","#F15F5F");
        }else{
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
        }
        
	};
	
	function checkName_go(){

		var inputName = $("#name").val();
		
		if (inputName.length > 25 || inputName.length < 1){
			$("#nameState").text("이름은 25자리 이하로  입력해주세요.");
			$("#nameState").css("color","#F15F5F");
		}else{
			$("#nameState").text("사용가능한 이름입니다.");
			$("#nameState").css("color","#4374D9");
		}
		
	}
	
	function checkPhone_go(){
		
		var phone1 = $("#phone1 option:selected").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();
		
		if ( phone1 == "") {
			$("#phoneState").text("휴대폰 번호를 선택해주세요.");
			$("#phoneState").css("color","#F15F5F");
		}else{
			if (phone2 == ""|| phone3 == "" || !phone2.match(/^[0-9]*$/) || !phone3.match(/^[0-9]*$/)){
				$("#phoneState").text("휴대폰 번호는 숫자로만 입력해주세요.");
				$("#phoneState").css("color","#F15F5F");
				
			}else{
				if (phone3.length < 4){
					$("#phoneState").text("휴대폰 번호 4자리를 입력해주세요.");
					$("#phoneState").css("color","#F15F5F");			
				}else{
					$("#phoneState").text("사용가능한 휴대폰 번호 입니다.");
					$("#phoneState").css("color","#4374D9");
				}
			}
		}

		
	}

	function register_go() {
		
		var phone1 = $("#phone1 option:selected").text();
		var phone2 = $("input[name=phone2]").val();
		var phone3 = $("input[name=phone3]").val();
		var phone = phone1+"-"+phone2+"-"+phone3;
		$("input[name=phone]").val(phone);
		
		var profileValue = $("#uploadProfile").val().split("\\");
		var profileName ="";
		if(profileValue == ""){
			profileName = "profile.png";
		}else{
			profileName = profileValue[profileValue.length-1]; //파일명 추출
			
		}
		
		var input1=$('<input>').attr('type','hidden').attr('name','image').val(profileName);
		
		if($("#idState").css("color")=="rgb(67, 116, 217)"){
			if($("#pwdState").css("color")=="rgb(67, 116, 217)"){
				if($("#pwd2State").css("color")=="rgb(67, 116, 217)"){
					if($("#emailState").css("color")=="rgb(67, 116, 217)"){
						if($("#nameState").css("color")=="rgb(67, 116, 217)"){
						  if ($("#phoneState").css("color")=="rgb(67, 116, 217)") {
							  $('form#registerForm').append(input1);
							  document.registerForm.submit();
						  }else{
							  alert("휴대폰 번호를 다시 확인해주세요.");
						  }
						}else{
							alert("이름을 25자리 이하로 입력해주세요.");
						}
					}else{
						alert("이메일을 다시 확인해주세요.");
					}
				}else{
					alert("패스워드가 동일하지 않습니다.");
				}
			}else{
				alert("패스워드는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 입력해주세요.");
			}
		}else{
			alert("아이디를 다시 확인해주세요.");
		}
}
	function profile_go(){
		
		$("#uploadProfile").click();
		
		function readURL(input) {
			 
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();
		 
		        reader.onload = function (e) {
		            $('#profile').attr('src', e.target.result);
		        }
		 
		        reader.readAsDataURL(input.files[0]);
		    }
		}
		 
		$("#uploadProfile").change(function(){
		    readURL(this);
		});
		
	}
	
		
	
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
