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
					<h3 class="box-title">MODIFY BOARD</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyPage" method="post">

					<input type='hidden' name='page' value="${cri.page}">
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
					
					<div class="box-body">

						<div class="form-group">
							<label for="exampleInputEmail1">BNO</label> 
							<input type="text" name='bNum' class="form-control" value="${board.bNum}"
								readonly="readonly">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">PROJECT NO</label> 
							<input type="text" name='pjNum' class="form-control" value="${board.pjNum}"
								readonly="readonly">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Title</label> 
							<input type="text" name='title' class="form-control" value="${board.title}">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Content</label>
							<textarea class="form-control" name="content" rows="3">${board.content}</textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Writer</label> 
							<input readonly	type="text" name="writer" class="form-control"
								value="${loginUser.id}">
						</div>
					</div>
					<!-- /.box-body -->
				</form>
				<div class="box-footer">
					<button type="submit" id="saveBtn" class="btn btn-warning">SAVE</button>
					<button type="submit" id="listBtn" class="btn btn-primary">CANCEL</button>
				</div>
				
				<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
				<script>
					var formObj = $("form[role='form']");

					console.log(formObj);

					$("#listBtn").on("click",function() {
						self.location = "listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
					});

					$("#saveBtn").on("click", function() {
						formObj.submit();
					});
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
