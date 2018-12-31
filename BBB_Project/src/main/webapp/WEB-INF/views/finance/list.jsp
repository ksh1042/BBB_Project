<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">Hover Data Table</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table id="example2" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>등록일</th>
									<th>구분</th>
									<th>금액</th>
									<th>사용처</th>
									<th>내용</th>
									<th>작성자</th>
								</tr>
							</thead>
											
							<tbody>
								<c:if test="${!empty listFinance}">
								<c:forEach var="finance" items="${listFinance }" varStatus="status" >
								<tr>
									<td>
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${finance.indate}" />
									</td>
									<td>${finance.depositYn }</td>
									<td>${finance.price }</td>
									<td>${finance.targetName }</td>
									<td>${finance.content }</td>
									<td>${finance.writer }</td>
								</tr>
								</c:forEach>
								</c:if>
								<c:if test="${empty listFinance }">
									<tr>
										<td style="text-align:center;" colspan="5">등록된 예산내역이 존재하지 않습니다.</td>
									</tr>
								</c:if>
							</tbody>
							
							<tfoot>
								<tr>
									<th>Rendering engine</th>
									<th>Browser</th>
									<th>Platform(s)</th>
									<th>Engine version</th>
									<th>CSS grade</th>
								</tr>
							</tfoot>
							
						</table>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
				
				<!-- 페이지번호 -->
				<div class="box-footer clearfix">
				
					<button id='newBtn' class="btn btn-primary" onclick="javascript:location.href='registerQna';">New QnA</button>
				
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
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
	<form id="jobForm">
		<input type="hidden" name="page" value="${pageMaker.cri.page }">
		<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum }"> 
		<input type="hidden" name="searchType" value="${pageMaker.cri.searchType }" /> 
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }" />
	</form>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(".link li a").on("click", function(event){
		event.preventDefault();
		var targetPage = $(this).attr("href");
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action", "listFinance").attr("method","get");
		jobForm.submit();
	});
	
</script>
</body>
</html>