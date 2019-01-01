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
		.validateAlert {
			border-color: red;
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
					<span style="float:right;">
						<label class="control-label validateAlertMsg red hidden" style="color:red;"></label>
						<button type="button" class="btn btn-primary" onclick="submit_go();" style="margin-left:20px;">완료</button>
					</span>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div id="example2_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap">
						<div class="row">
							<div class="col-sm-6"></div>
							<div class="col-sm-6"></div>
						</div>
						<div class="row" style="overflow:scroll;overflow-y:hidden;">
							<div class="col-sm-12">
								<form id="frm" method="POST">
									<table id="udList"
										class="table table-bordered table-hover dataTable" role="grid"
										aria-describedby="example2_info">
										<tr role="row">
											<th class="sorting_desc" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending"
												aria-sort="descending">-</th>
											<th class="sorting_desc" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending"
												aria-sort="descending">*요구사항 ID</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Platform(s): activate to sort column ascending">*요구사항 명</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">*요구사항 내용</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">*인터페이스</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">제한사항(규정/법률)</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">수용여부</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">담당자</th>
										</tr>
										<c:forEach var="unit" items="${ unitList }" varStatus="stat">
											<tr role="row" class="${ (stat.count mod 2)==0 ? 'even':'odd' }">
												<td style="font-weight:bold;"><a href="#" class="deleteRow" style="color:red;" ><span class="glyphicon glyphicon-minus-sign "></span></a></td>
												<td><input type="text" class="form-control" name="udId" value="${ unit.udId }"></td>
												<td><input type="text" class="form-control" name="udName" value="${ unit.udName }"></td>
												<td><!-- 요구사항 아이디 -->
													<select name="rdId" class="form-control">
														<option value="${ unit.rdId }" selected hidden>${ unit.rdId }</option>
														<c:forEach var="require" items="${ requireList }">
															<option value="${ require.rdId }">${ require.rdId }</option>
														</c:forEach>
													</select>
												</td>	
												<td>	<!-- 요구사항 명 -->								<!--  -->
													<select name="rdName" class="form-control">
														<option value="${ unit.rdName }" selected hidden>${ unit.rdName }</option>
														<c:forEach var="require" items="${ requireList }">
															<option value="${ require.rdName }">${ require.rdName }</option>
														</c:forEach>
													</select>
												</td>
												<td>
													<select name="udManager" class="form-control">
														<option value="${ unit.udManager }" selected hidden>${ unit.udManager }</option>
														<c:forEach var="partake" items="${ partakeList }">
															<option class="form-control" value="${ partake.id }">${ partake.id }</option>
														</c:forEach>
													</select>
												</td>
												<td><input type="date" class="form-control" name="extDate" value="${ unit.extDate }"></td>
												<td><input type="date" class="form-control" name="intDate" value="${ unit.intDate }"></td>
											</tr>
										</c:forEach>
										
										<!-- 단위업무 추가하기 -->
										<tr class="addUdPoint">
											<td colspan="11" style="font-weight:bold;"><a href="#" class="addRow"><span class="glyphicon glyphicon-plus-sign "></span>&nbsp;단위업무 추가하기</a></td>
										</tr>
										
									</table>
								</form>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script id="templateList" type="text/x-handlebars-template">
	<tr role="row" class="${ (stat.count mod 2)==0 ? 'even':'odd' }">
		<td style="font-weight:bold;"><a href="#" class="deleteRow" style="color:red;" ><span class="glyphicon glyphicon-minus-sign"></span></a></td>
		<td><input type="text" class="form-control" name="udId"></td>
		<td><input type="text" class="form-control" name="udName"></td>
		<td><!-- 요구사항 아이디 -->
			<select name="rdId" class="form-control">
				<option value="${ unit.rdId }">${ unit.rdId }</option>
				<c:forEach var="require" items="${ requireList }">
					<option value="${ require.rdId }">${ require.rdId }</option>
				</c:forEach>
			</select>
		</td>	
		<td>
			<select name="rdName" class="form-control">
				<option value="${ unit.rdName }">${ unit.rdName }</option>
				<c:forEach var="require" items="${ requireList }">
					<option value="${ require.rdName }">${ require.rdName }</option>
				</c:forEach>
			</select>
		</td>
		<td>
			<select name="udManager" class="form-control">
				<option class="form-control" value="${ unit.udManager }">${ unit.udManager }</option>
				<c:forEach var="partake" items="${ partakeList }">
					<option class="form-control" value="${ partake.id }">${ partake.id }</option>
				</c:forEach>
			</select>
		</td>
		<td><input type="date" name="extDate" class="form-control"></td>
		<td><input type="date" name="intDate" class="form-control"></td>
	</tr>
	</script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		var template = Handlebars.compile($('#templateList').html());
		var errorIcon = '<i class="fa fa-times-circle-o"></i>';		// 버튼 옆의 에러메세지 발생시 표현되는 x 아이콘
		
		$('a.addRow').on('click', function(e){
			var row = template();
			//$('#udList tbody').append(row);
			$('.addUdPoint').before(row);
		});
		$('a.deleteRow').on('click', function(e){
			$(this);
			alert('자네 아직 내가 삭제 이벤트를 만들지 않았다는 것을 모르는가 보군');
		});
		
		function submit_go() {
			$('input[name=udId]').each(function(e){
				if( $(this).val() == '' ) {
					$('.validateAlertMsg').html(errorIcon+' 요구사항 ID 항목에 비어있는 값이 존재합니다');
					$('.validateAlertMsg').removeClass('hidden');
					$(this).addClass('validateAlert');
					return;
				}
			});
			$('input[name=udName]').each(function(e){
				
			});
		}
		
		// estmate 숫자 유효성 검증
		$('#udList').on('blur', 'input[name=estmate]', function(e){
			var pattern = /[^0-9]/;

			if($(this).val().match(pattern) || $(this).val() == ''){
				alert('숫자만 입력이 가능합니다');
				$(this).addClass('validateAlert');
				$(this).val('0');
			}else {
				$(this).removeClass('validateAlert');
			}
		});
		// udId 유효성 검증
		$('#udList').on('blur', 'input[name=udId], input[name=udName]', function(e){
			$(this).removeClass('validateAlert');
		});
		$('#udList').on('change', 'select[name=rdId], select[name=rdName], select[name="udManager"]', function(e){
			$(this).removeClass('validateAlert');
		});
		
		// udList
	</script>
</body>