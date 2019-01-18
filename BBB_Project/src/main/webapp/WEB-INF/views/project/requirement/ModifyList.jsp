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
		<h1 style="cursor: pointer;"onclick="javascript:location.href='<%=request.getContextPath()%>/project/requirement/list';">요구사항 정의서</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/project/main?pjNum=${logonProject.pjNum}">
			<i class="fa fa-dashboard"></i>${logonProject.name }</a></li>
			<li class="active"><a href="<%=request.getContextPath()%>/project/requirement/list">요구사항 정의서</a></li>
			<li class="active">수정 페이지</li>
		</ol>
	</section>
	
	<section class="content">
		<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">요구사항 리스트</h3>
					<span style="float:right;">
						<label class="control-label validateAlertMsg red hidden" style="color:red;"></label>
						<button type="button" class="btn btn-danger" onclick="list_go();" style="margin-left:20px;">취소</button>
						<c:if test="${loginUser.id eq logonProject.creator }">
						<button type="button" class="btn btn-primary" onclick="submit_go();" style="margin-left:20px;">완료</button>
						</c:if>
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
					<form id="frm" method="POST">
						<div class="row" style="overflow:scroll;overflow-y:hidden;">
							<div class="col-sm-12">
									<table id="rdList"
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
										<c:forEach var="require" items="${ requireList }" varStatus="stat">
											<tr role="row" class="${ (stat.count mod 2)==0 ? 'even':'odd' } inputData">
												<td style="font-weight:bold;">
													<input type="hidden" class="form-control" name="rddNum" value="${require.rddNum }">
													<a href="#" class="deleteRow" style="color:red;" >
														<span class="glyphicon glyphicon-minus-sign"></span>
													</a>
												</td>
												<td><input type="text" class="form-control" name="rdId" value="${ require.rdId }"></td>
												<td><input type="text" class="form-control" name="rdName" value="${ require.rdName }"></td>
												<td><input type="text" class="form-control" name="rdContent" value="${ require.rdContent }"></td>
												<td><input type="text" class="form-control" name="limit" value="${ require.limit }"></td>
												<td><input type="text" class="form-control" name="interf" value="${ require.interf }"></td>
												<td><input type="text" class="form-control" name="acceptyn" value="${ require.acceptyn }"></td>
												<td><input type="text" class="form-control" name="manager" value="${ require.manager }"></td>
											</tr>
										</c:forEach>
										
										<!-- 요구사항 추가하기 -->
										<tr class="addRdPoint">
											<td colspan="11" style="font-weight:bold;"><a href="#" class="addRow"><span class="glyphicon glyphicon-plus-sign "></span>&nbsp;요구사항 추가하기</a></td>
										</tr>
										
									</table>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-5">
								<div class="dataTables_info" id="example2_info" role="status"
									aria-live="polite">Showing <b>${ f:length(requireList) }</b> entries</div>
							</div>
						</div>
					</form>
					</div>
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<div class="form-group">
						<label>*코멘트</label>
						<textarea class="form-control" name="comm" style="resize:none;" placeholder="수정사항 내용 및 설명을 입력하세요..."></textarea>
					</div>
				</div>
			</div>
			<!-- /.box -->
		</div>
		</div>
	</section>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script id="templateList" type="text/x-handlebars-template">
	<tr role="row" class="${ (stat.count mod 2)==0 ? 'even':'odd' }">
		<td style="font-weight:bold;"><input type="hidden" name="rddNum" value="0" /><a href="#" class="deleteRow" style="color:red;" ><span class="glyphicon glyphicon-minus-sign"></span></a></td>
		<td><input type="text" class="form-control" name="rdId"></td>
		<td><input type="text" class="form-control" name="rdName"></td>
		<td><input type="text" class="form-control" name="rdContent"></td>
		<td><input type="text" class="form-control" name="limit"></td>
		<td><input type="text" class="form-control" name="interf"></td>
		<td><input type="text" name="acceptyn" class="form-control"></td>
		<td><input type="text" name="manager" class="form-control"></td>
	</tr>
	</script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		var template = Handlebars.compile($('#templateList').html());
		var errorIcon = '<i class="fa fa-times-circle-o"></i>';		// 버튼 옆의 에러메세지 발생시 표현되는 x 아이콘
		var delLine = [];
			$('a.addRow').on('click', function(e){
				var row = template();
				//$('#udList tbody').append(row);
				$('.addRdPoint').before(row);
			});
			$(document).on('click','a.deleteRow', function(e){
				var del = $(this).prev().val();
				if(del > 0){
					delLine.push(del);
				}
				$(this).parent().parent().remove();
				
			});
		
		// estmate 숫자 유효성 검증
		$('#rdList').on('blur', 'input[name=acceptyn]', function(e){
			var pattern = /[^0-9]/;

			if($(this).val().match(pattern) || $(this).val() == ''){
				alert('숫자만 입력이 가능합니다');
				$(this).addClass('validateAlert');
				$(this).val('0');
			}else {
				$(this).removeClass('validateAlert');
			}
		});
		// reId 유효성 검증
		$('#rdList').on('blur', 'input[name=rdId], input[name=rdName]', function(e){
			$(this).removeClass('validateAlert');
		});
		$('#rdList').on('change', 'select[name=rdId], select[name=rdName], select[name="manager"]', function(e){
			$(this).removeClass('validateAlert');
		});
		
		function list_go() {
			history.go(-1); 
		}
		
		function submit_go() {
			var flag = true;
			var errorMsg = '입력하지 않은 필수 항목이 존재합니다';
			var requList = ['rdId','rdName', 'rdContent', 'limit'];
			requList.forEach( function(item) {
				$('select[name='+item+']').each(function(e){
					if( $(this).val() == '' ) {
						$(this).addClass('validateAlert');
						flag = false;
					}
				});
			});
			if(!flag){
				$('.validateAlertMsg').html(errorIcon + ' ' + errorMsg);
				$('.validateAlertMsg').removeClass('hidden');
				flag = true;
				return;
			}
			
			if( $('textarea[name=comm]').val() == '' ) {
				$('.validateAlertMsg').html(errorIcon + ' 코멘트를 입력하시지 않았습니다.');
				$('.validateAlertMsg').removeClass('hidden');
				$('textarea[name=comm]').addClass('validateAlert');
				return;
			}
			
			$('input[type=date]').each(function(e) {
				if( $(this).val() == '' ){
					$(this).val('1959-01-01');
				}
			});
			var data = [];
			for(var i=0; i<document.getElementsByName('rdId').length; i++){
				var temp = {
						rddNum : document.getElementsByName('rddNum')[i].value,
						rdId : document.getElementsByName('rdId')[i].value,
						rdName : document.getElementsByName('rdName')[i].value,
						rdContent : document.getElementsByName('rdContent')[i].value,
						limit : document.getElementsByName('limit')[i].value,
						interf : document.getElementsByName('interf')[i].value,
						acceptyn : document.getElementsByName('acceptyn')[i].value,
						manager : document.getElementsByName('manager')[i].value,
				};
				data.push(temp);
			}
			
			jQuery.ajaxSettings.traditional = true;
			
			$.ajax({
				url : '<%=request.getContextPath()%>/project/requirement/update',
				type : 'POST',
				data : JSON.stringify({
					comm : $('textarea[name=comm]').val(),
					requireList : data,
					deleteList : delLine			
				}),
				headers:{
					"Content-Type":"application/json;charset=utf8",
					"X-HTTP-Method-Override":"post"
				},
				success : function(data){
					if(data == 'SUCCESS'){
						alert('업데이트 성공!');
						location.href='<%=request.getContextPath()%>/project/requirement/list';
					}
				},
				error : function(error){
					alert('통신 오류가 발생하였습니다. 잠시후 다시 시도해주시기 바랍니다. 증상이 지속될 경우 자세한 사항은 관리자에게 문의 바랍니다.');
				}
			});
		}
		// requireList
	</script>
</body>