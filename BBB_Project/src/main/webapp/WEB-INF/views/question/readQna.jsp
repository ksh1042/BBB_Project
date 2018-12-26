<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<body>

<style>
a#modifyReplyBtn{
	color:white;
	width:40px;
	height:20px;
	padding:2px;
	font-size:10px;
}
</style>


<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">READ QnA</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyQna" method="post">
					<input type='hidden' name='qaNum' value="${qna.qaNum}"> 
					<input type='hidden' name='page' value="${cri.page}"> 
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
				</form>

				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label> 
						<input type="text" name='title' class="form-control" value="${qna.title}" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Content</label>
						<textarea class="form-control" name="content" rows="3" readonly="readonly">${qna.content}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Writer</label> 
						<input type="text" name="writer" class="form-control" value="${qna.writer}" readonly="readonly">
					</div>
				</div>
				<!-- /.box-body -->
			</div>
		</div>
	</div>
				
				
	<div class="box-footer">
		<sec:authorize access="hasAuthority('ROLE_USER')">
			<c:if test="${loginUser.id eq qna.writer }">
			<button type="submit" class="btn btn-warning" id="modifyBtn">Modify</button>
			<button type="submit" class="btn btn-danger"  id="removeBtn">REMOVE</button>
			</c:if>
		</sec:authorize>
		<button type="button" class="btn btn-warning" onclick="list_go();">QnAList</button>
	</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.js"></script>		
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function() {
		formObj.attr("action", "modifyQna");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
	$("#removeBtn").on("click", function() {
		
		var flag = confirm("삭제하시겠습니까?");
		if(flag){
		formObj.attr("action", "removeQna");
		formObj.attr("method", "post");
		formObj.submit();	
		}
	});
	
	function list_go(){
		location.href="<%=request.getContextPath()%>/question/listQna";
	}
</script>

<div class="row">
	<div class="col-md-12">
		<div class="box box-success">
			<div class="box-header">
				<h3 class="box-title">QnA 답변</h3>
			</div>
			<sec:authorize access="hasAuthority('ROLE_ADMIN')">
			<div class="box-body">
				<label for="exampleInputEmail1">Writer</label>
				<input readonly value="관리자" class="form-control" type="text" placeholder="USER ID" id="newReplyWriter"> 
				<label for="exampleInputEmail1">Reply Text</label>
				<input class="form-control" type="text"	placeholder="REPLY TEXT" id="newReplyContent">
			</div>
			<div class="box-footer">
				<button type="button" class="btn btn-primary" id="replyAddBtn">ADD REPLY</button>
			</div>
			</sec:authorize>
			<!-- /.box-body -->
				
			
		</div>


		<!-- The time line -->
		<ul class="timeline">
			<!-- timeline time label -->
			<li class="time-label" id="repliesDiv">
				<span class="bg-green">Replies List </span>
			</li>
		</ul>

		<div class='text-center'>
			<ul id="pagination" class="pagination pagination-sm no-margin ">
			</ul>
		</div>

	</div>
	<!-- /.col -->
</div>
<!-- /.row -->
	
<!-- Modal -->
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title"></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="rContent" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>      
</section>
<!-- /.content -->

<%@ include file="/WEB-INF/views/question/replyQna.jsp" %>

</body>














