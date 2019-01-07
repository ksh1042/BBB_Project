<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<body>

<section class="content-header">
		<h1>관리자게시판</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/admin/mainForm">
				<i class="fa fa-dashboard"></i>main</a>
			</li>
			<li class="active">관리자게시판</li>
		</ol>
</section>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title"></h3>
					<div class="box-tools">
						<div class="input-group input-group-sm" >
							<div>
								<form action="listPage">
									<select name="searchType">
										<option value="" ${cri.searchType==null?'selected':'' }>------</option>
										<option value="t" ${cri.searchType eq 't'?'selected':'' }>제목</option>
									</select>
									<input id="keywordInput" name="keyword" type="text"  value="${pageMaker.cri.keyword}"/>
									<button type="submit" ><i class="fa fa-search"></i></button>
								</form>
							</div>
							<hr/>
						</div>
					</div>
				</div>
				<div class="box-body">
					<table class="table table-bordered" border="1">
						<tr background="blue">
							<th style="text-align: center;" width="20px" background="blue">번호</th>
							<th style="text-align: center;" width="50px" background="blue">제목</th>
							<th style="text-align: center;" width="50px" background="blue">등록일</th>
							<th class="hidden-xs" style="text-align: center;" width="50px" background="blue">완료일</th>
							<th class="hidden-xs" style="text-align: center;" width="20px" background="blue">글종류</th>
						</tr>
						<c:if test="${!empty noticeList }">
						<c:forEach items="${noticeList}" var="notice">
							<tr>
								<td style="text-align: center;"width="20px">${notice.nNum}</td>
								<td style="text-align: center;" width="50px">
								<a href='readPage${pageMaker.makeSearch(pageMaker.cri.page) }&nNum=${notice.nNum}'>${notice.title}</a></td>
								<td class="hidden-xs" style="text-align: center;" width="50px">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.inDate}" /></td>
								<td class="hidden-xs" style="text-align: center;" width="50px">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.expireDate}" /></td>
								<c:if test="${notice.kind == 0}">
								<td style="text-align: center; color: red;" width="20px">이슈</td>
								</c:if>
								<c:if test="${notice.kind == 1}">
								<td style="text-align: center; color: blue;" width="20px">이벤트</td>
								</c:if>
								<c:if test="${notice.kind == 2}">
								<td style="text-align: center; color: purple;" width="20px">점검</td>
								</c:if>
								<c:if test="${notice.kind == 3}">
								<td style="text-align: center;" width="20px">기본</td>
								</c:if>
							</tr>
						</c:forEach>
						</c:if>
						<c:if test="${empty noticeList }">
							<tr>
								<td style="text-align:center;" colspan="5">내용이 없습니다.</td>
							</tr>
						</c:if>

					</table>
				</div>
				<!-- box-body -->

				<div class="box-footer">
				
					<div class="text-center" >
						<ul class="pagination link">
							<c:if test="${pageMaker.prev}">
								<li><a href="${pageMaker.startPage - 1}">&laquo;</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="${idx}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="${pageMaker.endPage +1}">&raquo;</a></li>
							</c:if>
						</ul>
						<sec:authorize access="hasAuthority('ROLE_ADMIN')">
						<button id='newNtn' style="float:right; margin-top:20px" class="btn btn-primary" onclick="javascript:location.href='register';">New Notice</button>
						</sec:authorize>
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
	

</script>



</body>








