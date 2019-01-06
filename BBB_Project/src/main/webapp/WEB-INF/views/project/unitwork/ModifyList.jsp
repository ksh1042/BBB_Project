<%@page import="java.text.SimpleDateFormat"%>
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
						<button type="button" class="btn btn-alert" onclick="back_go();" style="margin-left:20px;">뒤로</button>
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
												<td style="font-weight:bold;">
													<a href="#" class="deleteRow" style="color:red;" >
														<span class="glyphicon glyphicon-minus-sign "></span>
													</a>
													<input type="hidden" class="form-control" name="uddNum" value="${ unit.uddNum }">
												</td>
												<td><input type="text" class="form-control" name="udId" value="${ unit.udId }"></td>
												<td><input type="text" class="form-control" name="udName" value="${ unit.udName }"></td>
												<td><!-- 요구사항 아이디 -->
													<input type="hidden" name="rddNum" value="${ unit.rddNum }">
													<select name="rdId" class="form-control">
														<option value="${ unit.rdId }" selected hidden>${ unit.rdId }</option>
														<c:forEach var="require" items="${ requireList }">
															<option value="${ require.rddNum }">${ require.rdId }</option>
														</c:forEach>
													</select>
												</td>	
												<td>	<!-- 요구사항 명 -->	
													<input type="text" name="rdName" class="form-control" value="${ unit.rdName }" readonly>
												</td>
												<td>
													<select name="udManager" class="form-control">
														<option value="${ unit.udManager }" selected hidden>${ unit.udManager }</option>
														<c:forEach var="partake" items="${ partakeList }">
															<option class="form-control" value="${ partake.id }">${ partake.id }</option>
														</c:forEach>
													</select>
												</td>
												<fmt:parseDate value="19600101" pattern="yyyyMMdd" var="checkDate" />
												<td><input type="date" class="form-control" name="extDate" value='<fmt:formatDate value="${ unit.extDate > checkDate ? unit.extDate : '' }" pattern="yyyy-MM-dd"/>'></td>
												<td><input type="date" class="form-control" name="intDate" value='<fmt:formatDate value="${ unit.intDate > checkDate ? unit.intDate : '' }" pattern="yyyy-MM-dd"/>'></td>
												<td><input type="date" class="form-control" name="pdDate" value='<fmt:formatDate value="${ unit.pdDate > checkDate ? unit.pdDate : '' }" pattern="yyyy-MM-dd"/>'></td>
												<td><input type="date" class="form-control" name="devDate" value='<fmt:formatDate value="${ unit.devDate > checkDate ? unit.devDate : '' }" pattern="yyyy-MM-dd"/>'></td>
												<td><input type="text" class="form-control" name="estmate" value="${ unit.estmate }" size="1"></td>
											</tr>
											<select name="rddNumT" class="form-control hidden">
												<option value="${ unit.rddNum }" selected hidden>${ unit.rddNum }</option>
												<c:forEach var="require" items="${ requireList }">
													<option value="${ require.rddNum }">${ require.rddNum }</option>
												</c:forEach>
											</select>
											<select name="rdNameT" class="form-control hidden">
												<option value="${ unit.rdName }" selected hidden>${ unit.rdName }</option>
												<c:forEach var="require" items="${ requireList }">
													<option value="${ require.rdName }">${ require.rdName }</option>
												</c:forEach>
											</select>
											
										</c:forEach>
										<!-- 단위업무 추가하기 -->
										<tr class="addUdPoint">
											<td colspan="11" style="font-weight:bold;"><a href="#" class="addRow"><span class="glyphicon glyphicon-plus-sign "></span>&nbsp;단위업무 행 추가</a></td>
										</tr>
									</table>
								</form>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-5">
								<div class="dataTables_info" id="example2_info" role="status"
									aria-live="polite">Showing <b id="entryCount">${ f:length(unitList) }</b> entries</div>
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
	</section>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script id="templateList" type="text/x-handlebars-template">
	<tr role="row" class="${ (stat.count mod 2)==0 ? 'even':'odd' }">
		<td style="font-weight:bold;"><a href="#" class="deleteRow" style="color:red;" ><span class="glyphicon glyphicon-minus-sign"></span></a>
			<input type="hidden" class="form-control" name="uddNum" value="">
		</td>
		<td><input type="text" class="form-control" name="udId"></td>
		<td><input type="text" class="form-control" name="udName"></td>
		<td><!-- 요구사항 아이디 -->
			<input type="hidden" name="rddNum" value="">
			<select name="rdId" class="form-control">
				<option value="${ unit.rdId }">${ unit.rdId }</option>
				<c:forEach var="require" items="${ requireList }">
					<option value="${ require.rdId }">${ require.rdId }</option>
				</c:forEach>
			</select>
		</td>	
		<td>
			<input type="text" name="rdName" class="form-control" value="" readonly>
		</td>
		<td>
			<select name="udManager" class="form-control">
				<option class="form-control" value="${ unit.udManager }">${ unit.udManager }</option>
				<c:forEach var="partake" items="${ partakeList }">
					<option class="form-control" value="${ partake.id }">${ partake.id }</option>
				</c:forEach>
			</select>
		</td>
		<td><input type="date" name="extDate" class="form-control" value=""></td>
		<td><input type="date" name="intDate" class="form-control" value=""></td>
		<td><input type="date" name="pdDate" class="form-control" value=""></td>
		<td><input type="date" name="devDate" class="form-control" value=""></td>
		<td><input type="text" name="estmate" class="form-control" size="1" value="0"></td>
	</tr>
	</script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		var template = Handlebars.compile($('#templateList').html());
		var errorIcon = '<i class="fa fa-times-circle-o"></i>';		// 버튼 옆의 에러메세지 발생시 표현되는 x 아이콘
		var entryCount = document.getElementById('entryCount');
		var removeUddNumList = new Array();
		$('a.addRow').on('click', function(e){
			var row = template();
			$('.addUdPoint').before(row);
			$(entryCount).html(Number($(entryCount).html())+1);
		});
		$(document).on('click', 'a.deleteRow', function(e){
			$(this).parent().parent().remove();
			$(entryCount).html(Number($(entryCount).html())-1);
			if( !($(this).next().val() == 0 ||  $(this).next().val() == undefined || $(this).next().val() == null) ){				
				removeUddNumList.push($(this).next().val());
			}
		});
		
		function back_go(){
			history.go(-1);
		}
		function submit_go() {
			var flag = true;
			var errorMsg = '입력하지 않은 필수 항목이 존재합니다';
			var unitList = ['udId','udName'];
			var requList = ['rdId','rdName', 'udManager'];
			unitList.forEach( function(item) {
				$('input[name='+item+']').each(function(e){
					if( $(this).val() == '' ) {
						$(this).addClass('validateAlert');
						flag = false;
					}
				});	
			});
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
			
			for(var i=0; i<document.getElementsByName('udId').length; i++){
				if(contains(removeUddNumList, document.getElementsByName('uddNum')[i].value)){
					continue;
				}
				var temp = {
					uddNum : document.getElementsByName('uddNum')[i].value,
					rdId : document.getElementsByName('rdId')[i].value,
					rdName : document.getElementsByName('rdName')[i].value,
					rddNum : document.getElementsByName('rddNum')[i].value,
					udId : document.getElementsByName('udId')[i].value,
					udName : document.getElementsByName('udName')[i].value,
					udManager : document.getElementsByName('udManager')[i].value,
					extDate : document.getElementsByName('extDate')[i].value,
					intDate : document.getElementsByName('intDate')[i].value,
					pdDate : document.getElementsByName('pdDate')[i].value,
					devDate : document.getElementsByName('devDate')[i].value,
					estmate : document.getElementsByName('estmate')[i].value 
				};
				data.push(temp);
			}
			 
			jQuery.ajaxSettings.traditional = true;
			
			$.ajax({
				url : '<%=request.getContextPath()%>/project/unitwork/update',
				type : 'POST',
				data : JSON.stringify({ 
					unitList : data, 
					comm : $('textarea[name=comm]').val(), 
					removeUddNumList : removeUddNumList 
				}),
				headers:{
					"Content-Type":"application/json;charset=utf8",
					"X-HTTP-Method-Override":"post"
				},
		        success : function(data){
					if(data == 'SUCCESS'){
						alert('수정되었습니다');
						location.href='<%=request.getContextPath()%>/project/unitwork/list';
					}
				},
				error : function(error){
					alert('통신 오류가 발생하였습니다. 잠시후 다시 시도해주시기 바랍니다. 증상이 지속될 경우 자세한 사항은 관리자에게 문의 바랍니다.');
				}
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
		$('textarea[name=comm]').on('blur', function(e) {
			$(this).removeClass('validateAlert');
		});
		
		$(document).on('change', 'select[name=rdId]', function(e){
			var selectedIndex = $('option:selected',this).index();
			
			// rdId 아이템 선택을 통한 rdName 자동선택
			var targetSelect = $('select[name=rdNameT]');
			$('option:eq('+selectedIndex+')', targetSelect).removeAttr('selected');	
			$('option:eq('+selectedIndex+')', targetSelect).attr('selected','selected');
			var temp = targetSelect.val();
			
			$(this).parent().next().children('input').val(temp);
			
			// rdId 아이템 선택을 통한  rddNum 자동선택 
			targetSelect = $('select[name=rddNumT]');
			$('option:eq('+selectedIndex+')', targetSelect).removeAttr('selected');	
			$('option:eq('+selectedIndex+')', targetSelect).attr('selected','selected');
			temp = targetSelect.val();
			$(this).prev().val(temp);
			
		});
		
		function contains(data, keyword){
			for(var i=0; i<data.length; i++){
				for(var j=0; j<keyword.length; j++){
					if(data[i] == keyword[j]){
						return true;
					}
				}
			}
			return false;
		}
	</script>
</body>