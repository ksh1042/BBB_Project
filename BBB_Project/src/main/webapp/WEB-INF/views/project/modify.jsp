<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
textarea {
	resize: none;
}
label.lineHeight {
	line-height: 35px;
}
.errorRed {
	border-color: red;
}
</style>
</head>
<body>
	<section class="content-header">
		<h1>프로젝트 수정</h1>
		<ol class="breadcrumb">
			<li><a
				href="<%=request.getContextPath() %>/project/main?pjNum=${logonProject.pjNum}"><i class="fa fa-dashboard"></i>${logonProject.name }</a></li>
			<li class="active"><a href="list">관리</a></li>
			<li class="active"><a href="list">프로젝트 수정</a></li>
		</ol>
	</section>
	<br />
	<section class="content">
		<c:set var="originStartDate" value="${ logonProject.startDate }" scope="request"></c:set>
		<c:set var="originEndDate" value="${ logonProject.endDate }" scope="request"></c:set>
		<div class="row">
		<div class="col-xs-12">
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#default" data-toggle="tab"
						aria-expanded="true">기본설정</a></li>
					<li><a href="#advanced" data-toggle="tab" aria-expanded="false">고급설정</a></li>
					<li><a href="#remove" data-toggle="tab" aria-expanded="false">삭제</a></li>
				</ul>
				<div class="tab-content">
					<!------------------------------------------------------------------------------------------------------------------>
					<!-- modify-tab.start -->
					<div class="tab-pane active" id="default">
						<form class="form-horizontal">
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">프로젝트 명</label>

								<div class="col-sm-10">
									<input type="email" class="form-control"
										value="${ logonProject.name }" readonly>
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail" class="col-sm-2 control-label">프로젝트 생성자</label>

								<div class="col-sm-10">
									<input type="text" class="form-control"
										value="${ logonProject.creator }" readonly>
								</div>
							</div>
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">프로젝트 공개여부</label>

								<div class="col-sm-10">
									<label class="control-label">공개</label>
									<input type="radio" class="control-label" name="visibility" value="0" <c:if test="${ logonProject.visibility eq 0 }">checked</c:if>>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label class="control-label">비공개</label>
									<input type="radio" class="control-label" name="visibility" value="1" <c:if test="${ logonProject.visibility eq 1 }">checked</c:if>>
								</div>
							</div>
							<div class="form-group">
								<label for="inputExperience" class="col-sm-2 control-label">프로젝트 설명</label>

								<div class="col-sm-10">
									<textarea class="form-control" name="disc" rows="15">${ logonProject.disc }</textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">프로젝트 생성일</label>
								
								<div class="col-sm-4">
							    	<input class="form-control" type="date" value='<fmt:formatDate value="${ logonProject.indate }" pattern="yyyy-MM-dd"/>' readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">프로젝트 기간</label>
								
								<div class="col-sm-4">
							    	<input class="form-control" type="date" name="startDate" value='<fmt:formatDate value="${ logonProject.startDate }" pattern="yyyy-MM-dd"/>'>
							    	<span class="help-block" id="startDateHelp"><i class=""></i></span>
								</div>
								<label class="col-sm-1 text-center lineHeight">에서</label>
								<div class="col-sm-4">
									<input class="form-control" type="date" name="endDate" value='<fmt:formatDate value="${ logonProject.endDate }" pattern="yyyy-MM-dd"/>'>
							    	<span class="help-block" id="endDateHelp"><i class=""></i></span>
								</div>
								<label class="col-sm-1 text-center lineHeight">까지</label>
								<!-- /.input group -->
							</div>

							<div class="form-group">
								<div class="col-sm-7">
									<label class="control-label red" id="alertMessage" style="margin-left: 15px; color:red;"></label>
								</div>
								<div class="col-sm-5">
									<button type="submit" id="modifyProjectBtn" class="btn btn-primary" style="float:right;">수정</button>
									<button type="submit" class="btn btn-default" style="float:right; margin-right:20px;">뒤로</button>
									
								</div>
							</div>
						</form>
					</div>
					<!-- modify-tab.end  -->
					<!------------------------------------------------------------------------------------------------------------------>
					<!-- remove-tab.start -->
					<div class="tab-pane" id="advanced">
						<div class="form-group text-center">
							<span><i class="glyphicon glyphicon-hourglass"></i></span>
							<label class="control-label">준비중인 서비스입니다...</label>
						</div>
					</div>
					<!-- remove-tab.end  -->
					<!------------------------------------------------------------------------------------------------------------------>
					<!-- remove-tab.start -->
					<div class="tab-pane" id="remove" style="height:165px;">
						<div class="callout callout-danger">
			                <h4><span><i class="fa fa-warning"></i></span>&nbsp;경고</h4>
			                <p>프로젝트를 삭제하면 기록 및 모든 내용이 삭제되며 복구할 수 없습니다. 정말로 삭제를 하실지 신중하게 결정해주시기 바랍니다. <br>※ 삭제를 원하시면 하단의 입력란에  <b>'삭제하겠습니다'</b>를 입력해주시고 확인버튼을 클릭해주세요.</p>
		              	</div>
		              	<div class="form-group">
		              		<div class="col-xs-4"></div>
		              		<div class="col-xs-4">
		              			<div class="input-group">
				              		<input class="form-control" type="text" name="deleteMessage" placeholder="삭제문구를 입력...">
				              		<span class="input-group-btn">
				                      <button type="button" id="deleteProjectBtn" class="btn btn-danger btn-flat">삭제</button>
				                    </span>
			              		</div>
		              		</div>
		              		<div class="col-xs-4"></div>
		              		
		              	</div>
					</div>
					
					<!-- remove-tab.end  -->
				</div>
			</div>
			<!-- /.box -->
		</div>
		</div>
	</section>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
	
		$('input, textarea').on('blur', function(e){
			$(this).removeClass('errorRed');
		});
		
		var deleteKeyword = '삭제하겠습니다';
		var alertIcon = '<i class="fa fa-bell-o"></i>';				// 버튼 옆의 경고메세지 발생시 표현되는 벨 아이콘
		
		$('button#modifyProjectBtn').on('click', function(e){
			if($('textarea[name=disc]').val() == ''){
				$('textarea[name=disc]').addClass('errorRed');
				$('label#alertMessage').html(alertIcon + '  프로젝트 설명을 입력하지 않으셨습니다');
				return false;
			}
			if($('input[name=startDate]').val() == ''){
				$('input[name=startDate]').addClass('errorRed');
				$('label#alertMessage').html(alertIcon + '  프로젝트 시작일을 입력하지 않으셨습니다');
				return false;
			}
			if($('input[name=endDate]').val() == ''){
				$('input[name=endDate]').addClass('errorRed');
				$('label#alertMessage').html(alertIcon + '  프로젝트 종료일을 입력하지 않으셨습니다');
				return false;
			}
			
			if( new Date($('input[name=startDate]').val()) > new Date($('input[name=endDate]').val()) ) {
				$('input[name=endDate]').addClass('errorRed');
				$('label#alertMessage').html(alertIcon + '  프로젝트 종료일이 프로젝트 시작일보다 빠를 수 없습니다');
				return false;
			}
			
			var jsonData = {
				disc : $('textarea[name=disc]').val(),
				visibility : $('input[name=visibility]:checked').val(),
				startDate : $('input[name=startDate]').val(),
				endDate : $('input[name=endDate]').val()
			};
			
			
			$.ajax({
				url : '<%= request.getContextPath()%>/project/modify',
				type : 'POST',
				headers : {
					"Content-Type":"application/json;charset=utf8",
					"X-HTTP-Method-Override":"post"
				},
				data : JSON.stringify(jsonData),
				success : function(data){
					alert('프로젝트가 수정되었습니다.');
					location.href = 'main?pjNum='+${logonProject.pjNum};
				},
				error : function(error){
					alert('통신 오류가 발생하였습니다. 잠시후 다시 시도해주시기 바랍니다. 증상이 지속될 경우 자세한 사항은 관리자에게 문의 바랍니다.');
				}
				
			});
		});
		// ------------------------------------------------------------------------------------------------------------------
		// delete-Project.start
		$('button#deleteProjectBtn').on('click', function(e){
			if( $(this).parent().prev().val() == deleteKeyword ) {
				
				$.ajax({
					url : 'delete',
					type : 'post',
					success : function(data){
						if(data == 'SUCCESS'){
							alert('프로젝트가 삭제되었습니다.');
							location.href = '<%= request.getContextPath() %>/main/myPartakeList';
						}
					},
					error : function(error){
						alert('통신 오류가 발생하였습니다. 잠시후 다시 시도해주시기 바랍니다. 증상이 지속될 경우 자세한 사항은 관리자에게 문의 바랍니다.');
					}
				});
				
			} else {
				alert('삭제 문구가 일치하지 않습니다. 다시 한번 확인해주시기 바랍니다.');
				$('input[name=deleteMessage]').addClass('errorRed');
			}
		});
		// delete-Project.end
		// ------------------------------------------------------------------------------------------------------------------
	</script>
</body>