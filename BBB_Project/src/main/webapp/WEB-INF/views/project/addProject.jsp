<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<head>
<meta charset="UTF-8">
<title>프로젝트 생성</title>
</head>
<body>
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">프로젝트 생성</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-left">
						<li class="breadcrumb-item">
							
						</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
		</div>
	</div>
	<br />
	<div class="content">
		<div class="form-group has-feedback col-md-9" style="margin">
			<form action="" method="POST">			
				<%-- <input type="hidden" name="creator" value="${ loginUser.name }"> --%>
				<label class="control-label">프로젝트 이름</label>
				<input class="form-control " type="text" name="name" placeholder="프로젝트 이름">
				<span class="help-block" id="pNameHelp"><i class=""></i></span>
				<span class="glyphicon glyphicon-pencil form-control-feedback"></span><br/>
				<label class="control-label">프로젝트 설명</label>
				<textarea class="form-control" style="resize:none;" rows="10" placeholder="프로젝트 설명"></textarea><br/>
				<label class="control-label">공개</label><input type="radio" name="visibility" checked="checked">
				<label class="control-label">비공개</label><input type="radio" name="visibility"><br/><br/>
				
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
				    	<input class="form-control" type="date" name="startDate"> <br/>
				    	<label class="control-label">종료일</label>
				    	<input class="form-control" type="date" name="endDate"> <br/>
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
			
	</div>
	
	<!-- content.end -->
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
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
			
			$.ajax({
				
			});
			$(this).css({ borderColor : 'green' });
			$('#pNameHelp').css({ color : 'green'; fontWeight : 'bold' });
			$('#pNameHelp').html('사용 가능한 프로젝트명입니다.');
		});
		/* 버튼 */
		$('#create_btn').on('click', function(e){
			
		});
		$('#cancel_btn').on('click', function(e){
			history.go(-1);
		});
	</script>
</body>