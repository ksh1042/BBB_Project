<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<head>
<title>자유게시판</title>
<style>

.box-body ul {
	list-style: none;
	overflow: hidden;
}

.box-body ul li {
	height: 40px;
	line-height: 20px;
}

.box-body ul li:nth-child(1) {
	float: left;
}

.box-body ul li:nth-child(2) {
	float: right;
}

.box-body ul li:nth-child(2)>input {
	width: 300px;
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
						<h3 class="box-title">Board List</h3>
					</div>
					<div class='box-body'>
						<ul>
							<li>
								<button id='newBtn' class="btn btn-primary"
									onclick="javascript:location.href='register';">New
									Board</button>
							</li>
						</ul>
					</div>
				</div>
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">LIST PAGING</h3>
					</div>
					<div class="box-body">
						<table class="table table-bordered">
							<tr>
								<th style="width: 10px">글 번호</th>
								<th>프로젝트 번호</th>
								<th>제목</th>
								
								<th>내용</th>
								<th>작성일</th>
								<th style="width: 40px">공지만료일</th>
							</tr>

							<c:forEach items="${noticeList}" var="notice">

								<tr>
									<td>${notice.nNum}</td>
									<td>${notice.title}</td>
									<td>${notice.content}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${notice.indate}" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${notice.expireDate}" /></td>
								</tr>

							</c:forEach>

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
									<li><a href="${pageMaker.endPage +1}">&raquo;</a></li>
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
		<input type='hidden' name="page" value="${pageMaker.cri.page}" /> <input
			type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}" />
		<input type='hidden' name="searchType" value="${cri.searchType}" /> <input
			type='hidden' name="keyword" value="${cri.keyword}" />
	</form>


	<script>
		$(".link li a").on("click", function(event) {

			event.preventDefault();

			/* var targetPage = $(this).attr("href");

			var jobForm = $("#jobForm");
			jobForm.find("[name='page']").val(targetPage);
			jobForm.attr("action", "listPage").attr("method", "get");
			jobForm.submit(); */
		});

		$('#searchBtn').on(
				'click',
				function(event) {
					event.preventDefault();
					/* self.location = "listPage" + "${pageMaker.makeQuery(1)}"
							+ "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ $('#keywordInput').val(); */
				});

		$('#pdfBtn')
				.on(
						'click',
						function(event) {
							event.preventDefault();
							/* location.href = "listPage/pdf?page=${pageMaker.cri.page}&perPageNum=${pageMaker.cri.perPageNum}"; */
						});
		$('#excelBtn')
				.on(
						'click',
						function(event) {
							event.preventDefault();
							/* location.href = "listPage/excel?page=${pageMaker.cri.page}&perPageNum=${pageMaker.cri.perPageNum}"; */
						});
	</script>



</body>








