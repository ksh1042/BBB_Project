<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<head>
<meta charset="UTF-8">
<title>프로젝트 생성</title>
<style>
	duv.wrapperAddProject {
		width : 100%;
		position : absolute;
	}
	div.addProjectDiv {
		width : 70%;
		margin-left : auto;
		margin-right : auto;
		display : block;
	}
 </style>
</head>
<body>
	<div class="wrapperAddProject">
		<div class="addProjectDiv">
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0 text-dark">프로젝트 생성</h1>
						</div>
					</div>
				</div>
			</section>
			<br />
			<section class="content">
				<div class="form-group has-feedback col-md-9" style="margin">
					<form action="" method="POST">			
						<input type="hidden" name="creator" value="${ loginUser.name }">
						<label class="control-label">프로젝트 이름</label>
						<input class="form-control " type="text" name="name" placeholder="프로젝트 이름">
						<span class="help-block" id="pNameHelp"><i class=""></i></span>
						<span class="glyphicon glyphicon-pencil form-control-feedback" id="pjNameIcon"></span><br/>
						<label class="control-label">프로젝트 설명</label>
						<textarea class="form-control" style="resize:none;" rows="10" placeholder="프로젝트 설명" name ="disc"></textarea><br/>
						<label class="control-label">공개</label><input type="radio" name="visibility" value="0" checked>
						<label class="control-label">비공개</label><input type="radio" name="visibility" value="1"><br/><br/>
						
						<!-- 프로젝트 기간  -->
						<div class="box">
					        <div class="box-header with-border">
						    	<h3 class="box-title">프로젝트 기간</h3>
								<div class="box-tools pull-right">
						            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
						            <i class="fa fa-minus"></i></button>
						        </div>
						    </div>
						    <div class="box-body">
						    	<label class="control-label">시작일</label>
						    	<input class="form-control" type="date" name="startDate">
						    	<span class="help-block" id="startDateHelp"><i class=""></i></span> <br/>
						    	<label class="control-label">마감일</label>
						    	<input class="form-control" type="date" name="endDate">
						    	<span class="help-block" id="endDateHelp"><i class=""></i></span> <br/>
						    </div>
						    <div class="box-footer">
						     	tip) 프로젝트 시작일, 마감일을 입력해보세요.
						    </div>
				    	</div>
					</form>
					<!-- 프로젝트 기간.end -->
					<button type="button" id="create_btn" class="btn btn-block btn-success btn-lg" disabled>생성</button>
					<button type="button" id="cancel_btn" class="btn btn-block btn-danger btn-lg">취소</button>
				</div>
					
			</section>
		</div>
	</div>
	
	
	<!-- content.end -->
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		var pNameFlag = false;
		var startDateFlag = false;
		var endDateFlag = false;
		/* 유효성  */
		$('input[name="name"]').on('blur', function(e){
			$(this).css({ borderColor : 'red' });
			var pName = $(this).val();
			
			if(pName == null || pName == ''){
				$('#pNameHelp').css({ color : 'red' });
				$('#pNameHelp').html('프로젝트명을 입력하지 않으셨습니다.');
				$(this).focus();
				return;
			}
			if(pName.length > 75){
				$('#pNameHelp').css({ color : 'red' });
				$('#pNameHelp').html('프로젝트명은 75자를 넘을 수 없습니다.');
				$(this).focus();
				return;
			}
			/* 유효성 ajax */			
			$.ajax({
				url : '<%=request.getContextPath()%>/verify/pName/'+pName,
				type : 'GET',
				success : function(data){
					if(data=='OK'){
						$('input[name="name"]').css({ borderColor : 'green' });
						$('#pNameHelp').css({ color : 'green', fontWeight : 'bold' });
						$('#pNameHelp').html('사용 가능한 프로젝트명입니다.');
						$('span#pjNameIcon').removeClass('glyphicon-ok');
						$('span#pjNameIcon').removeClass('glyphicon-pencil');
						$('span#pjNameIcon').addClass('glyphicon-ok');
						
						pNameFlag = true;
					}
					if(data=='OVERLAPED'){
						$('#pNameHelp').css({ color : 'red' });
						$('#pNameHelp').html('이미 사용중인 프로젝트 이름입니다');
						$('span#pjNameIcon').removeClass('glyphicon-ok');
						$('span#pjNameIcon').removeClass('glyphicon-pencil');
						$('span#pjNameIcon').addClass('glyphicon-pencil');
						pNameFlag = false;
						$('input[name="name"]').focus();
					}
				},
				error : function(error){
					alert('전송 중 에러가 발생했습니다. 자세한 사항은 관리자에게 문의 바랍니다.');
				}
			});
			/* 유효성 ajax.end */
			
			verifyCheck();
		});
		// 프로젝트명 유효성.end
		
		//	프로젝트 시작일, 마감일 유효성 
		var startDate;
		var endDate;
		var startDateNumber;
		var endDateNumber;
		$('input[name=startDate]').on('blur', function(e){
			//	alert($('input[name=startDate]').val());
			// alert(new Date().toISOString('yyyy-MM-dd').substr(0,10));
			if( $(this).val() == null || $(this).val() == '' ){
				$('span#startDate').css({ color : 'red', fontWeight : 'bold' });
				$('span#startDate').html('프로젝트 시작일을 입력해주세요.');
				$('input[name=startDate]').css({ borderColor : 'red'});
				return;
			}
			startDate = $(this).val().split("-");
			startDateNumber = parseInt(startDate[0]+(startDate[1])+startDate[2]);
			startDate = $(this).val();
			
			if( startDate == null || startDate == '' ){
				$(this).css({ borderColor : 'red'});
				$('span#startDateHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#startDateHelp').html('프로젝트 생성일보다 빠를 수 없습니다');
				startDateFlag = false;
				return;
			}else{
				$(this).css({ borderColor : 'green'});
				$('span#startDateHelp').html('');
				startDateFlag = true;
			}
			verifyCheck();
		});
		$('input[name=endDate]').on('blur', function(e){
			if( startDate == null || startDate=='' ){
				$(this).val('');
				$('span#endDateHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#endDateHelp').html('프로젝트 시작일을 먼저 입력해주세요');
				$('input[name=startDate]').css({ borderColor : 'red'});
				endDateFlag = false;
				return;
			}
			if( $(this).val() == null || $(this).val() == '' ){
				$('span#endDateHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#endDateHelp').html('프로젝트 마감일을 입력해주세요.');
				$('input[name=endDate]').css({ borderColor : 'red'});
				endDateFlag = false;
				return;
			}
			endDate = $(this).val().split('-');
			endDateNumber = parseInt(endDate[0]+(endDate[1])+endDate[2]);
			endDate = $(this).val();
			
			if( endDateNumber < startDateNumber ){
				$('span#endDateHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#endDateHelp').html('프로젝트 마감일이 시작일보다 빠를 수 없습니다.');
				$('input[name=endDate]').css({ borderColor : 'red'});
				endDateFlag = false;
				$(this).val('');
				return;
			} else {
				$('input[name=endDate]').css({ borderColor : 'green'});
				$('span#endDateHelp').html('');
				endDateFlag = true;
			}
			verifyCheck();
		});
		//	프로젝트 시작일, 마감일 유효성.end
		
		/* 버튼 */
		$('#create_btn').on('click', function(e){
			if(!pNameFlag){
				$('button#create_btn').prop('disabled', true);
				$('span#pNameHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#pNameHelp').html('');
				$('input[name=name]').css({ borderColor : 'red'});
				return;
			}
			if(!startDateFlag){
				$('button#create_btn').prop('disabled', true);
				$('span#startDateHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#startDateHelp').html('');
				$('input[name=startDate]').css({ borderColor : 'red'});
				return;
			}
			if(!endDateFlag){
				$('button#create_btn').prop('disabled', true);
				$('span#endDateHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#endDateHelp').html('');
				$('input[name=endDate]').css({ borderColor : 'red'});
				return;
			}
			var json = {
					name : $('input[name=name]').val(),
					disc : $('textarea[name=disc]').val(),
					visibility : $('input[name=visibility]:checked').val(),
					startDate : $('input[name=startDate]').val(),
					endDate : $('input[name=endDate]').val()
			}
			
			$.ajax({
				url : '<%=request.getContextPath()%>/main/addProject',
				method : 'POST',
				data : JSON.stringify(json),
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"post"
				},
				success : function(data){
					alert('프로젝트가 생성되었습니다.');
					location.href="<%= request.getContextPath()%>/main/myPartakeList"
				},
				error : function(error){
					alert('서버 내부오류가 발생했습니다. 자세한 사항은 관리자에게 문의바랍니다.');
				}
			});
		});
		$('#cancel_btn').on('click', function(e){
			history.go(-1);
		});
		
		function verifyCheck(){
			if(!pNameFlag){
				$('button#create_btn').prop('disabled', true);
				$('span#pNameHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#pNameHelp').html('');
				$('input[name=name]').css({ borderColor : 'red'});
				return;
			}
			if(!startDateFlag){
				$('button#create_btn').prop('disabled', true);
				$('span#startDateHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#startDateHelp').html('');
				$('input[name=startDate]').css({ borderColor : 'red'});
				return;
			}
			if(!endDateFlag){
				$('button#create_btn').prop('disabled', true);
				$('span#endDateHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#endDateHelp').html('');
				$('input[name=endDate]').css({ borderColor : 'red'});
				return;
			}
			$('button#create_btn').prop('disabled', false);
		}
		
	</script>
</body>