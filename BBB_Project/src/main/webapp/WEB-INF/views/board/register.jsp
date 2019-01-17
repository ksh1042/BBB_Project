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
					<h3 class="box-title">게시글 작성</h3>
				</div>
				<!-- /.box-header -->
				<form role="form" method="post" action="register">
					<div class="box-body" >
						<input type="hidden" name='pjNum' value="${logonProject.pjNum }" class="form-control">
						
						<div class="form-group">
							<label for="exampleInputEmail1">제목</label> 
							<input type="text" name='title' class="form-control" placeholder="제목을 입력하세요..">
							<span class="help-block" id="titleHelp"></span>
							<span class="glyphicon glyphicon-pencil form-control-feedback" id="fNameIcon"></span>
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">내용</label>
							<textarea class="form-control" id="content" name="content" rows="3"
								placeholder="내용을 입력하세요.."></textarea>
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">작성자</label> 
							<input type="text" readonly="readonly" value="${loginUser.id }"
								name="writer" class="form-control">
						</div>
					</div>
				
	<!-- /.box-body -->

					<div class="box-footer">
						<button type="button" id="create_btn" class="btn btn-primary">등록</button>&nbsp;
						<button type="button" id="list_btn" class="btn btn-primary">취소</button>
					</div>

			</form>

			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script>
var pjNumFlag = false;
var titleFlag = false;

/* 유효성검사 */

$('input[name="title"]').on('blur',function(e){
	$(this).css({borderColor : 'red'});
	var title = $(this).val();
	
	if(title == null || title == ''){
		$('#titleHelp').css({color:'red'});
		$('#titleHelp').html('제목을 입력하지 않으셨습니다.');
		$(this).focus();
		return;
	}
	if(title.length > 20){
		$('#titleHelp').css({color:'red'});
		$('#titleHelp').html('제목명은 20자를 넘을 수 없습니다.');
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

/* 버튼 */
$('#create_btn').on('click',function(e){
	if(!titleFlag){
		$('button#create_btn').prop('disable',true);
		$('span#titleHelp').css({color:'red', fontWeight :'bold'});
		$('span#titleHelp').html('');
		$('input[name=title]').css({borderColor:'red'});
		return;
	}
	
	var json = {
			pjNum : $('input[name="pjNum"]').val(),
			title : $('input[name="title"]').val(),
			content : $('textarea[name="content"]').val(),
			writer : $('input[name="writer"]').val()
	}
	
	$.ajax({
		url : '<%=request.getContextPath()%>/board/register',
		method : 'POST',
		data : JSON.stringify(json),
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"post"
		},
		success : function(data){
			alert('게시글이 등록 되었습니다.');
			location.href="<%=request.getContextPath()%>/board/listPage"
		},
		error : function(error) {
			alert('서버 내부오류가 발생했습니다. 자세한 사항은 관리자에게 문의 바랍니다.');
		}
		});
});


$('#list_btn').on('click', function(){
	location.href="<%=request.getContextPath()%>/board/listPage"
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
	$('button#create_btn').prop('disabled',false);
}
</script>
<!-- /.content-wrapper -->

</body>
