<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<body>

<section class="content-header">
		<h1>자료실</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath() %>/project/main?pjNum=${logonProject.pjNum}">
				<i class="fa fa-dashboard">&nbsp;&nbsp;&nbsp;${logonProject.name }</i></a></li>
			<li class="active">자료실</li>
		</ol>
</section>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-xs-12">
		
			<div class="box">
				<div class="box-header with-border">
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th class="hidden-xs">등록일</th>
							<th class="hidden-xs">조회수</th>
						</tr>
						<c:if test="${!empty list}">
						<c:forEach items="${list}" var="boardVO">
							<c:if test="${boardVO.kind ==2 }" >
							<tr>
								<td>${boardVO.bNum}</td>
								<td><a
									href='fileboardread${pageMaker.makeSearch(pageMaker.cri.page) }&bNum=${boardVO.bNum}'>
										${boardVO.title}</a></td>
								<td>${boardVO.writer}</td>
								<td class="hidden-xs"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${boardVO.inDate}" /></td>
								<td class="hidden-xs"><span class="badge bg-red">${boardVO.count }</span></td>
							</tr>
							</c:if>
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
								<li><a href="${pageMaker.startPage -1}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage}" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="${idx}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="${pageMaker.endPage+1}">&raquo;</a></li>
							</c:if>
								
						</ul>
						<button id='newBtn' style="float:right; margin-top:20px" class="btn btn-primary" onclick="javascript:location.href='fileboardinsert';">자료 등록</button>
						
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
  <input type='hidden' name="searchType" value="${pageMaker.cri.searchType}"/>
  <input type='hidden' name="keyword" value="${pageMaker.cri.keyword}"/>
</form>
	
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






