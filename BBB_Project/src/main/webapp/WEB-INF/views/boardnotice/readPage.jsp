<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<body>

	<section class="content-header">
 		<h1>상세페이지</h1>
	</section>

    <!-- Main content -->
	<section class="content">
		<div class="row">
			<!-- left column -->
			<div class="col-md-12">
				<!-- general form elements -->
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">공지글 상세보기</h3>
					</div>
					<!-- /.box-header -->

					<form role="form" action="modifyPage" method="post">
						<input type='hidden' name='bNum' value="${board.bNum}"> 
						<input type='hidden' name='pjNum' value="${board.pjNum}"> 
						<input type='hidden' name='page' value="${cri.page}"> 
						<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					</form>

					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">제목</label> 
							<input type="text" name='title' class="form-control" value="${board.title}" readonly="readonly"> 
							<span class="glyphicon glyphicon-ok form-control-feedback" id="okIcon"></span>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">내용</label>
							<textarea class="form-control" name="content" rows="3" readonly="readonly">${board.content}</textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">작성자</label> 
							<input type="text" name="writer" class="form-control" value="${board.writer}" readonly="readonly">
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer" style="float: right;">
						<button type="submit" id="listBtn" class="btn btn-primary">취소</button>
						&nbsp;
						<sec:authorize access="hasAuthority('ROLE_USER')">
							<c:if test="${loginUser.id eq logonProject.creator }">
								<button type="submit" id="modifyBtn" class="btn btn-warning">수정</button>&nbsp;
	    <button type="submit" id="removeBtn" class="btn btn-danger">삭제</button>
							</c:if>
						</sec:authorize>

					</div>

					<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
					<script>


var formObj = $("form[role='form']");

console.log(formObj);

$("#modifyBtn").on("click", function(){
	formObj.attr("action", "modifyPage");
	formObj.attr("method", "get");		
	formObj.submit();
});

$("#removeBtn").on("click", function(){
	formObj.attr("action", "removePage");
	formObj.submit();
});

$("#listBtn").on("click", function(){
	formObj.attr("method", "get");
	formObj.attr("action", "listPage");
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
    </div><!-- /.content-wrapper -->
    
</body>
  