<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#body-wrap{
		width:80%;
		min-width:720px;
		margin:0 auto;
	}
	#body-header{
		text-align:right;
	}
	table{
		width:100%;
	}
	table td{
		text-align:center;
	}
	#body-footer{
		text-align:center;
	}
	
	#body-footer ul{
		overflow:hidden;
		display: table; 
		margin-left: auto; 
		margin-right: auto; 
		display: inline-block;
	}
	#body-footer ul li{
		margin:0 5px;
		float:left;
		list-style:none;
		width:20px;
		height:20px;
		border : 1px solid blue;
		text-align:center;
		line-height:20px;			
	}
	
	#body-footer ul li a{
		text-decoration:none;		
	}
	a:visited{
		color :blue;
	}
	.active {
		background:blue;		
	}
	.active a{
		color:white;
	}
	.active a:visited{
		color:white;
	}
</style>
</head>
<body>
<div id="body-wrap">
	<button type="button" id="registerBtn" >글쓰기</button>
	<div id="body-header">
		<form action="slist">
			<select name="searchType">
				<option value="" ${pageMaker.cri.searchType==null ? 'selected':'' }>검색</option>
				<option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected':'' }>제목</option>
				<option value="w" ${pageMaker.cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
			</select>
			<input type="text" name="keyword"  value="${pageMaker.cri.keyword }"/>
			<input type="submit" value="검색" />
		</form>
		<hr/>
	</div>
	<div id="body-body">
		<table border="1">
			<tr>
				<th>글번호</th>
				<th>프로젝트번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>수정일</th>
				<th>글 구분</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${boardList }" var="board">
			<tr>
				<td>${board.bNum }</td>
				<td><a href="${board.bNum }" class="detailBtn">${board.bNum }</a></td>
				<td>${board.pjNum }</td>
				<td>${board.title }</td>
				<td>${board.content }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.indate}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.updateDate}" /></td>
				<td>${board.kind }</td>
				
				<td style="width:120px;">
					<button type="button" onclick="modify_go('${board.bNum}')">수정</button>
					&nbsp;
					<button type="button" onclick="remove_go('${board.bNum}')">삭제</button>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<div id="body-footer">
		<ul class="pagination link"> 
			<c:if test="${pageMaker.prev}">
				<li><a href="${pageMaker.startPage - 1}">&laquo;</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx ? 'class=active':''}"/>>
					<a href="${idx}">${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="${pageMaker.endPage +1}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</div>

<form id="jobForm">
	<input type="hidden" name="page" value="${pageMaker.cri.page }">
	<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum }">
	<input type="hidden" name="searchType" value="${pageMaker.cri.searchType }"/>
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }" />
</form>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(".link li a").on("click", function(event){
		
		event.preventDefault();
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action","slist").attr("method","get");
		jobForm.submit();
	});
	
	$("#registerBtn").on("click",function(event){
		var jobForm = $("#jobForm");
		jobForm.attr("action","register").attr("method","get");
		jobForm.submit();
	});
	
	$(".detailBtn").on("click",function(event){
		event.preventDefault();
		var jobForm = $("#jobForm");
		
		var input = $("<input>").attr({
			name:'id',
			value:$(this).attr("href")
		});
		jobForm.append(input);
		jobForm.attr("action","detail").attr("method","get");
		jobForm.submit();
	});
	
	function modify_go(id){
		var jobForm = $("#jobForm");
		
		var input = $("<input>").attr({
			name:'id',
			value:id
		});
		jobForm.append(input);
		jobForm.attr("action","modify").attr("method","get");
		jobForm.submit();
	}
	function remove_go(id){
		var jobForm = $("#jobForm");
		
		var input = $("<input>").attr({
			name:'id',
			value:id
		});
		jobForm.append(input);
		jobForm.attr("action","remove").attr("method","post");
		jobForm.submit();
	}
</script>

</body>
</html>





