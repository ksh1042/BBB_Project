<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
	<style>
		th {
			text-align: center;
			white-space: nowrap;
			background-color: #FAFAFA;
		}
		td {
			white-space: nowrap;
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
		</ol>
	</section>
	<br/>
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">단위업무 리스트</h3>
					<button type="button" class="btn btn-primary" onclick="hist_go();" style="margin-left:20px;float:right;">수정 이력</button>
					<button type="button" class="btn btn-warning" onclick="modify_go();" style="margin-left:20px; float:right;">수정</button>		
					<form id="frm" method="post">
					</form>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div id="example2_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap">
						<div class="row">
							<div class="col-sm-6"></div>
							<div class="col-sm-6"></div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<table id="example2"
									class="table table-bordered table-hover dataTable" role="grid"
									aria-describedby="example2_info">
									<tr role="row">
										<th class="sorting" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="Rendering engine: activate to sort column ascending">번호</th>
										<th class="sorting_desc" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="Browser: activate to sort column ascending"
											aria-sort="descending">단위업무ID</th>
										<th class="sorting" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="Platform(s): activate to sort column ascending">단위업무명</th>
										<th class="sorting" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending">요구사항명</th>
										<th class="sorting" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending">담당자</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending">외부설계<br>완료일자</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending">내부설계<br>완료일자</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending">프로그램설계<br>완료일자</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending">개발<br>완료일자</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending">예상Step수</th>
									</tr>
									<c:if test="${ empty unitList }">
										<tr role="row" class="odd"><td colspan="11" style="text-align:center;">표시할 내용이 없습니다</td></tr>
									</c:if>
									<c:forEach var="unit" items="${ unitList }" varStatus="stat">
										<tr role="row" class="${ (stat.count mod 2)==0 ? 'even':'odd' }">
											<td>${ stat.count }</td>
											<td>${ unit.udId }</td>
											<td>${ unit.udName }</td>
											<td><a href="<%=request.getContextPath()%>/project/requirement/list" title="${ unit.rdName }">${ unit.rdId }</a></td>
											<td><a class="postboxLink" href="${ unit.udManager }">${ unit.udManager }</a></td>
											<fmt:parseDate value="19600101" pattern="yyyyMMdd" var="checkDate" />
											<td><fmt:formatDate value="${ unit.extDate > checkDate ? unit.extDate : '' }" pattern="yyyy-MM-dd"/></td>
											<td><fmt:formatDate value="${ unit.intDate > checkDate ? unit.extDate : '' }" pattern="yyyy-MM-dd"/></td>
											<td><fmt:formatDate value="${ unit.pdDate > checkDate ? unit.extDate : '' }" pattern="yyyy-MM-dd"/></td>
											<td><fmt:formatDate value="${ unit.devDate > checkDate ? unit.extDate : '' }" pattern="yyyy-MM-dd"/></td>
											<td>${ unit.estmate }</td>
										</tr>
									</c:forEach>
									<!-- <tr>
										<th rowspan="1" colspan="1">번호</th>
										<th rowspan="1" colspan="1">단위업무ID</th>
										<th rowspan="1" colspan="1">단위업무명</th>
										<th rowspan="1" colspan="1">요구사항ID</th>
										<th rowspan="1" colspan="1">요구사항명</th>
										<th rowspan="1" colspan="1">담당자</th>
										<th rowspan="1" colspan="1">외부설계<br>완료일자</th>
										<th rowspan="1" colspan="1">내부설계<br>완료일자</th>
										<th rowspan="1" colspan="1">프로그램설계<br>완료일자</th>
										<th rowspan="1" colspan="1">개발<br>완료일자</th>
										<th rowspan="1" colspan="1">예상Step수</th>
									</tr> -->
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-5">
								<div class="dataTables_info" id="example2_info" role="status"
									aria-live="polite">Showing <b>${ f:length(unitList) }</b> entries</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
	</section>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		$('a.postboxLink').on('click', function(e) {
			e.preventDefault();
			var url = "<%=request.getContextPath()%>/postbox/list?id="+$(this).attr('href');
			window.open(url,"_blank_1","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=900, height=800, top=300, left=300, ");
		});
		function modify_go() {
			frm.submit();
		}
		function hist_go() {
			location.href = '<%= request.getContextPath()%>/project/unitwork/history';
		}
	</script>
</body>