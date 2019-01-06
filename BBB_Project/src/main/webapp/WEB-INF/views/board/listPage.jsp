<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<head>
	<title>자유게시판</title>
<style>
button#searchBtn{	
	width:27px;
	height:27px;	
	background-position:center;
	background-size:contain;	
	background-color:white;	
	box-sizing:border-box;
	padding:6px;
	 
}
.box-body ul{
	list-style:none;
	overflow:hidden;
}
.box-body ul li{
	height:40px;
	line-height:20px;
}
.box-body ul li:nth-child(1){
	float:left;
}
.box-body ul li:nth-child(2){
	float:right;
}
.box-body ul li:nth-child(2)>input{
	width:300px;
}

</style>
</head>

<body>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">게시판리스트</h3>
				</div>
				<div class='box-body'>
					<ul>
						<li>
							<div></div>	
						</li>
						<li>
<<<<<<< HEAD
							<form action="listPage" >
=======
						<form action="listPage">
						 <span class="glyphicon glyphicon-th-list form-control-feedback" id="listIcon"></span>
>>>>>>> refs/remotes/origin/choi2
							<select name="searchType">
								<option value="" ${cri.searchType==null?'selected':'' }>
								------</option>
								<option value="t" ${cri.searchType eq 't'?'selected':'' }>
								Title</option>
								<option value="w" ${cri.searchType eq 'w'?'selected':'' }>
								Writer</option>
							</select>
<<<<<<< HEAD
							<input id="keywordInput" name="keyword" type="text"  value="${pageMaker.cri.keyword}"/>
							<button id="searchBtn" ></button>
							</form>
=======
							<input id="keywordInput"
								   name="keyword"
								   type="text"  value="${pageMaker.cri.keyword}"/>
							<button id="searchBtn" type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
						</form>
>>>>>>> refs/remotes/origin/choi2
						</li>
					</ul>
				</div>
			</div>
			<div class="box">
				<div class="box-header with-border">
					
					<h3 class="box-title">LIST PAGING</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered" border="1">
						<tr>
							<th style="width: 10px; text-align: center";>BNO</th>
							<th style="text-align: center";>TITLE</th>
							<th style="text-align: center";>WRITER</th>
							<th style="text-align: center";>INDATE</th>
							<th style="text-align: center";>UPDATE DATE</th>
							<th style="width: 40px; text-align: center";>COUNT</th>
					</tr>
						<c:if test="${!empty boardList }">
						<c:forEach items="${boardList}" var="board">

							<tr>
								<td style="text-align: center";>${board.bNum}</td>
								<td style="text-align: center";><a
									href='readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bNum=${board.bNum}'>
										${board.title}</a></td>
								<td style="text-align: center";>${board.writer}</td>
								<td style="text-align: center";><fmt:formatDate pattern="yyyy-MM-dd"
										value="${board.inDate}" /></td>
								<td style="text-align: center";><fmt:formatDate pattern="yyyy-MM-dd"
										value="${board.updateDate}" /></td>
								<td style="text-align: center";><span class="badge bg-red">${board.count }</span></td>
							</tr>

						</c:forEach>
						</c:if>
						<c:if test="${empty boardList }">
							<tr>
								<td style="text-align:center;" colspan="7">내용이 없습니다.</td>
							</tr>
						</c:if>
						
					</table>
				</div>
				<!-- /.box-body -->


				<div class="box-footer">
					<div style="float:right";>
					<button id='newBtn' class="btn btn-primary" onclick="javascript:location.href='register';" >New Board</button>
					</div>
					<div class="text-center">
						<ul class="pagination link pagination-sm no-margin pull-right">
 
							<c:if test="${pageMaker.prev}">
								<li><a href="${pageMaker.startPage - 1}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="${idx}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="${pageMaker.endPage +1}">&raquo;</a></li>
							</c:if>

						</ul>
						
						
					</div>


				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<form id="jobForm">
  <input type='hidden' name="page" value="${pageMaker.cri.page}"/>
  <input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}"/>
  <input type='hidden' name="searchType" value="${cri.searchType}"/>
  <input type='hidden' name="keyword" value="${cri.keyword}"/>
</form>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
		
	$(".link li a").on("click", function(event){
		event.preventDefault(); 
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action","listPage").attr("method", "get");		
		jobForm.submit();
		
	});
	
	$('#searchBtn').on('click',function(){
		self.location="listPage"
					   +"${pageMaker.makeQuery(1)}"
					   +"&searchType="
					   +$("select option:selected").val()
					   +"&keyword="
					   +$('#keywordInput').val();
	});
</script>



</body>








