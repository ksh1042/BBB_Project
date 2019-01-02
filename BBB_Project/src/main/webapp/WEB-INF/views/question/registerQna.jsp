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
					<h3 class="box-title">REGISTER QnA</h3>
				</div>
				<!-- /.box-header -->

			<form role="form" method="post" action="registerQna">
				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label> 
						<input type="text" name='title' class="form-control" placeholder="Enter Title">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Content</label>
						<textarea id="content" class="form-control" name="content"  rows="3"
							placeholder="Enter ..."></textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Writer</label> 
						<input type="text" readonly
							name="writer" class="form-control" value="${loginUser.id }">
					</div>	
				</div>
				<!-- /.box-body -->
				
				<div class="box-footer">
					<ul class="mailbox-attachments clearfix uploadedList"></ul>	
					<button type="submit" class="btn btn-primary">Submit</button>
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

</body>








