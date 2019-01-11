<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
	<style>
		th {
			text-align: center;
			background-color : #F1F1F1;
		}
		td {
			white-space: nowrap;
		}
		tbody tr:NTH-CHILD(2n+1)>td {
			background-color : #F1F1F1;
		}
		div.scrollable {
			min-height: 634px;
			overflow:scroll;
			overflow-x:auto;
			overflow-y:hidden;
		}
		table {
			table-layout: fixed;
		}
		table td, table th{
	      overflow: hidden;
	      white-space: nowrap;
	      text-overflow: ellipsis;
	    }
		table tr>td:nth-child(1), table tr>th:nth-child(1) {
	      width : 10%;
	    }
	    table tr>td:nth-child(2), table tr>th:nth-child(2) {
	      width : 70%;
	    }
	    table tr>td:nth-child(3), table tr>th:nth-child(3) {
	      width : 20%;
	    }
	</style>
</head>
<body>
	<section class="content-header">
		<h1>단위업무 정의서</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/main/myPartakeList">
				<i class="fa fa-dashboard"></i>My Project</a>
			</li>
			<li><a href="<%=request.getContextPath() %>/project/main?pjNum=${logonProject.pjNum}">${logonProject.name }</a></li>
			<li class="active"><a href="list">단위업무 정의서</a></li>
			<li class="active"><a href="history">수정이력</a></li>
		</ol>
	</section>
	<br/>
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<div class="col-sm-6">
							<h3 class="box-title">수정 이력</h3>
						</div>
						<div class="col-sm-6 searchDiv">
							<div class="input-group input-group-sm">
								<span class="input-group-btn">								
									<select class="form-control" name="searchType" style="height:30px; width: 105px; font-size:11px;">
										<option value="co" selected>코멘트</option>
									</select>	
								</span>
								<input type="text" id="keyword" class="form-control" value="${ pageMaker.cri.keyword }"> 
								<span class="input-group-btn">
									<button type="button" class="btn btn-default btn-flat" onclick="search_go();">검색</button>
								</span>
							</div>
						</div>
						<form id="frm" method="post"></form>
					</div>
					<div class="box-body">
						<div id="example2_wrapper"
							class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6"></div>
								<div class="col-sm-6"></div>
							</div>
							<div class="row">
								<div class="col-sm-12 scrollable">
									<table class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
										<tr class="role">
											<th>구분</th>
											<th>코멘트</th>
											<th>수정 발생일</th>
										</tr>
										<c:if test="">
										</c:if>
										<c:forEach var="hist" items="${ unitHistList }">
											<tr>
												<td title="${ hist.rownum }">${ hist.rownum }</td>
												<td title="${ hist.comm }">${ hist.comm }</td>
												<td><fmt:formatDate value="${ hist.updateDate }" pattern="yyyy-MM-dd" /></td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="box-footer">
						<div class="row">
							<div class="col-sm-4">
								<div class="dataTables_info" id="example2_info" role="status"
									aria-live="polite">Showing <b>${ fn:length(unitHistList) }</b> entries
								</div>
							</div>
							<div class="col-sm-4 text-center">
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
							<div class="col-sm-4">
								<button class="btn btn-default" style="float:right;" onclick="back_go();">뒤로</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<form id="jobForm">
		<input type='hidden' name="page" value="${pageMaker.cri.page}" />
		<input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}" />
		<input type='hidden' name="searchType" value="${pageMaker.cri.searchType}"/>
		<input type='hidden' name="keyword" value="${pageMaker.cri.keyword}"/>
	</form>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		$(".link li a").on("click", function(event) {
			event.preventDefault();
			var targetPage = $(this).attr("href");

			var jobForm = $("#jobForm");
			jobForm.find("[name='page']").val(targetPage);
			jobForm.attr("action", "history").attr("method", "get");
			jobForm.submit();
		});
		function search_go() {
			location.href = 'history?page=1&searchType='+$('select[name=searchType]').val()+'&keyword='+$('input#keyword').val();
		}
		function back_go(){
			location.href = "list";
		}
	</script>
</body>