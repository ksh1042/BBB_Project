<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>

<section class="content-header">
	<h1>프로젝트 검색 목록</h1>
	<ol class="breadcrumb">
		<li><a href="<%=request.getContextPath() %>/main/myPartakeList">
			<i class="fa fa-dashboard"></i>&nbsp;&nbsp;홈</a></li>
		<li class="active">프로젝트 검색</li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-body text-center">
					<table class="table table-bordered">
						<tr>
							<th style="width: 10px; text-align: center;">#</th>
							<th style="width: 40%; text-align: center;">프로젝트명</th>
							<th style="width: 20%; text-align: center;">개설자</th>
							<th style="width: 40px; text-align: center;">개설일</th>
							<th style="width:10%; text-align: center;">상태</th>
						</tr>
						<c:if test="${empty searchPList }">
							<tr>
								<td colspan="5" ><h3>검색된 프로젝트가 없습니다.</h3></td>
							</tr>
						</c:if>
						<c:if test="${!empty searchPList }">
							<c:forEach items="${searchPList }" var="ProjectVO" varStatus="index">
								<tr>
									<td>${index.count }</td>
									<td>${ProjectVO.name }</td>
									<td>${ProjectVO.creator }</td>
									<td><fmt:formatDate value="${ProjectVO.indate }" pattern="yyyy년MM월dd일" /> 생성</td>
									<c:forEach items="${bindList }" var="PartakeVO">
										<c:if test="${PartakeVO.pjNum eq ProjectVO.pjNum }">
											<c:if test="${PartakeVO.assignYn eq 1}">
												<td rowspan="2" class="button" style="width: 50px;">
													<input class="join btn btn-block btn-success" id="${ProjectVO.pjNum }" type="button" value="참여중" disabled="disabled" style="height: 55px; width: 100%;">
												</td>
											</c:if>
											<c:if test="${PartakeVO.assignYn eq 0}">
												<td rowspan="2" class="button" style="width: 50px;">
													<input class="cancel btn btn-block btn-warning" id="${ProjectVO.pjNum }" type="button" value="신청중" style="height: 55px; width: 100%;">
												</td>
											</c:if>
											<c:if test="${PartakeVO.assignYn eq 2 }">
												<td rowspan="2" class="button" style="width: 50px;">
													<input class="join btn btn-block btn-primary" id="${ProjectVO.pjNum }" type="button" value="신청하기" style="height: 55px; width: 100%;">
												</td>
											</c:if>
										</c:if>
									</c:forEach>
								</tr>
								<tr style="text-align:center;">
									<td colspan="4">${ProjectVO.disc }</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination link pagination-sm no-margin">
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
			</div>
		</div>
	</div>
</section>
<form id="jobForm">
	<input type='hidden' name="page" value="${pageMaker.cri.page}"/>
	<input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}"/>
	<input type='hidden' name="keyword" value="${cri.keyword}"/>
</form>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>

	/*프로젝트 참여신청  */
	var id = '${loginUser.id}';
	$('.join').on("click",function(){
		var form = $(this).attr('id');
		
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/main/joinProject",
			data:JSON.stringify({
				"id":id,
				"pjNum":form,
			}),
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"post"
			},
			success:function(data){
				if(data="SUCCESS"){
					alert('신청이 완료되었습니다.');
				}
				
				location.reload();
			},
			error:function(error){
				alert("신청이실패했습니다. 잠시후 다시 시도해주세요.");
			}
		});
	});
	
	/*프로젝트 참여신청 취소  */
	$('.cancel').on('click', function(){
		if(confirm("신청을 취소하시겠습니까?") == true){
				var form = $(this).attr('id');
				$.ajax({
					type:"post",
					url:"<%=request.getContextPath()%>/main/joinCancel",
					data:JSON.stringify({
						"id":id,
						"pjNum":form,
					}),
					headers:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"post"
					},
					success:function(data){
						if(data="SUCCESS"){
							alert('신청이 취소되었습니다.');
						}
						
						location.reload();
					},
					error:function(error){
						alert("취소가 실패했습니다. 잠시후 다시 시도해주세요.");
					}
				});
		}else{
			return;
		}
	});
	
	/* 페이지 넘김 */
	$(".link li a").on("click", function(event){
			
			event.preventDefault(); 
			
			var targetPage = $(this).attr("href");
			
			var jobForm = $("#jobForm");
			jobForm.find("[name='page']").val(targetPage);
			jobForm.attr("action","").attr("method", "get");		
			jobForm.submit();
		});
</script>
</body>