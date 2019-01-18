<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
 response.setHeader("Content-Disposition","attachment;filename=requirementList.xls");
 response.setHeader("Content-Description", "JSP Generated Data");
%>
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
			overflow:scroll;
			overflow-x:auto;
			overflow-y:hidden;
		}
		table {
			width : 930px;
			table-layout: fixed;
		}
		table td{
	      overflow: hidden;
	      white-space: nowrap;
	      text-overflow: ellipsis;
	    }
	    table th{
	      overflow: hidden;
	      white-space: nowrap;
	      text-overflow: ellipsis;
	    }
	    table tr>td:nth-child(1), table tr>th:nth-child(1) {
	      width : 50px;
	    }
	    table tr>td:nth-child(2), table tr>th:nth-child(2) {
	      width : 140px;
	    }
	    table tr>td:nth-child(3), table tr>th:nth-child(3) {
	      width : 200px;
	    }
	    table tr>td:nth-child(4), table tr>th:nth-child(4) {
	      width : 100px;
	    }
	    table tr>td:nth-child(5), table tr>th:nth-child(5) {
	      width : 70px;
	    }
	    table tr>td:nth-child(6), table tr>th:nth-child(6) {
	      width : 85px;
	    }
	    table tr>td:nth-child(7), table tr>th:nth-child(7) {
	      width : 85px;
	    }
	    table tr>td:nth-child(8), table tr>th:nth-child(8) {
	      width : 85px;
	    }
	    table tr>td:nth-child(9), table tr>th:nth-child(9) {
	      width : 85px;
	    }
	    table tr>td:nth-child(10), table tr>th:nth-child(10) {
	      width : 30px;
	    }
	</style>
</head>
<body>
	<section class="content-header">
		<h1>단위업무 정의서</h1>
	</section>
	<br/>
	
	<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header">
					<div class="col-sm-6">
						<h3 class="box-title"></h3>
					</div>
					<form id="frm" method="post"></form>
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
							<div class="col-sm-12 scrollable" id="exportTable">
								<table id="example2"
									class="table table-bordered table-hover dataTable" role="grid"
									aria-describedby="example2_info">
									<tr role="row">
										<th class="sorting" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="Rendering engine: activate to sort column ascending">번호</th>
										<th class="sorting_desc hidden-xs" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="Browser: activate to sort column ascending"
											aria-sort="descending">단위업무ID</th>
										<th class="sorting" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="Platform(s): activate to sort column ascending">단위업무명</th>
										<th class="sorting hidden-xs" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending">요구사항ID</th>
										<th class="sorting hidden-xs" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending">담당자</th>
											<th class="sorting hidden-xs" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending">외부설계<br>완료일자</th>
											<th class="sorting hidden-xs" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending">내부설계<br>완료일자</th>
											<th class="sorting hidden-xs" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending">프로그램설계<br>완료일자</th>
											<th class="sorting hidden-xs" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending">개발<br>완료일자</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending" title="예상Step수">...</th>
									</tr>
									<c:if test="${ empty unitList }">
										<tr role="row" class="odd"><td colspan="11" style="text-align:center;">표시할 내용이 없습니다</td></tr>
									</c:if>
									<c:forEach var="unit" items="${ unitList }" varStatus="stat">
										<tr role="row" class="${ (stat.count mod 2)==0 ? 'even':'odd' }">
											<td>${ stat.count }</td>
											<td class="hidden-xs">${ unit.udId }</td>
											<td title="${ unit.udName }">${ unit.udName }</td>
											<td class="hidden-xs"><a href="<%=request.getContextPath()%>/project/requirement/list" title="${ unit.rdName }">${ unit.rdId }</a></td>
											<td class="hidden-xs"><a class="postboxLink" href="${ unit.udManager }">${ unit.udManager }</a></td>
											<fmt:parseDate value="19600101" pattern="yyyyMMdd" var="checkDate" />
											<td class="hidden-xs"><fmt:formatDate value="${ unit.extDate > checkDate ? unit.extDate : '' }" pattern="yyyy-MM-dd"/></td>
											<td class="hidden-xs"><fmt:formatDate value="${ unit.intDate > checkDate ? unit.extDate : '' }" pattern="yyyy-MM-dd"/></td>
											<td class="hidden-xs"><fmt:formatDate value="${ unit.pdDate > checkDate ? unit.extDate : '' }" pattern="yyyy-MM-dd"/></td>
											<td class="hidden-xs"><fmt:formatDate value="${ unit.devDate > checkDate ? unit.extDate : '' }" pattern="yyyy-MM-dd"/></td>
											<td>${ unit.estmate }</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		
	</div>
	</section>
	
</body>