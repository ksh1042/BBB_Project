<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<head>
	<title>공지사항</title>
<style>

button#searchBtn{	
	width:27px;
	height:27px;	
	background-position:center;
	background-size:contain;	
	background-color:white;	
	box-sizing:border-box;
	padding:6px;
	 
}
.box-body ul{
	list-style:none;
	overflow:hidden;
}
.box-body ul li{
	height:40px;
	line-height:20px;
}
.box-body ul li:nth-child(1){
	float:left;
}
.box-body ul li:nth-child(2){
	float:right;
}
.box-body ul li:nth-child(2)>input{
	width:300px;
}

</style>
</head>

<body>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">공지사항리스트</h3>
				</div>
				<div class='box-body'>
					<ul>
						<li>
							<sec:authorize access="hasAuthority('ROLE_ADMIN')">
							<button id='newNtn' class="btn btn-primary" onclick="javascript:location.href='register';">New Notice</button>
							</sec:authorize>
						</li>
						<li>
						<form action="listPage">
							<select name="searchType">
								<option value="t" ${cri.searchType eq 't'?'selected':'' }>
								Title</option>
							</select>
							<input id="keywordInput"
								   name="keyword"
								   type="text"  value="${pageMaker.cri.keyword}"/>
							<button id="searchBtn" type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
							</form>
						</li>
					</ul>
				</div>
			</div>
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST PAGING</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered" border="1">
						<tr>
							<th style="width: 10px">NNO</th>
							<th>TITLE</th>
							<th>INDATE</th>
							<th>EXPIRE DATE</th>
							<th>KIND</th>
					</tr>
						<c:if test="${!empty noticeList }">
						<c:forEach items="${noticeList}" var="notice">

							<tr>
								<td>${notice.nNum}</td>
								<td><a
									href='readPage${pageMaker.makeSearch(pageMaker.cri.page) }&nNum=${notice.nNum}'>
										${notice.title}</a></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${notice.inDate}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${notice.expireDate}" /></td>
								<c:if test="${notice.kind == 0}">
								<td>이슈</td>
								</c:if>
								<c:if test="${notice.kind == 1}">
								<td>이벤트</td>
								</c:if>
								<c:if test="${notice.kind == 2}">
								<td>점검</td>
								</c:if>
								<c:if test="${notice.kind == 3}">
								<td>기본</td>
								</c:if>
							</tr>

						</c:forEach>
						</c:if>
						<c:if test="${empty noticeList }">
							<tr>
								<td style="text-align:center;" colspan="5">내용이 없습니다.</td>
							</tr>
						</c:if>

					</table>
				</div>
				<!-- /.box-body -->


				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination link">
 
							<c:if test="${pageMaker.prev}">
								<li><a href="${pageMaker.startPage - 1}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
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
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<form id="jobForm">
  <input type='hidden' name="page" value="${pageMaker.cri.page}"/>
  <input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}"/>
  <input type='hidden' name="searchType" value="${cri.searchType}"/>
  <input type='hidden' name="keyword" value="${cri.keyword}"/>
</form>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
		
	$(".link li a").on("click", function(event){
		
		event.preventDefault(); 
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action","listPage").attr("method", "get");		
		jobForm.submit();
	});
	
	$('#searchBtn').on('click',function(){
		self.location="listPage"
					   +"${pageMaker.makeQuery(1)}"
					   +"&searchType="
					   +$("select option:selected").val()
					   +"&keyword="
					   +$('#keywordInput').val();
	});
</script>



</body>








