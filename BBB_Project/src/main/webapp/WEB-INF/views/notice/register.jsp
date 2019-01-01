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
					<h3 class="box-title">REGISTER BOARD</h3>
				</div>
				<!-- /.box-header -->
<form role="form" method="post" action="register">
<table border="1">
		<div class="form-group">
			<label for="exampleInputEmail1">Title</label> 
			<input type="text"
				name='title' class="form-control" placeholder="Enter Title">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Content</label>
			<textarea class="form-control" name="content" rows="3"
				placeholder="Enter ..."></textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">INDATE</label> 
			<input type="date" pattern="yyyy-MM-dd" value="${notice.indate}"/>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">EXPIREDATE</label> 
			<input type="date" pattern="yyyy-MM-dd" value="${notice.expireDate}"/>
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
		<button type="submit" class="btn btn-primary">Submit</button>
		
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
<!-- /.content-wrapper -->
</body>
