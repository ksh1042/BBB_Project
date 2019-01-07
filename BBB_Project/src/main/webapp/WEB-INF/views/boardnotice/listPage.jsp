<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<body>

<section class="content-header">
		<h1>Project Notice</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/main/myPartakeList">
				<i class="fa fa-dashboard"></i>My Project</a>
			</li>
			<li><a href="<%=request.getContextPath() %>/project/main?pjNum=${logonProject.pjNum}"></a>${logonProject.name }</li>
			<li class="active">notice</li>
		</ol>
</section>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
		
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


				<div class="box-footer text-center">
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
						<c:if test="${loginUser.id eq logonProject.creator }">
							<button id='newNtn' style="float:right; margin-top:20px" class="btn btn-primary" onclick="javascript:location.href='register';">New Notice</button>
						</c:if>
						
						
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








