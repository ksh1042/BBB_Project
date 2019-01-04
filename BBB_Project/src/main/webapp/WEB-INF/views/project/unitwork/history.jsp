<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">단위업무 수정이력</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-md-9">
				<div class="box">
					<div class="box-header"></div>
					<div class="box-body">
						<table class="table table-bordered table-hover dataTable"
							role="grid" aria-describedby="example2_info">
							<tr class="role">
								<th>번호</th>
								<th>코멘트</th>
								<th>수정 발생일</th>
							</tr>
							<c:if test="">
							</c:if>
							<c:forEach var="hist" items="${ unitHistList }">
								<tr>
									<td>${ hist.rownum }</td>
									<td>${ hist.comm }</td>
									<td><fmt:formatDate value="${ hist.updateDate }"
											pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="box-footer">
						<div class="row">
							<ul class="pagination link pagination-sm no-margin center">
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
				</div>
			</div>
		</div>
	</section>
	<form id="jobForm">
		<input type='hidden' name="page" value="${pageMaker.cri.page}" /> <input
			type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}" />
	</form>
	<script>
		$(".link li a").on("click", function(event) {
			event.preventDefault();
			var targetPage = $(this).attr("href");

			var jobForm = $("#jobForm");
			jobForm.find("[name='page']").val(targetPage);
			jobForm.attr("action", "history").attr("method", "get");
			jobForm.submit();
		});
	</script>
</body>