<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="body-wrap">
	<div id="body-header">
		<form action="slist">
			<select name="searchType">
				<option value="" ${pageMaker.cri.searchType==null ? 'selectd' :'' }>검색구분</option>
				<option value="p" ${pageMaker.cri.searchType eq 'p' ? 'selected':'' }>프로젝트번호</option>
				<option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected':'' }>제목</option>
				<option value="w" ${pageMaker.cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
			</select>
			<input type="text" name="keyword" value="${pageMaker.cri.keyword }"/>
			<input type="submit" value="검색" />
		</form>
	</div>
</div>
<div id="body-body">
	<table board="2">
		<tr>
			<td>글 번호</td>
			<td>프로젝트 번호</td>
			<td>제목</td>
			<td>내용</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>수정일</td>
			<td>조회수</td>
		</tr>
		
		<c:forEach items="${boardList }" var="board">
		<tr>
			<td>${board.bnum }</td>
			<td>${board.pjnum }</td>
			<td>${board.title }</td>
			<td>${board.content }</td>
			<td>${board.writer }</td>
			<td>${board.indate }</td>
			<td>${board.updatedate }</td>
			<td>${board.count }</td>
		</c:forEach>
	</table>
</div>
<div id="body-footer">
	<ul class="pagination link">
		<c:if test="${pageMaker.prev }">
			<li><a href="${pageMaker.startPage - 1 }">&laquo;</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage }" end=${pageMaker.endPage }" var="idx">
			<li
				<c:out value="${pageMaker.cri.page == idx ? 'class=active':'' }"/>>
				<a href=${idx }">${idx }</a>
			</li>
		</c:forEach>
		<c:if test=""
		
		></c:if>
	</ul>
</div>

</body>
</html>