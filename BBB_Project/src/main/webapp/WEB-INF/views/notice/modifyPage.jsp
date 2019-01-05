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
					<h3 class="box-title">MODIFY NOTICE</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyPage" method="post">

					<input type='hidden' name='page' value="${cri.page}">
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
					
					<div class="box-body">

						<div class="form-group">
							<label for="exampleInputEmail1">NNO</label> 
							<input type="text" name='nNum' class="form-control" value="${notice.nNum}"
								readonly="readonly">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Title</label> 
							<input type="text" name='title' class="form-control" value="${notice.title}">
							<span class="help-block" id="titleHelp"></span>
							<span class="glyphicon glyphicon-pencil form-control-feedback" id="fNameIcon"></span>
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">Content</label>
							<textarea class="form-control" name="content" rows="3">${notice.content}</textarea>
						</div>
					</div>
					<!-- /.box-body -->
				</form>
				<div class="box-footer">
					<button type="submit" id="saveBtn" class="btn btn-warning">SAVE</button>
					<button type="submit" id="cancelBtn" class="btn btn-primary">CANCEL</button>
				</div>
				
				<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
				<script>
					var titleFlag = false;
					
					$('input[name="title"]').on('blur',function(e){
						$(this).css({borderColor : 'red'});
						var title = $(this).val();
						
						if(title == null || title == ''){
							$('#titleHelp').css({color:'red'});
							$('#titleHelp').html('제목을 입력하세요.');
							$(this).focus();
							return;
						}
						if(title.length > 20){
							$('#titleHelp').css({color:'red'});
							$('#titleHelp').html('제목은 20자를 넘지 않습니다.');
							$(this).focus();
							return;
						}else{
							$(this).css({borderColor : 'green'});
							$('span#titleHelp').html('');
							titleFlag = true;
						}
						
						verifyCheck();
					});
					
				
					var formObj = $("form[role='form']");

					console.log(formObj);

					$("#cancelBtn").on("click",function() {
						self.location = "listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
					});

					$("#saveBtn").on("click", function() {
						if(!titleFlag){
							$('button#saveBtn').prop('disable',true);
							$('span#titleHelp').css({color:'red',fontWeight:'bold'});
							$('span#titleHelp').html('');
							$('input[name=title]').css({borderColor:'red'});
							return;
						}
						formObj.submit();
					});
					
					function verifyCheck(){
						if(!titleFlag){
							$('button#saveBtn').prop('disabled',true);
							$('span#titleHelp').css({
								color:'red',
								fontWeight:'bold'
							});
							$('span#titleHelp').html('');
							$('input[name=]').css({
								borderColor : 'red'
							});
							return;
						}
						$('button#saveBtn').prop('disabled',false);
					}
					
				</script>




			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

</body>