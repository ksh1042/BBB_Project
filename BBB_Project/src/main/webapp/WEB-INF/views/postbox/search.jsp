<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
	<style>
		table.table th {
			background-color: #FAFAFA;
		}
		table.table th,td{
			text-align: center;
		}
	</style>
</head>
<body>
	<section class="content-header">
		<h1>회원 검색</h1>
		<ol class="breadcrumb">
			<li>postbox</li>
			<li><a href="<%=request.getContextPath()%>/postbox/search"><b>search</b></a></li>
		</ol>
	</section>
	<section class="content">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">'${ fn:length(memberList) }'건의 내용이 검색되었습니다</h3>
					<div class="box-tools">
						<!-- <div class="input-group input-group-sm" style="width: 150px;">
							<input type="text" name="keyword" class="form-control pull-right" placeholder="검색...">
							<div class="input-group-btn">
								<button type="submit" class="btn btn-default">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div> -->
					</div>
				</div>
				<!-- table -->
				<div class="box-body table-responsive no-padding">
					<table class="table table-hover">
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>이메일</th>
						</tr>
						<c:if test="${ empty memberList }">
							<tr>
								<td colspan="3">표시할 내용이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="member" items="${ memberList }">
							<tr>
								<td><a href="<%= request.getContextPath() %>/postbox/list?id=${ member.id }">${ member.id }</a></td>
								<td>${ member.name }</td>
								<td>${ member.email }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- table.end -->
				<div class="box-footer">
					<ul class="pagination link pagination-sm no-margin pull-right">
						<c:if test="${pageMaker.prev}">
								<li><a href="${pageMaker.startPage - 1}">&laquo;</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
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
	</section>
	<form id="jobForm">
	  <input type='hidden' name="page" value="${pageMaker.cri.page}"/>
	  <input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}"/>
	  <input type='hidden' name="searchType" value="${pageMaker.cri.searchType}"/>
	  <input type='hidden' name="keyword" value="${pageMaker.cri.keyword}"/>
	</form>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		$(".link li a").on("click", function(event){
			event.preventDefault(); 
			var targetPage = $(this).attr("href");
			
			var jobForm = $("#jobForm");
	 		jobForm.find("[name='page']").val(targetPage);
			jobForm.attr("action","search").attr("method", "get");		
			jobForm.submit();
		});
	</script>
</body>