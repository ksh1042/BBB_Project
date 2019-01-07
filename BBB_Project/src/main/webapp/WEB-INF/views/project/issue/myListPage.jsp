<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
<style>
.textAlign{
	text-align:center;
}
</style>

	<div class="container">
      <section class="content-header" style="cursor:pointer;" onclick="javascript:location.href='<%=request.getContextPath()%>/project/issue/list';">
			<h3>이슈 게시판</h3>
      </section>
      
      <section class="content">
		<!-- QnA 리스트 -->
		<div class="row">
			<!-- <div class="col-md-6"> -->
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
					</div>
					<div class="box-header with-border">
						<h3 class="box-title">&nbsp;이슈 리스트</h3>
							<div class="box-tools">
								<div class="input-group input-group-sm" >
										<form action="list" style="width:300px;">
											<%-- <input type="hidden" name="pjNum" value="${logonProject.pjNum }"/> --%>
											<div style="margin-top:5px;margin-left:35px;">
											<select name="searchType">
												<option value="" ${cri.searchType==null?'selected':'' }>----</option>
												<option value="t" ${cri.searchType eq 't'?'selected':'' }>제목</option>
												<option value="w" ${cri.searchType eq 'w'?'selected':'' }>작성자</option>
												<option value="tc" ${cri.searchType eq 'tw'?'selected':'' }>제목 + 작성자</option>
											</select>
											</div>
											<div class="input-group input-group-sm" style="width: 150px;position:absolute;right:0;top:0;">
							                    <input type="text" name="keyword" class="form-control pull-right" value="${pageMaker.cri.keyword }" placeholder="Search">
							                    <div class="input-group-btn">
							                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
							                  	</div>
							                </div>
										</form>
									<hr/>
								</div>
							</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table class="table table-bordered" style="text-align:center;">
							<tr>
								<th class="textAlign">번호</th>
								<th class="textAlign">제목</th>
								<th class="textAlign">작성자</th>
								<th class="textAlign">등록일</th>
								<th class="textAlign">열림/닫힘</th>
							</tr>
							
							<c:if test="${!empty listIssue }">
							<c:forEach var="issue" items="${listIssue }">
								<c:if test="${loginUser.id eq issue.writer }">
								<tr>
									<td>${issue.rowNum}</td>
									<td style="display:none;">${issue.iNum}</td>
									<td>
										<a href='readPage${pageMaker.makeSearch(pageMaker.cri.page) }&iNum=${issue.iNum}'>
											${issue.title}
										</a>
									</td>
									<td>${issue.writer}</td>
									<td>
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${issue.indate}" />
									</td>
									<td>
										<c:if test="${issue.openyn eq 0 }">
											<span>열림</span>
										</c:if>
										<c:if test="${issue.openyn eq 1}">
											<span>닫힘</span>
										</c:if>
									</td>
								</tr>
								</c:if>
							</c:forEach>
							</c:if>
							<c:if test="${empty listIssue }">
								<tr>
									<td style="text-align:center;" colspan="5">등록된 이슈가 존재하지 않습니다.</td>
								</tr>
							</c:if>
						</table>
					</div>
					<!-- /.box-body -->
					
	
					<!-- 페이지번호 -->
					<div class="box-footer clearfix">
						<div style="float:left;margin-left:20px;">
							<button type="button" class="btn btn-primary">내 이슈</button>
						</div>
						<div style="float:right;margin-right:10px;">
							<button id='newBtn' class="btn btn-primary" onclick="registerIssue_go()">이슈 등록</button>
						</div><br/>
						<c:if test="${!empty listIssue }">
							<div style="text-align:center;">
							<ul class="pagination link">
			                  	<c:if test="${pageMaker.prev}">
									<li><a href="${pageMaker.startPage - 1}">&laquo;</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx ? 'class=active':''}"/>>
										<a href="${idx}">${idx}</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a href="${pageMaker.endPage +1}">&raquo;</a></li>
								</c:if>
			                </ul>
			                </div>
		                </c:if>
					</div>
					<!-- 페이지 번호 끝 -->
	
				</div>
				<!-- /.box -->
	
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
		<!-- / end QnA List -->
		
		<form id="jobForm">
			<input type="hidden" name="page" value="${pageMaker.cri.page }">
			<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum }"> 
			<input type="hidden" name="searchType" value="${pageMaker.cri.searchType }" /> 
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }" />
		</form>
	
		<!-- /.box -->
		
		<!-- /.content -->
	      	
      
      </section>	
	</div>

<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script>
	function registerIssue_go(){
		location.href="<%=request.getContextPath()%>/project/issue/register"
		
	}
	
	$(".link li a").on("click", function(event){
		
		event.preventDefault(); 
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action","list").attr("method", "get");		
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
