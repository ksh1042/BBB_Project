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
		<div class="callout callout-success">
        	<h4>계정 활성화</h4>

        	<p>등록하신 이메일 [<b>${ loginUser.email }</b>]로 인증코드 이메일이 발송되었습니다. 인증코드를 확인 후 아래 입력란에 정확히 기입해주시기 바랍니다.</p>
      	</div>
		<div class="register-logo">
			<a href="loginForm"><b>Account Activation</b></a>
		</div>

		<div class="register-box-body">
			<p class="login-box-msg" style="font-size: 11pt;">Email Authentication now!</p>

			<form> <!--enctype="multipart/form-data"  -->
				<div class="form-group has-feedback">
					<input type="text" name="authKey" class="form-control" placeholder="인증코드를 입력..."
						oninput="checkId();"> <span
						class="glyphicon glyphicon-envelope form-control-feedback"></span> <label
						id="idState" style="font-size: 0.8em;"></label>
				</div>
				
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck"></div>
					</div>
					<!-- /.col -->
					<div class="box-footer" style="text-align:center;">
						<button type="button" class="btn btn-warning btn-flat"
							onclick="reissue_go();" style="margin-left:20px;padding-left:20px;padding-right:20px;">코드 재발급</button>
						<button type="button" class="btn btn-primary btn-flat"
							onclick="confirm_go();"style="margin-left:55px;">확인</button>
					
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
	
	<script>
		function reissue_go() {
			location.href = '<%=request.getContextPath()%>/commons/emailAuth';
		}
		function confirm_go() {
			
			if($('input[name=authKey]').val().length != 8){
				alert('인증키는 8자리입니다. 다시 확인해주세요.');
				return;
			}
			
			$.ajax({
				url : '<%= request.getContextPath() %>/commons/emailAuth',
				type : 'POST',
				data : JSON.stringify({ authKey : $('input[name=authKey]').val() }),
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"post"
				},
				success : function(data) {
					if( data == 'SUCCESS' ){
						alert('인증이 정상적으로 완료되었습니다.');
						location.href = '<%= request.getContextPath() %>/main/myPartakeList';
					}else if( data == 'FAILED' ) {
						alert('인증 코드가 일치하지 않습니다. 다시 확인해주시기 바랍니다.');
					}
				},
				error : function(error) {
					alert('통신 오류가 발생하였습니다. 잠시후 다시 시도해주시기 바랍니다. 증상이 지속될 경우 자세한 사항은 관리자에게 문의 바랍니다.');
				}
				
			});
		}
	</script>

</body>
</html>
