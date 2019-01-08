<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<body>
<!-- Main content -->
<section class="content">
	<div class="modal fade" id="modal-newProject">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">REGISTER QnA</h3>
				</div>
				<!-- /.box-header -->

			<form role="form" method="post" action="registerQna">
				<div class="box-body">
					<div class="form-group">
						<label class="control-label">Title</label> 
						<input id="title" type="text" name="title" class="form-control" placeholder="Enter Title">
						<span class="help-block" id="titleHelp"></span> 
					</div>
					<div class="form-group">
						<label class="control-label">Content</label>
						<textarea id="content" class="form-control" name='content'  rows="3" placeholder="Enter Content"></textarea>
						<span class="help-block" id="contentHelp"></span> 
					</div>
					<div class="form-group">
						<label class="control-label">Writer</label> 
						<input type="text" readonly name="writer" class="form-control" value="${loginUser.id }">
					</div>	
				</div>
				<!-- /.box-body -->
				
				<div class="box-footer">
					
					<button type="submit" id="create_btn"class="btn btn-primary" onclick="alert('QnA 글이 등록되었습니다.');">Submit</button>
					<button type="button" class="btn btn-warning" onclick="history.go(-1);">Cancel</button>
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
var titleFlag = false;
var contentFlag = false;

/* 유효성  */
$("input[name='title']").on('blur', function(e){
	$(this).css({ borderColor : 'red' });
	var title = $(this).val();
	
	if(title == null || title == ''){
		$('#titleHelp').css({ color : 'red' });
		$('#titleHelp').html('제목을 입력하여야 합니다.');
		$(this).focus();
		return;
	}
	if(title.length > 75){
		$('#titleHelp').css({ color : 'red' });
		$('#titleHelp').html('제목은 75자를 넘을 수 없습니다.');
		$(this).focus();
		return;
	}
	
	$(this).css({ borderColor : 'green' });
	titleFlag = true;
			
	
	verifyCheck();
});

$('textarea[name="content"]').on('blur', function(e){
	$(this).css({ borderColor : 'red' });
	var content = $(this).val();
	
	if(content == null || content == ''){
		$('#contentHelp').css({ color : 'red' });
		$('#contentHelp').html('내용을 입력하셔야 합니다.');
		$(this).focus();
		return;
	}
	if(content.length > 700){
		$('#contentHelp').css({ color : 'red' });
		$('#contentHelp').html('내용은 700자를 넘을 수 없습니다.');
		$(this).focus();
		return;
	}
	
	$(this).css({ borderColor : 'green' });
	contentFlag = true;
		
	
	verifyCheck();
});
// Title, content 유효성 끝

/* 버튼 */
$('#create_btn').on('click', function(e){
	if(!titleFlag){
		$('button#create_btn').prop('disabled', true);
		$('span#titleHelp').css({ color : 'red', fontWeight : 'bold' });
		$('span#titleHelp').html('');
		$('input[name="title"]').css({ borderColor : 'red'});
		return;
	}
	if(!contentFlag){
		$('button#create_btn').prop('disabled', true);
		$('span#contentHelp').css({ color : 'red', fontWeight : 'bold' });
		$('span#contentHelp').html('');
		$('textarea[name="content"]').css({ borderColor : 'red'});
		return;
	}
		
});

	function verifyCheck() {
		if (!titleFlag) {
			$('button#create_btn').prop('disabled', true);
			$('span#titleHelp').css({ color : 'red', fontWeight : 'bold' });
			$('span#titleHelp').html('');
			$('input[name="title"]').css({ borderColor : 'red'});
			return;
		}
		if (!contentFlag) {
			$('button#create_btn').prop('disabled', true);
			$('span#contentHelp').css({color : 'red',fontWeight : 'bold'});
			$('span#contentHelp').html('');
			$('textarea[name="content"]').css({borderColor : 'red'});
			return;
		}
		$('button#create_btn').prop('disabled', false);
		
	}
</script> 
</body>








