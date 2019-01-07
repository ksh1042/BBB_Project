<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<style>
th {
	text-align: center;
}

tr.even td {
	background-color: : #FAFAFA;
}

td.gantt-cell {
	width: 20px;
	background-color: #AA8888;
}
.red {
	color : red;
}
.orange {
	color : orange;
}
.redError {
	border-color : red;
}
.orangeAlert {
	border-color : orange;
}
</style>
</head>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">간트차트 리스트</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">간트차트</h3>
						<form id="frm" method="post">
							<div id="btn-custom" style="float: right;">
								<label class="control-label validateAlertMsg hidden"></label>
								<button type="button" class="btn btn-warning"
									onclick="hist_go();">뒤로</button>
								<button type="submit" class="btn btn-primary"
									style="margin-left: 20px; margin-right: 20px;">수정</button>
							</div>
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
									<table id="tbl" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
										<tr>
											<th>요구사항명</th>
											<th>단위업무ID</th>
											<th>단위업무명</th>
											<th>담당자</th>
											<th>진행도</th>
											<th>시작일</th>
											<th>종료일</th>
										</tr>
										<c:forEach var="gantt" items="${ ganttList }">
											<tr>
												<td>
													<input type="hidden" name="uddNum" value="${ gantt.uddNum }">
													${ gantt.rdName }
												</td>
												<td>${ gantt.udId }</td>
												<td>${ gantt.udName }</td>
												<td>${ gantt.udManager }</td>
												<td><input type="text" class="form-control" name="percentage" value="${ gantt.percentage }" size="1"></td>
												<td><input type="date" class="form-control" name="startDate" value='<fmt:formatDate value="${ gantt.startDate }" pattern="yyyy-MM-dd"/>' ></td>
												<td><input type="date" class="form-control" name="endDate" value='<fmt:formatDate value="${ gantt.endDate }" pattern="yyyy-MM-dd"/>' ></td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-5">
									<div class="dataTables_info" id="example2_info" role="status"
										aria-live="polite">Showing <b>${ f:length(ganttList) }</b> entries</div>
								</div>
							</div>
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
		<input id="pjStartDate" type="hidden" value='<fmt:formatDate value="${ logonProject.startDate }" pattern="yyyy-MM-dd"/>'>
		<input id="pjEndDate" type="hidden" value='<fmt:formatDate value="${ logonProject.endDate }" pattern="yyyy-MM-dd"/>'>
	</section>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		// functions.start
		function hist_go(){
			location.href='list';
		}
		// functions.end
		// ---------------------------------------------------------------------------------
		var errorIcon = '<i class="fa fa-times-circle-o"></i>';		// 버튼 옆의 에러메세지 발생시 표현되는 x 아이콘
		var alertIcon = '<i class="fa fa-bell-o"></i>';				// 버튼 옆의 경고메세지 발생시 표현되는 벨 아이콘
		var startDate = new Date( $('#pjStartDate').val() );		// 프로젝트 시작일
		var endDate = new Date( $('#pjEndDate').val() );			// 프로젝트 종료일
		var startDateFlag = false;
		var endDateFlag = false;
		var commentFlag = false;
		// ---------------------------------------------------------------------------------
		$('input').on('blur', function(e){
			$(this).removeClass('orangeAlert redError')
		});
		// ---------------------------------------------------------------------------------
		// allDateEach-verify.satrt
		$('input[type=date]').each(function(e){
			if( new Date($(this).val()) <= new Date($('#pjStartDate').val()) ) {
				$('.validateAlertMsg').html(alertIcon + ' 해당 날짜가 확실한지 다시 한 번 확인해주세요 ');
				$('.validateAlertMsg').removeClass('hidden red orange');
				$('.validateAlertMsg').addClass('orange');
				$(this).addClass('orangeAlert');
			}
		});
		// allDateEach-verify.end
		// ---------------------------------------------------------------------------------
		// percentage-verify.start
		$('input[name=percentage]').on('blur', function(e){
			var perVal= $(this).val();
			var pattern = /[^0-9]/;
			
			if($(this).val().match(pattern) || $(this).val() == ''){		// is not number
				$('.validateAlertMsg').html(errorIcon + ' 0~100 사이의 숫자를 입력해주세요 ');
				$('.validateAlertMsg').removeClass('hidden red orange');
				$('.validateAlertMsg').addClass('red');
				$(this).val('0').focus();
				$(this).addClass('redError');
			}else {
				$('.validateAlertMsg').html('');
				$(this).removeClass('redError');
			}
		});
		// percentage-verify.end
		// ---------------------------------------------------------------------------------
		// submit.start
		$('button[type=submit]').on('click', function(e){
			e.preventDefault();
			$('.validateAlertMsg').html('');
			// current-startDate-verify.start
			$('input[name=startDate]').each(function(e){
				currentDate = new Date( $(this).val() );
				$(this).removeClass('redError orangeAlert');
				if( $(this).val() == null || $(this).val() == '' ){
					$('.validateAlertMsg').html(errorIcon + ' 단위업무 시작일을 입력해주세요 ');
					$('.validateAlertMsg').removeClass('hidden red orange');
					$('.validateAlertMsg').addClass('red');
					startDateFlag = false;
					$(this).addClass('redError');
					return false;
				}
				if( currentDate < startDate ){
					$('.validateAlertMsg').html(errorIcon + ' 단위업무 시작일이 프로젝트 생성일보다 빠를 수 없습니다(' + $('#pjStartDate').val() + ') ');
					$('.validateAlertMsg').removeClass('hidden red orange');
					$('.validateAlertMsg').addClass('red');
					$(this).addClass('redError');
					startDateFlag = false;
					$(this).val('');
					return false;
				}
				if( currentDate >= endDate ){
					$('.validateAlertMsg').html(errorIcon + ' 단위업무 시작일이 프로젝트 종료일보다 늦거나 같을 수 없습니다(' + $('#pjEndDate').val() + ') ');
					$('.validateAlertMsg').removeClass('hidden red orange');
					$('.validateAlertMsg').addClass('red');
					$(this).addClass('redError');
					startDateFlag = false;
					$(this).val('');
					return false;
				}
				$(this).removeClass('redError orangeAlert');
				startDateFlag = true;
				
			});
			// current-startDate-verify.end
			// ---------------------------------------------------------------------------------
			// current-endDate-verfiy.start
			if( startDateFlag ){
				$('input[name=endDate]').each(function(e){
					currentDate = new Date( $(this).val() );
					var currentUdStartDate = new Date( $(this).parent().prev().children('input[type=date]').val() );
					$(this).removeClass('redError orangeAlert');
					if( $(this).val() == null || $(this).val() == '' ){
						$('.validateAlertMsg').html(errorIcon + ' 단위업무 종료일을 입력해주세요 ');
						$('.validateAlertMsg').removeClass('hidden orange red');
						$('.validateAlertMsg').addClass('red');
						$(this).addClass('redError');
						endDateFlag = false;
						return false;
					}
					if( currentDate < currentUdStartDate ){
						$('.validateAlertMsg').html(errorIcon + ' 단위업무 종료일이 단위업무 시작일보다 빠를 수 없습니다 ');
						$('.validateAlertMsg').removeClass('hidden orange red');
						$('.validateAlertMsg').addClass('red');
						$(this).addClass('redError');
						endDateFlag = false;
						$(this).val('');
						return false;
					}
					if( currentDate > endDate ){
						$('.validateAlertMsg').html(errorIcon + ' 단위업무 종료일이 프로젝트 종료일보다 늦을 수 없습니다('+ $('#pjEndDate').val() +')');
						$('.validateAlertMsg').removeClass('hidden orange red');
						$('.validateAlertMsg').addClass('red');
						$(this).addClass('redError');
						endDateFlag = false;
						$(this).val('');
						return false;
					}
					
					$(this).removeClass('redError orangeAlert');
					endDateFlag = true;
					
				});
			}
			if( startDate && endDate ){
				if( $('textarea[name=comm]').val() == ''){
					$('textarea[name=comm]').addClass('redError');
					$('.validateAlertMsg').html(errorIcon + ' 코멘트를 입력하시지 않았습니다. 수정 사항에 대해 간단한 코멘트를 남겨주세요');
					$('.validateAlertMsg').removeClass('hidden orange red');
					$('.validateAlertMsg').addClass('red');
					commentFlag=false;
					return;
				}
				$('textarea[name=comm]').removeClass('redError orangeAlert');
				commentFlag=true;
			}
			// current-endDate-verify.end
			// ---------------------------------------------------------------------------------
			// submit-ok.start
			if( startDateFlag && endDateFlag && commentFlag ){
				
				var data = new Array();
				var temp;
				for(var i=0; i<document.getElementsByName('uddNum').length; i++){
					temp = {
						uddNum : document.getElementsByName('uddNum')[i].value,
						percentage : document.getElementsByName('percentage')[i].value,
						startDate : document.getElementsByName('startDate')[i].value,
						endDate : document.getElementsByName('endDate')[i].value,
					}
					data.push(temp);
				}
				
				$.ajax({
					url : '<%=request.getContextPath()%>/project/gantt/modify',
					type :'POST',
					data : JSON.stringify({
						ganttList : data,
						comm : $('textarea[name=comm]').val()
					}),
					headers : {
						'Content-Type' : 'application/json;charset=utf-8',
						'X-HTTP-Method-Override' : 'POST'
					},
					success : function(data){
						if( data == 'SUCCESS' ){
							alert('수정되었습니다');
							location.href = 'list';
						}
					},
					error : function(error){
						alert('통신 오류가 발생하였습니다. 잠시후 다시 시도해주시기 바랍니다. 증상이 지속될 경우 자세한 사항은 관리자에게 문의 바랍니다.');
					}
				});
				
			}else{
				var errorMsg = '';
				if( !startDateFlag ){
					errorMsg += '[시작일] ';
				}
				if( !endDateFlag ){
					errorMsg += '[종료일] ';
				}
				if( !commentFlag ){
					errorMsg += '[코멘트]'
				}
				alert(errorMsg + '입력에 문제가 발생하였습니다. 다시 확인해주시기 바랍니다.');
				return;
			}
			// submit-ok.end
		});
		// submit.end
		// ---------------------------------------------------------------------------------
	</script>
</body>