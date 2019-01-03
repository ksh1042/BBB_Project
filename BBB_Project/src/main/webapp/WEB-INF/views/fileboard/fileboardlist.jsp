<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<head>
	<title>자료실</title>
<style>
button#searchBtn{	
	width:27px;
	height:27px;
	background-image:url('<%=request.getContextPath()%>/resources/dist/img/search.png');	
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
					<h3 class="box-title">자료실</h3>
				</div>
				<div class='box-body'>
					<ul>
						<li>
							<button id='newBtn' class="btn btn-primary" onclick="javascript:location.href='fileboardinsert';">자료 등록</button>
						</li>
						<li>
							<select name="searchType">
								<option value="" ${pageMaker.cri.searchType==null?'selected':'' }>
								------</option>
								<option value="t" ${pageMaker.cri.searchType eq 't'?'selected':'' }>
								제목</option>
								<option value="c" ${pageMaker.cri.searchType eq 'c'?'selected':'' }>
								내용</option>
								<option value="w" ${pageMaker.cri.searchType eq 'w'?'selected':'' }>
								작성자</option>
								
							</select>
							<input id="keyword"
								   name="keyword"
								   type="text" value="${cri.keyword}"/>
							<button id="searchBtn" ></button>
						</li>
					</ul>
				</div>
			</div>
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title"></h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
						<c:if test="${!empty list }">
						<c:forEach items="${list}" var="boardVO">

							<tr>
								<td>${boardVO.bNum}</td>
								<td><a
									href='fileboardread${pageMaker.makeSearch(pageMaker.cri.page) }&bNum=${boardVO.bNum}'>
										${boardVO.title}</a></td>
								<td>${boardVO.writer}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${boardVO.inDate}" /></td>
								<td><span class="badge bg-red">${boardVO.count }</span></td>
							</tr>

						</c:forEach>
						</c:if>
						<c:if test="${empty list }">
							<tr>
								<td style="text-align:center;" colspan="5">내용이 없습니다.</td>
							</tr>
						</c:if>

					</table>
				</div>
				<!-- /.box-body -->


				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination link">
 
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
								<li><a href="${pageMaker.endPage +1}">&raquo;</a></li>
							</c:if>

						</ul>
						
						
					</div>


				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>

<form id="jobForm">
  <input type='hidden' name="page" value="${pageMaker.cri.page}"/>
  <input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}"/>
  <input type='hidden' name="searchType" value="${cri.searchType}"/>
  <input type='hidden' name="keyword" value="${cri.keyword}"/>
</form>
	<!-- /.row -->
</section>
<!-- /.content -->

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
		
	$(".link li a").on("click", function(event){
		
		event.preventDefault(); 
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action","fileboardlist").attr("method", "get");		
		jobForm.submit();
	});
	
	$('#searchBtn').on('click',function(){
		self.location="fileboardlist"
					   +"${pageMaker.makeQuery(1)}"
					   +"&searchType="
					   +$("select option:selected").val()
					   +"&keyword="
					   +$('#keyword').val();
	});
	
	
	

</script>



</body>






