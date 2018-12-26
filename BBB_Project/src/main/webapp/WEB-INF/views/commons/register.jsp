<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="register/post" method="post" >
		<table>
		<tr>
		<td>아이디 : </td><td><input type='text' name="id" /></td><td><button type="button" >중복확인</button></td>
		</tr>
		<tr>
		<td>패스워드 : </td><td><input type="password" name="pwd" /></td>
		</tr>
		<tr>
		<td>이름 : </td><td><input type='text' name="name"/></td>
		</tr>
		<tr>
		<td>연락처: </td><td><input type='text' name="phone"/></td>
		</tr>
		<tr>
		<td>이메일 : </td><td><input type="email" name="email" /></td><td><button type="button" >중복확인</button></td>
		</tr>
		</table>
		<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="submit" >가입하기</button> 
		&nbsp;&nbsp;&nbsp;
		<button type='button' onclick="cancel_go()">취소</button>		
		
	</form> 
	
	<script>
		function cancel_go(){
			self.location="loginForm";
		};
	</script>
</body>
</html>