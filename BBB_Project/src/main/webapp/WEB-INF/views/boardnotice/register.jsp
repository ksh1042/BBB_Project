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
			<label for="exampleInputEmail1">제목</label> 
			<input type="text" name="title" class="form-control" placeholder="Enter Title">
			<span class="help-block" id="titleHelp"></span>
			<span class="glyphicon glyphicon-pencil form-control-feedback" id="fNameIcon"></span>
		</div>
		
		<div class="form-group">
			<label for="exampleInputPassword1">내용</label>
			<textarea class="form-control" name="content" rows="3"
				placeholder="Enter ..."></textarea>
		</div>
		
		<div class="form-group">
			<label for="exampleInputEmail1">작성자</label> 
			<input readonly	type="text" name="writer" class="form-control"
					value="${loginUser.id}">
		</div>
		
		<div class="form-group">
			<label for="control-label">공지일</label> 
			<input class="form-control" type="date" name="noticeDate"/>
			<span class="help-block" id="noticeDateHelp"></span><br/>
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
var noticeDateFlag = false;

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
var noticeDate;

var noticeDateNumber;

$('input[name=noticeDate]').on('blur',function(e){
	// alert($('input[name=noticeDate]').val());
	// alert(new Date().toISOString('yyyy-MM-dd').substr(0,10));
	if($(this).val() == null || $(this).val() == ''){
		$('span#noticeDate').css({color : 'red', fontWeight : 'bold'});
		$('span#noticeDate').html('공지일을 입력해주세요.');
		$('input[name=noticeDate]').css({borderColor : 'red'});
		return;
}else{
	$(this).css({borderColor : 'green'});
	$('span#noticeDateHelp').html('');
	noticeDateFlag = true;
}

	noticeDate = $(this).val().split("-");
	noticeDateNumber = parseInt(noticeDate[0]+(noticeDate[1])+noticeDate[2]);
	noticeDate = $(this).val();
	
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

	if(!noticeDateFlag){
		$('button#create_btn').prop('disable',true);
		$('span#noticeDateHelp').css({color:'red',fontWeight : 'bold'});
		$('span#noticeDateHelp').html('');
		$('input[name=inDate]').css({borderColor : 'red'});
		return;
	}	
	
	var json = {
			title : $('input[name="title"]').val(),
			content : $('textarea[name="content"]').val(),
			writer : $('input[name="writer"]').val(),
			noticeDate : $('input[name="noticeDate"]').val(),
	}
	
	$.ajax({
		url : '<%=request.getContextPath()%>/boardnotice/register',
		method : 'POST',
		data : JSON.stringify(json),
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"post"
		},
		success : function(data){
			alert('공지글이 등록 되었습니다.');
			location.href="<%=request.getContextPath()%>/boardnotice/listPage"
		},
		error : function(error) {
			alert('서버 내부오류가 발생했습니다. 자세한 사항은 관리자에게 문의 바랍니다.');
		}
		});
});
	
	$('#list_btn').on('click',function(e){
		location.href="<%=request.getContextPath()%>/boardnotice/listPage";
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
		
		if(!noticeDateFlag){
			$('button#create_btn').prop('disabled',true);
			$('span#noticeDateHelp').css({
				color:'red',
				fontWeight:'bold'
			});
			$('span#noticeDateHelp').html('');
			$('input[name=noticeDate]').css({
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
