<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Project Management | Log in</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/dist/css/AdminLTE.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/plugins/iCheck/square/blue.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
	<security:authorize access="isAuthenticated()">
		<!-- 합칠때 경로 바꿀 것! -->
		<security:authorize access="hasAuthority('ROLE_USER')">
			<script>
				location.href="<%=request.getContextPath()%>/main/myPartakeList";
			</script>
		</security:authorize>
		<security:authorize access="hasAuthority('ROLE_ADMIN')">
			<script>
				location.href="<%=request.getContextPath()%>/admin/mainForm";
			</script>
		</security:authorize>
	
	</security:authorize>
	<div class="login-box">
		<div class="login-logo">
			<b>Project</b>Management
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">Sign in to start your session</p>


			<form role="form"
				action="<%=request.getContextPath()%>/project/partakeList"
				method="post">
				<input type="hidden" name="retUrl" value="${param.retUrl }" />
				<div class="form-group has-feedback">
					<input type="text" name="id" class="form-control"
						placeholder="USER ID" value="${param.id }" /> <span
						class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="pwd" class="form-control"
						placeholder="Password" value="${param.pwd }" /> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<label> <input type="checkbox"> Remember Me
							</label>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button type="button" onclick="login_go();"
							class="btn btn-primary btn-block btn-flat">Sign In</button>
					</div>
					<!-- /.col -->
				</div>
			</form>

			<a href="#">I forgot my password</a><br> <a href="register.html"
				class="text-center">Register a new membership</a>

		</div>
		<!-- /.login-box-body -->
	</div>


	<c:if test="${!empty msg}">
		<script>
			alert('${msg}');
		</script>
	</c:if>
	<!-- /.login-box -->

	<!-- jQuery 3 -->
	<script
		src="<%=request.getContextPath()%>/resources/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/iCheck/icheck.min.js"></script>
	<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
  

  function login_go(){			
		$.ajax({
			url:"<%=request.getContextPath()%>/commons/login",
				data : $('form[role="form"]').serialize(),
				type : "post",
				dataType : 'json',
				beforeSend : function(xhr) {
					xhr.setRequestHeader("Accept", "application/json");
				}

			}).done(function(body) {
				var message = body.message;
				var retUrl = body.retUrl;
				var error = body.error;

				alert(message);

				if (error) {
					$('input[name="pwd"]').val("");
				} else {
					location.href = retUrl;
				}

			});
		};
	</script>
</body>
</html>