<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>


<head>
	<title>자유게시판</title>
</head>

<body>
<!-- Main content -->
<!-- Content Header (Page header) -->
<section class="content-header">
  <h1>
   자유게시판
  </h1>
</section>

<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST ALL PAGE</h3>
				</div>
				<div class="box-body">
				
<table class="table table-bordered">
	<tr>
		<th style="width: 10px">BNO</th>
		<th>PROJECT NO</th>
		<th>TITLE</th>
		<th>WRITER</th>
		<th>INDATE</th>
		<th>UPDATE DATE</th>
		<th style="width: 40px">COUNT</th>
	</tr>


<c:forEach items="${list}" var="board">

	<tr>
		<td>${board.bno}</td>
		<td>${board.pjNum }</td>
		<td><a href='read?bnum=${board.bNum}'>
		${board.title}</a></td>
		<td>${board.writer}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd"
				value="${board.indate}" /></td>
		<td><fmt:formatDate pattern="yyyy-MM-dd"
				value="${board.updateDate}" /></td>
		<td><span class="badge bg-red">${board.viewcnt }</span>
		</td>
	</tr>

</c:forEach>

</table>

				</div>
				<!-- /.box-body -->
				<div class="box-footer">Footer</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->


<script>
    
    var result = '${msg}';
    
    if(result == 'SUCCESS'){
    	alert("처리가 완료되었습니다.");
    }
    
    </script>
</body>

