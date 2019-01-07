<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">공지사항 작성</h3>
				</div>
				<!-- /.box-header -->
<form role="form" method="post" action="register">
<table border="1">
		<div class="form-group">
			<label for="exampleInputEmail1">Title</label> 
			<input type="text" name="title" class="form-control" placeholder="Enter Title">
			<span class="help-block" id="titleHelp"></span>
			<span class="glyphicon glyphicon-pencil form-control-feedback" id="fNameIcon"></span>
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Content</label>
			<textarea class="form-control" name="content" rows="3"
				placeholder="Enter ..."></textarea>
		</div>
		<div class="form-group">
			<label for="control-label">INDATE</label> 
			<input class="form-control" type="date" name="inDate"/>
			<span class="help-block" id="inDateHelp"></span><br/>
		</div>
		<div class="form-group">
			<label for="control-lable">EXPIREDATE</label> 
			<input class="form-control" type="date" name="expireDate"/>
			<span class="help-block" id="expireDateHelp"></span> <br/>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">KIND</label>
			<select name="kind">
				<option value="3" selected>기본</option>
				<option value="0">이슈</option>
				<option value="1">이벤트</option>
				<option value="2">점검</option>
			</select> 
			
		</div>
	</div>
	<!-- /.box-body -->
	</table>

	<div class="box-footer">
		<button type="button" id="create_btn" class="btn btn-primary">Submit</button>
		<button type="button" id="list_btn" class="btn btn-primary">LIST</button>
		
	</div>
</form>

			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
var titleFlag = false;
var inDateFlag = false;
var expireDateFlag = false;

/* 유효성 검사*/

$('input[name="title"]').on('blur',function(e){
	$(this).css({borderColor : 'red'});
	var title = $(this).val();
	
	if(title == null || title == ''){
		$('#titleHelp').css({color:'red'});
		$('#titleHelp').html('제목을 입력하지 않으셨습니다.');
		$(this).focus();
		return;
	}
	if(title.length > 75){
		$('#titleHelp').css({color:'red'});
		$('#titleHelp').html('제목명은 75자를 넘을 수 없습니다.');
		$(this).focus();
		return;
	}else{
		$(this).css({ borderColor : 'green'});
		$('span#titleHelp').html('');
		titleFlag = true;
	}
	
	/* 유효성 ajax */
	
	verifyCheck();
	
});

//공지 시작일, 마감일 유효성처리
var inDate;
var expireDate;
var inDateNumber;
var expireDateNumber;
$('input[name=inDate]').on('blur',function(e){
	// alert($('input[name=inDate]').val());
	// alert(new Date().toISOString('yyyy-MM-dd').substr(0,10));
	if($(this).val() == null || $(this).val() == ''){
		$('span#inDate').css({color : 'red', fontWeight : 'bold'});
		$('span#inDate').html('공지 시작일을 입력해주세요.');
		$('input[name=inDate]').css({borderColor : 'red'});
		return;
	}
	inDate = $(this).val().split("-");
	inDateNumber = parseInt(inDate[0]+(inDate[1])+inDate[2]);
	inDate = $(this).val();
	
	if(inDate == null || inDate == ''){
		$(this).css({borderColor : 'red'});
		$('span#inDateHelp').css({ color : 'red', fontWeight : 'bold' });
		$('span#inDateHelp').html('공지 시작일보다 빠를 수 없습니다.');
		inDateFlag = false;
		return;
	}else{
		$(this).css({borderColor : 'green'});
		$('span#inDateHelp').html('');
		inDateFlag = true;
	}
	verifyCheck();
});

$('input[name=expireDate]').on('blur', function(e){
	if(inDate == null || inDate == '' ){
		$(this).val('');
		$('span#expireDateHelp').css({color : 'red', fontWeight : 'bold' });
		$('span#expireDateHelp').html('공지 시작일을 먼저 입력해주세요');
		$('input[name=inDate]').css({borderColor: 'red'});
		expireDateFlag = false;
		return;
	}
	if($(this).val() == null || $(this).val() == ''){
		$('span#expireDateHelp').css({ color : 'red', fontWeight : 'bold'});
		$('span#expireDateHepl').html('공지 마감일을 입력해주세요.');
		$('input[name=expireDate]').css({borderColor : 'red'});
		expireDateFlag = false;
		return;
	}
	expireDate = $(this).val().split('-');
	expireDateNumber = parseInt(expireDate[0]+(expireDate[1])+expireDate[2]);
	expireDate = $(this).val();
	
	if(expireDateNumber < inDateNumber){
		$('span#expireDateHelp').css({color : 'red', fontWeight : 'bold'});
		$('span#expireDateHelp').html('공지 마감일이 시작일보다 빠를 수 없습니다.');
		$('input[name=expireDate]').css({borderColor : 'red'});
		expireDateFlag = false;
		$(this).val('');
		return;
	} else{
		$('input[name=expireDate]').css({borderColor : 'green'});
		$('span#expireDateHelp').html('');
		expireDateFlag = true;
	}
	verifyCheck();
});
	//공지 시작일, 마감일 유효성 처리

/* 버튼 */
$('#create_btn').on('click',function(e){
	if(!titleFlag){
		$('button#create_btn').prop('disable',true);
		$('span#titleHelp').css({color:'red', fontWeight :'bold'});
		$('span#titleHelp').html('');
		$('input[name=title]').css({borderColor:'red'});
		return;
	}

	if(!inDateFlag){
		$('button#create_btn').prop('disable',true);
		$('span#inDateHelp').css({color:'red',fontWeight : 'bold'});
		$('span#inDateHelp').html('');
		$('input[name=inDate]').css({borderColor : 'red'});
		return;
	}	
	if(!expireDateFlag){
		$('button#create_btn').prop('disabled',true);
		$('span#expireDateHelp').css({color:'red',fontWeight : 'bold'});
		$('span#expireDateHelp').html('');
		$('input[name=expireDate]').css({borderColor : 'red'});
	}
	var json = {
			title : $('input[name="title"]').val(),
			content : $('textarea[name="content"]').val(),
			inDate : $('input[name="inDate"]').val(),
			expireDate : $('input[name="expireDate"]').val(),
			kind : $('select[name="kind"]').val()
	}
	
	$.ajax({
		url : '<%=request.getContextPath()%>/notice/register',
		method : 'POST',
		data : JSON.stringify(json),
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"post"
		},
		success : function(data){
			alert('공지글이 등록 되었습니다.');
			location.href="<%=request.getContextPath()%>/notice/listPage"
		},
		error : function(error) {
			alert('서버 내부오류가 발생했습니다. 자세한 사항은 관리자에게 문의 바랍니다.');
		}
		});
});
	
	$('#list_btn').on('click',function(e){
		close();
	});
	
	function verifyCheck() {
		if(!titleFlag) {
			$('button#create_btn').prop('disabled', true);
			$('span#titleHelp').css({
				color : 'red',
				fontWeight : 'bold'
			});
			$('span#titleHelp').html('');
			$('input[name=]').css({
				borderColor : 'red'
			});
			return;
		}
		
		if(!inDateFlag){
			$('button#create_btn').prop('disabled',true);
			$('span#inDateHelp').css({
				color:'red',
				fontWeight:'bold'
			});
			$('span#inDateHelp').html('');
			$('input[name=inDate]').css({
				borderColor : 'red'
			});
			return;
		}
		if(!expireDateFlag){
			$('button#create_btn').prop('disabled',true);
			$('span#expireDateHelp').css({
				color:'red',
				fontWeight:'bold'
			});
			$('span#expireDateHelp').html('');
			$('input[name=expireDate]').css({
				borderColor : 'red'
			});
			return;
			
		}
		$('button#create_btn').prop('disabled',false);
	}
	

</script>
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
</body>
