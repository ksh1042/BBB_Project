<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<form>
		아이디 : <input type ="text" name="name" readonly value="${member.id }"/><br/>
		패스워드 : <input type ="password" name="pwd" value="${member.pwd }"/><br/>
		이름 : <input type="text" name="name" value="${member.name }"/><br/>
		이메일 : <input type="email" name="email" value="${member.email }"/><br/>
		핸드폰 : <input type="text" name="phone" value="${member.phone }"/><br/>
	
	</form>
</body>
</html>