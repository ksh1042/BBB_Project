<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록</title>
</head>
<body>
	<form action="register" method="post">
		
			<tr>
				<td><input type="hidden" name="nNum"/></td>
			</tr>
		<table border="1">
			<tr>
				<td>TITLE</td>
				<td><input type="text" name="title"/></td>
			</tr>
			<tr>
				<td>CONTENT</td>
				<td><textarea class="form-control" name="content" rows="6"
				placeholder="Enter ..."></textarea></td>
			</tr>
			<tr>
				<td>IN_DATE</td>
				<td><input type="date" name="indate" /></td>
			</tr>
			<tr>
				<td>END_DATE</td>
				<td><input type="date" name="expireDate" /></td>
			</tr>
			<tr>
				<td>KIND</td>
				<td><input type="radio" name="kind" checked="checked" value="1" /> <span class="up">이슈</span>&nbsp;&nbsp; 
				<input type="radio"name="kind" value="2"/> <span class="up">이벤트</span><input type="radio" name="kind" checked="checked" value="3" /> <span class="up">점검</span>&nbsp;&nbsp; 
				<input type="radio"name="kind" value="4"/> <span class="up">기본</span></td>
			</tr>
		</table>
		<input type="submit" value="등록"/>
		<input type="button" value="목록으로" onclick="list_go();" />
	</form>
	<form id="jobForm">
	<input type="hidden" name="page" value="${cri.page }">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
		<input type="hidden" name="searchType" value="${cri.searchType }"/>
		<input type="hidden" name="keyword" value="${cri.keyword }" />
	</form>
	
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	function list_go(){
		var jobForm=$("#jobForm");
		jobForm.attr("action","list").attr("method","get");
		jobForm.submit();
	}
</script>
</body>
</html>