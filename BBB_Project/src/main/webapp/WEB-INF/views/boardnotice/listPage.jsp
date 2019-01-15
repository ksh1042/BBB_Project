<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<body>

<section class="content-header">
		<h1>공지사항</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath() %>/project/main?pjNum=${logonProject.pjNum}">
				<i class="fa fa-dashboard">&nbsp;&nbsp;&nbsp;${logonProject.name }</i></a></li>
			<li class="active">공지사항</li>
		</ol>
</section>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box">
				<div class="box-body">
					
					<table class="table table-bordered" border="1">
						<tr>
							<th style="text-align: center;" width="10%">번호</th>
							<th style="text-align: center;" width="50%">제목</th>
							<th style="text-align: center;" width="10%">공지일</th>
							
						</tr>
						<c:if test="${!empty boardnoticeList }">
						<c:forEach items="${board }" var="board">
						<c:forEach items="${boardnoticeList}" var="boardnotice">
						<c:if test="${board.bNum eq boardnotice.bNum }">
							<tr>
								<c:if test="${board.inDate gt boardnotice.noticeDate }">
								<td style="text-align: center;">${boardnotice.bNum}</td>
								<td style="text-align: center;"><a
									href='readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bNum=${boardnotice.bNum}'>
										${board.title }</a></td>
								<td style="text-align: center;">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${boardnotice.noticeDate}" />
								</td>
								</c:if>
								
								<c:if test="${boardnotice.noticeDate gt board.inDate }">
								<td style="text-align: center;">${boardnotice.bNum}</td>
								<td style="text-align: center;"><a
									href='readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bNum=${boardnotice.bNum}'>
										${board.title }</a></td>
								<td style="text-align: center;">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${boardnotice.noticeDate}" />
								</td>
								</c:if>
							</tr>
						</c:if>
						</c:forEach>
					 	</c:forEach> 
						</c:if>
						<c:if test="${empty boardnoticeList }">
							<tr>
								<td style="text-align:center;" colspan="3">내용이 없습니다.</td>
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








