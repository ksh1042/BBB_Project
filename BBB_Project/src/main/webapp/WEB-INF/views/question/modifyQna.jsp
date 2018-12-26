<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">MODIFY QnA</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyQna" method="post">
					<input type='hidden' name='page' value="${cri.page}"> 
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
	
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">등록번호</label> 
							<input type="text" name='qaNum' class="form-control" value="${qna.qaNum}" readonly="readonly">
						</div>
	
						<div class="form-group">
							<label for="exampleInputEmail1">Title</label> 
							<input type="text" name='title' class="form-control" value="${qna.title}">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Content</label>
							<textarea class="form-control" name="content" rows="3">${qna.content}</textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Writer</label> 
							<input readonly type="text" name="writer" class="form-control" value="${qna.writer}">
						</div>				
					</div>
					<!-- /.box-body -->
					
				</form>
				<div class="box-footer">
				
					<ul class="mailbox-attachments clearfix uploadedList"></ul>
					<button type="submit" class="btn btn-warning">SAVE</button>
					<button type="submit" class="btn btn-primary">CANCEL</button>
				</div>

			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->
	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.js"></script>		
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script>
$(document).ready(function(){
	var formObj = $("form[role='form']");

	console.log(formObj);

	$(".btn-primary").on("click",function() {
		history.go(-1);
	});

	$(".btn-warning").on("click",function() {
		var flag = confirm("수정하시겠습니까?");
		if(flag){
		formObj.submit();
		}
	});
});
</script>
</body>












