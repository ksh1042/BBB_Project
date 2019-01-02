<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<body>
	
	<!-- 예산 잔액 구역 -->
	<div class="info-box">
		<span class="info-box-icon bg-aqua">
			<i class="glyphicon glyphicon-piggy-bank"></i>
		</span>
		<div class="info-box-content">
			<span class="info-box-text">예산 잔액</span>
			<button style="float: right;" type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-finance">예산입력</button>
			<span class="info-box-number">
				<h3>
					<fmt:formatNumber pattern="###,###" value="${financeTotal }" /><small> won</small>
				</h3>
			</span>
		</div>
	</div>
	<!-- /.예산 잔액 구역 -->

	<section class="content-header">
		<h1>Finance List</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/main/myPartakeList">
				<i class="fa fa-dashboard"></i>My Project</a>
			</li>
			<li><a href="<%=request.getContextPath() %>/project/main?pjNum=${logonProject.pjNum}"></a>프로젝트명</li>
			<li class="active">예산관리</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- row -->
		<div class="row">
			<div class="col-md-12">
				<!-- The time line -->
				<ul class="timeline">
				
						<c:forEach var="detailList" items="${financeRegList}">
							<!-- timeline time label -->
							<li class="time-label" style="margin-top: 10px;">
								<span class="bg-red"> 
									<fmt:formatDate pattern="yyyy-MM-dd" value="${detailList.regDate}" />
								</span>
							</li>
							<!-- /.timeline-label -->
							
							<c:forEach var="financeList" items="${financeDetailList }">
							
								<c:if test="${financeList.depositYn==1 and financeList.regDate == detailList.regDate}" >
									<!-- timeline item -->
									<li>
										<i class="fa fa-krw bg-blue"></i>
										<div class="timeline-item" style="border: 1px solid blue">
											<span class="time"><i class="fa fa-user"></i>
												${financeList.writer } &nbsp;&nbsp;&nbsp; 
												<i class="fa fa-clock-o"></i> 
												<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${financeList.indate}" />
											</span>

											<h3 class="timeline-header">
												<a href="#">${financeList.targetName }</a>
											</h3>
											<div class="timeline-body">
												${financeList.content }
											</div>
											<div class="timeline-footer">
												<a class="btn btn-primary btn-xs">수입</a>
												<fmt:formatNumber pattern="###,###" value="${financeList.price}" />
											</div>
										</div>
									</li>
									<!-- /.timeline item -->
								</c:if> 
								
								<c:if test="${financeList.depositYn==0 and financeList.regDate == detailList.regDate}">
									<li>
										<i class="fa fa-krw bg-red"></i>
										<div class="timeline-item" style="border: 1px solid red">
											<span class="time">
												<i class="fa fa-user"></i>
												${financeList.writer } &nbsp;&nbsp;&nbsp; 
												<i class="fa fa-clock-o"></i> 
												<fmt:formatDate pattern="HH:mm" value="${financeList.indate}" />
											</span>
	
											<h3 class="timeline-header">
												<a href="#">${financeList.targetName }</a>
											</h3>
	
											<div class="timeline-body">
												${financeList.content }
											</div>
											<div class="timeline-footer">
												<a class="btn btn-danger btn-xs">지출</a>
												<fmt:formatNumber pattern="###,###" value="${financeList.price}" />
											</div>
										</div>
									</li>
								</c:if>
							</c:forEach>
							<!-- END timeline item -->
							&nbsp;	
						</c:forEach>
						<li><i class="fa fa-clock-o bg-gray"></i></li>
				
				</ul>
		<%-- 		<c:if test="${empty financeDetailList}">
					<tr>
						<td style="text-align: center;" colspan="5">
						등록된 예산정보가 존재하지않습니다.
						</td>
					</tr>
				</c:if> --%>
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->

	<div class="modal fade" id="modal-finance">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">예산 입력 폼</h4>
				</div>
				<div class="modal-body">
					<form action="registerFinance" method="POST">
						<input type="hidden" name="writer" value="${ loginUser.name }">
						<label class="control-label">사용처</label> 
						<input class="form-control " type="text" name="targetName" placeholder="사용처 /수입 이름"> 
						<span class="help-block" id="targetNameHelp"></span> 
						<span class="glyphicon glyphicon-pencil form-control-feedback" id="fNameIcon"></span> 
						<br/> 
						<label class="control-label">수입/지출 내용</label>
						<textarea class="form-control" style="resize: none;" rows="10" placeholder="수입/지출 내용 입력" name="content"></textarea>
						<br/> 
						<label class="control-label">수입/지출일</label> 
						<input class="form-control" type="date" name="regDate"> 
						<span class="help-block" id="regDateHelp"></span> 
						<br/> 
						<label class="control-label">금액</label>
						<div>
							<input class="form-control" type="number" name="price"> 
							<br/>
							<label class="control-label">수입</label> 
							<input type="radio" name="depositYn" value="1" checked>
							&nbsp;&nbsp;&nbsp;
							<label class="control-label">지출</label> 
							<input type="radio" name="depositYn" value="0"> 
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" id="create_btn" class="btn btn-primary">Save</button>
					<button type="button" id="cancel_btn" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
var targetNameFlag = false;
var regDateFlag = false;

/* 유효성  */
$('input[name="targetName"]').on('blur', function(e){
	$(this).css({ borderColor : 'red' });
	var targetName = $(this).val();
	
	if(targetName == null || targetName == ''){
		$('#targetNameHelp').css({ color : 'red' });
		$('#targetNameHelp').html('사용처/수입처를 입력하지 않으셨습니다.');
		$(this).focus();
		return;
	}
	if(targetName.length > 75){
		$('#targetNameHelp').css({ color : 'red' });
		$('#targetNameHelp').html('사용처/수입처는 75자를 넘을 수 없습니다.');
		$(this).focus();
		return;
	}
	
	$(this).css({ borderColor : 'green' });
	targetNameFlag = true;
	/* 유효성 ajax */			
	
	verifyCheck();
});
// 사용처 유효성.end

//	예산 등록일
var regDate;
var regDateNumber;
$('input[name=regDate]').on('blur', function(e){
	if( $(this).val() == null || $(this).val() == '' ){
		$('span#regDate').css({ color : 'red', fontWeight : 'bold' });
		$('span#regDate').html('예산의 수입/지출 날짜를 입력해주세요.');
		$('input[name=regDate]').css({ borderColor : 'red'});
		return;
	}
	regDate = $(this).val().split("-");
	regDateNumber = parseInt(regDate[0]+(regDate[1])+regDate[2]);
	regDate = $(this).val();
	
	if( regDate == null || regDate == '' ){
		$(this).css({ borderColor : 'red'});
		$('span#startDateHelp').css({ color : 'red', fontWeight : 'bold' });
		$('span#startDateHelp').html('사용일을 비울 수 없습니다.');
		regDateFlag = false;
		return;
	}else{
		$(this).css({ borderColor : 'green'});
		$('span#regDateHelp').html('');
		regDateFlag = true;
	}
	
	verifyCheck();
});
//	예산 등록일 end

/* 버튼 */
$('#create_btn').on('click', function(e){
	if(!targetNameFlag){
		$('button#create_btn').prop('disabled', true);
		$('span#targetNameHelp').css({ color : 'red', fontWeight : 'bold' });
		$('span#targetNameHelp').html('');
		$('input[name=targetName]').css({ borderColor : 'red'});
		return;
	}
	if(!regDateFlag){
		$('button#create_btn').prop('disabled', true);
		$('span#regDateHelp').css({ color : 'red', fontWeight : 'bold' });
		$('span#regDateHelp').html('');
		$('input[name=regDate]').css({ borderColor : 'red'});
		return;
	}
	var json = {
			writer : $('input[name=writer]').val(),
			targetName : $('input[name=targetName]').val(),
			content : $('textarea[name=content]').val(),
			regDate : $('input[name=regDate]').val(),		
			price : $('input[name=price]').val(),
			depositYn : $('input[name=depositYn]:checked').val()
	}
	
	$.ajax({
		url : '<%=request.getContextPath()%>/project/finance/register',
		method : 'POST',
		data : JSON.stringify(json),
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"post"
		},
		success : function(data){
			alert('예산 내역이 등록되었습니다.');
			location.href="<%=request.getContextPath()%>/project/finance/list"
		},
		error : function(error) {
			alert('서버 내부오류가 발생했습니다. 자세한 사항은 관리자에게 문의바랍니다.');
		}
		});
});
	$('#cancel_btn').on('click', function(e) {
		close();
	});

	function verifyCheck() {
		if (!targetNameFlag) {
			$('button#create_btn').prop('disabled', true);
			$('span#targetNameHelp').css({ color : 'red', fontWeight : 'bold' });
			$('span#targetNameHelp').html('');
			$('input[name=targetName]').css({ borderColor : 'red'});
			return;
		}
		if (!regDateFlag) {
			$('button#create_btn').prop('disabled', true);
			$('span#regDateHelp').css({color : 'red',fontWeight : 'bold'});
			$('span#regDateHelp').html('');
			$('input[name=regDate]').css({borderColor : 'red'});
			return;
		}
		$('button#create_btn').prop('disabled', false);
	}
</script>
</body>
</html>

