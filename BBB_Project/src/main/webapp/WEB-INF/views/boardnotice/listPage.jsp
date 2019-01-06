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
					<div></div>
						<li>
						<form action="listPage">
						<span class="glyphicon glyphicon-th-list form-control-feedback" id="listIcon"></span>
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
					<c:if test="${sysdate>boardnotice.noticeDate }">
					<table class="table table-bordered" border="1">
						<tr>
							<th style="width: 10px; text-align: center;">BNO</th>
							<th style="text-align: center;">NOTICE DATE</th>
							
					</tr>
						<c:if test="${!empty boardnoticeList }">
						<c:forEach items="${boardnoticeList}" var="boardnotice">
							<tr>
								<td style="text-align: center;">${boardnotice.bNum}</td>
								<td style="text-align: center;"><a
									href='readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bNum=${boardnotice.bNum}'>
										<fmt:formatDate pattern="yyyy-MM-dd"
										value="${boardnotice.noticeDate}" /></a></td>
							</tr>
						</c:forEach>
						</c:if>
						<c:if test="${empty boardnoticeList }">
							<tr>
								<td style="text-align:center;" colspan="2">내용이 없습니다.</td>
							</tr>
						</c:if>

					</table>
					</c:if>
					
					<table class="table table-bordered" border="1">
						<tr>
							<th style="width: 10px; text-align: center;">BNO</th>
							<th style="text-align: center;">NOTICE DATE</th>
							
					</tr>
						<c:if test="${!empty boardnoticeList }">
						<c:forEach items="${boardnoticeList}" var="boardnotice">
							<tr>
								<td style="text-align: center;">${boardnotice.bNum}</td>
								<td style="text-align: center;"><a
									href='readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bNum=${boardnotice.bNum}'>
										<fmt:formatDate pattern="yyyy-MM-dd"
										value="${boardnotice.noticeDate}" /></a></td>
							</tr>
						</c:forEach>
						</c:if>
						<c:if test="${empty boardnoticeList }">
							<tr>
								<td style="text-align:center;" colspan="2">내용이 없습니다.</td>
							</tr>
						</c:if>

					</table>
				</div>
				<!-- /.box-body -->


				<div class="box-footer">
					<div style="float:right;">
							<sec:authorize access="hasAuthority('ROLE_USER')">
							<c:if test="${loginUser.id eq logonProject.creator }">
							<button id='newNtn' class="btn btn-primary" onclick="javascript:location.href='register';">New Notice</button>
							</c:if>
							</sec:authorize>
					</div>
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
</script>



</body>








