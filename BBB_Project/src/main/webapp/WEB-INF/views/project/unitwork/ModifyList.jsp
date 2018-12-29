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
		}
	</style>
</head>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">단위업무 정의목록</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="content">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">단위업무 리스트</h3>
					<button type="button" class="btn btn-warning" onclick="modify_go();" style="float:right;">수정</button>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div id="example2_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap">
						<div class="row">
							<div class="col-sm-6"></div>
							<div class="col-sm-6"></div>
						</div>
						<div class="row" style="overflow:scroll;">
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
											aria-label="Engine version: activate to sort column ascending">요구사항ID</th>
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
										<tr role="row" class="odd"><td colspan="11">표시할 내용이 없습니다</td></tr>
									</c:if>
									<c:forEach var="unit" items="${ unitList }" varStatus="stat">
										<tr role="row" class="${ (stat.count mod 2)==0 ? 'even':'odd' }">
											<td>${ stat.count }</td>
											<td><input type="text" class="form-control" value="${ unit.udId }"></td>
											<td><input type="text" class="form-control" value="${ unit.udName }"></td>
											<td><input type="text" class="form-control" value="${ unit.rdId }"></td>
											<td><input type="text" class="form-control" value="${ unit.rdName }"></td>
											</td>
											<td>
												<select name="udManager" class="form-control">
													<option class="form-control" value="${ unit.udManager }">${ unit.udManager }</option>
													<c:forEach var="partake" items="${ partakeList }">
														<option class="form-control" value="${ partake.id }">${ partake.id }</option>
													</c:forEach>
												</select>
											</td>
											<td><input type="date" class="form-control" value="${ unit.extDate }"></td>
											<td><input type="date" class="form-control" value="${ unit.intDate }"></td>
											<td><input type="date" class="form-control" value="${ unit.pdDate }"></td>
											<td><input type="date" class="form-control" value="${ unit.devDate }"></td>
											<td><input type="text" class="form-control" value="${ unit.estmate }" size="3"></td>
										</tr>
									</c:forEach>
									<tr>
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
									</tr>
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
</body>