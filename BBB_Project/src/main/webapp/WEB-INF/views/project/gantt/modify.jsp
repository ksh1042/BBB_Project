<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
<title>간트차트 수정</title>
</head>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">간트차트 수정</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="content-body">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">간트차트</h3>
					<div id="btn-custom" style="float: right;">
						<button type="button" class="btn btn-alert" onclick="hist_go();">취소</button>
						<button type="button" class="btn btn-primary"
							onclick="modify_go();"
							style="margin-left: 20px; margin-right: 20px;">확인</button>
					</div>
				</div>
				<div class="box-body">
					<div id="example2_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap">
						<div class="row">
							<div class="col-sm-6"></div>
							<div class="col-sm-6"></div>
						</div>
						<div class="row" style="overflow: scroll; overflow-y: hidden;">
							<div class="col-sm-12">
								<form id="frm" method="POST">
									<table id="udList"
										class="table table-bordered table-hover dataTable" role="grid"
										aria-describedby="example2_info">
										<tr role="row">
											<th class="sorting_desc" tabindex="0"
												aria-controls="example2" rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending"
												aria-sort="descending">-</th>
											<th class="sorting_desc" tabindex="0"
												aria-controls="example2" rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending"
												aria-sort="descending">*단위업무ID</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Platform(s): activate to sort column ascending">*단위업무명</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">*요구사항ID</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">*요구사항명</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">담당자</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">외부설계<br>완료일자
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">내부설계<br>완료일자
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">프로그램설계<br>완료일자
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">개발<br>완료일자
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">예상Step수</th>
										</tr>
										<c:if test="${ empty unitList }">
											<tr role="row" class="odd">
												<td colspan="11">표시할 내용이 없습니다</td>
											</tr>
										</c:if>
										<c:forEach var="unit" items="${ unitList }" varStatus="stat">
											<tr role="row"
												class="${ (stat.count mod 2)==0 ? 'even':'odd' }">
												<td style="font-weight: bold;"><a href="#"
													class="deleteRow" style="color: red;"> <span
														class="glyphicon glyphicon-minus-sign "></span>
												</a></td>
												<td><input type="text" class="form-control" name="udId"
													value="${ unit.udId }"></td>
												<td><input type="text" class="form-control"
													name="udName" value="${ unit.udName }"></td>
												<td>
													<!-- 요구사항 아이디 --> <select name="rdId" class="form-control">
														<option value="${ unit.rdId }" selected hidden>${ unit.rdId }</option>
														<c:forEach var="require" items="${ requireList }">
															<option value="${ require.rdId }">${ require.rdId }</option>
														</c:forEach>
												</select>
												</td>
												<td>
													<!-- 요구사항 명 --> <!--  --> <select name="rdName"
													class="form-control">
														<option value="${ unit.rdName }" selected hidden>${ unit.rdName }</option>
														<c:forEach var="require" items="${ requireList }">
															<option value="${ require.rdName }">${ require.rdName }</option>
														</c:forEach>
												</select>
												</td>
												<td><select name="udManager" class="form-control">
														<option value="${ unit.udManager }" selected hidden>${ unit.udManager }</option>
														<c:forEach var="partake" items="${ partakeList }">
															<option class="form-control" value="${ partake.id }">${ partake.id }</option>
														</c:forEach>
												</select></td>
												<td><input type="date" class="form-control"
													name="extDate"
													value='<fmt:formatDate value="${ unit.extDate }" pattern="yyyy-MM-dd"/>'></td>
												<td><input type="date" class="form-control"
													name="intDate"
													value='<fmt:formatDate value="${ unit.intDate }" pattern="yyyy-MM-dd"/>'></td>
												<td><input type="date" class="form-control"
													name="pdDate"
													value='<fmt:formatDate value="${ unit.pdDate }" pattern="yyyy-MM-dd"/>'></td>
												<td><input type="date" class="form-control"
													name="devDate"
													value='<fmt:formatDate value="${ unit.devDate }" pattern="yyyy-MM-dd"/>'></td>
												<td><input type="text" class="form-control"
													name="estmate" value="${ unit.estmate }" size="3"></td>
											</tr>
										</c:forEach>
										<!-- 단위업무 추가하기 -->
										<tr class="addUdPoint">
											<td colspan="11" style="font-weight: bold;"><a href="#"
												class="addRow"><span
													class="glyphicon glyphicon-plus-sign "></span>&nbsp;단위업무
													추가하기</a></td>
										</tr>
									</table>
								</form>
							</div>
						</div>
						<div class="box-footer">
							<div class="form-group">
								<label>*코멘트</label>
								<textarea class="form-control" name="comm" style="resize: none;"
									placeholder="수정사항 내용 및 설명을 입력하세요..."></textarea>
							</div>
						</div>
					</div>
				</div>
	</section>
	<section class="content-footer"></section>
	<script>
		function hist_go() {
			history.go(-1);
		}
		function modify_go() {

		}
	</script>
</body>