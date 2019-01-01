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
<table border="1">
		
		<div class="form-group">
			<label for="exampleInputEmail1">PROJECT NO</label> 
			<input type="text"
				name='pjNum' class="form-control" placeholder="Project 번호를 입력해주세요">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">Titlbe</label> 
			<input type="text"
				name='title' class="form-control" placeholder="Enter Title">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Content</label>
			<textarea class="form-control" name="content" rows="3"
				placeholder="Enter ..."></textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">Writer</label> 
			<input type="text" readonly="readonly" value="${loginUser.id }"
				name="writer" class="form-control" placeholder="Enter Writer">
		</div>
	</div>
	<!-- /.box-body -->
	</table>

	<div class="box-footer">
		<button type="submit" class="btn btn-primary">Submit</button>&nbsp;
		<button type="submit" id="listBtn" class="btn btn-primary">LIST</button>
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
</div>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
var formObj = $("form[role='form']");

console.log(formObj);

$("#listBtn").on("click", function(){
	formObj.attr("method", "get");
	formObj.attr("action", "listPage");
	formObj.submit();
});
</script>
<!-- /.content-wrapper -->

</body>
