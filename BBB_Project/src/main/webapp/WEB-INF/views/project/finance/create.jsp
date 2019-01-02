<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<body>
<!-- Main content -->
<section class="content">


	<!-- Application buttons -->
	<div class="box">
		<div class="box-header">
			<h3 class="box-title">예산관리 생성</h3>
		</div>
	<form id="frm" method="POST" action="create">
	<input type="hidden" name="pjNum" value="${ logonProject.pjNum }">
		<div class="box-body">
			<button class="btn btn-app" onclick="submit_go();">
				<i class="fa fa-barcode" ></i> Create Finance
			</button>
		</div>
	</form>
	<!-- /.box-body -->
	</div>

</section>
<!-- /.content -->
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		function submit_go(){
			$('#frm').submit();
		}
	</script>
</body>