<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta charset="UTF-8">
<title>요구사항 명세서</title>
<style type="text/css">
table {
	border:1px solid black;
	border-collapse:collapse;
	width:1000px;
	user-select:none;
}

th, td{
	border : 1px solid black;
	text-align:center;
}
.require-container{
	
	width: 1000px;
	margin: 0;
}
.require-edit{
	width: 100%;
	height:30px;
}
.edit{
	position: relative;
	left : 950px;
	width : 50px;
}


</style>
</head>
<body>
<div class="require-container">
	<div class="require-edit">
		<input type="button" class="edit" value="편집" onclick="edit_go();"/>
	</div>
	<form>
		<table>
			<tr>
				<th colspan="8">요구사항 명세서</th>
			</tr>
			<tr>
				<th>프로젝트명</th>
				<th colspan="2"></th>
				<th>작성일</th>
				<th colspan="2"></th>
				<th>작성자</th>
				<th></th>
			</tr>
			<tr>
				<th>No.</th>
				<th>요구사항ID</th>
				<th>요구사항명</th>
				<th>요구사항 내용</th>
				<th>인터페이스</th>
				<th>제한사항(규정/법률)</th>
				<th>수용여부</th>
				<th>담당자</th>
			</tr>
		<%-- <c:forEach items="2" var="">
			<tr>
				<input type="text" style="width:100%"/>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
				<td>7</td>
				<td>8</td>
			</tr>
		</c:forEach> --%>
		
		</table>
	</form>
</div>
</body>
</html>