<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<body>
<!-- Main content -->
<section class="content">

	<!-- 회원 검색창 -->
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">QnA 검색</h3>
					<div class="box-tools">
						<div class="input-group input-group-sm" >
							<div>
								<form action="qnaList">
									<select name="searchType">
										<option value="" ${cri.searchType==null?'selected':'' }>----</option>
										<option value="t" ${cri.searchType eq 't'?'selected':'' }>Title</option>
										<option value="w" ${cri.searchType eq 'w'?'selected':'' }>Writer</option>
										<option value="tc" ${cri.searchType eq 'tw'?'selected':'' }>Tiltle + Writer</option>
									</select>
									<input type="text" name="keyword" value="${pageMaker.cri.keyword }">
									<button type="submit" >
										<i class="fa fa-search" ></i>
									</button>
								</form>
							</div>
							<hr/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /회원검색 끝 -->

	<!-- 회원 리스트 -->
	<div class="row">
		<!-- <div class="col-md-6"> -->
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">QnA List</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>#</th>
							<th>문의번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th style="width: 40px">VIEWCNT</th>
						</tr>
						
					
						<c:forEach var="qna" items="${qnaList }" varStatus="status">

							<tr>
								<td>${status.count }</td>
								<td>${qna.qaNum}</td>
								<td>${qna.title}</td>
								<td>${qna.writer}</td>
								<td>
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qna.indate}" />
								</td>
								<td>
									<span class="badge bg-red">${qna.viewcnt }</span>
								</td>
							</tr>
						</c:forEach>
						
					</table>
				</div>
				<!-- /.box-body -->
				<!-- / 나의 참여목록 리스트 테이블 끝 -->

				<!-- 페이지번호 -->
				<div class="box-footer clearfix">
					<ul class="pagination link pagination-sm no-margin pull-right">
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
							<li><a href="${pageMaker.endPage +1}">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
				<!-- 페이지 번호 끝 -->

			</div>
			<!-- /.box -->

		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
	<form id="jobForm">
		<input type="hidden" name="page" value="${pageMaker.cri.page }">
		<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum }"> 
		<input type="hidden" name="searchType" value="${pageMaker.cri.searchType }" /> 
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }" />
	</form>

	<!-- /.box -->
</section>
<!-- /.content -->

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(".link li a").on("click", function(event){
		event.preventDefault();
		var targetPage = $(this).attr("href");
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action", "listPage").attr("method","get");
		jobForm.submit();
	});
	
</script>
</body>
</html>










