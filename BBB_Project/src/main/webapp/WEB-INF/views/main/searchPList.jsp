<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="box">
	<div class="box-header with-border">
		<h3 class="box-title">LIST PAGING</h3>
	</div>
<div class="container">

      <table class="searchResult">
      	
	    <c:if test="${empty searchPList }">
			<tr>
				<td style="text-align: center;">검색된 프로젝트가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty searchPList }">
			<c:forEach items="${searchPList }" var="ProjectVO">
				<form id="form${ProjectVO.pjNum }">
					<input type="hidden" name="id" value="${loginUser.id }" >
					<input type="hidden" name="pjNum" value="${ProjectVO.pjNum }" >
			        <tr class="trd">
			        	<td class="inner">${ProjectVO.name }</td>
			        	<td>${ProjectVO.creator }</td>
						<c:forEach items="${bindList }" var="PartakeVO">
			        		<c:if test="${PartakeVO.pjNum eq ProjectVO.pjNum }">
					        	<c:if test="${PartakeVO.assignYn eq 1}">
				      				<td rowspan="2"><input class="join" id="${ProjectVO.pjNum }" type="button" value="참여중" disabled="disabled"></td>
				      			</c:if>
					        	<c:if test="${PartakeVO.assignYn eq 0}">
				      				<td rowspan="2"><input class="join" id="${ProjectVO.pjNum }" type="button" value="신청중" disabled="disabled"></td>
				      			</c:if>
				      			<c:if test="${PartakeVO.assignYn eq 2 }">
			      					<td rowspan="2"><input class="join" id="${ProjectVO.pjNum }" type="button" value="신청하기" ></td>
			      				</c:if>
				      		</c:if>
						</c:forEach>
			        </tr>
			        <tr>
			        	<td>생성일자<fmt:formatDate value="${ProjectVO.indate }" pattern="yyyy-MM-dd"/></td>
			        	<td>인원수</td>
			        </tr>
				</form>
	    </c:forEach>
	    </c:if>
      </table>
</div>
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
					<li><a
								href="${pageMaker.endPage +1}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>
		<form id="jobForm">
			  <input type='hidden' name="page" value="${pageMaker.cri.page}"/>
			  <input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}"/>
			  <input type='hidden' name="keyword" value="${cri.keyword}"/>
		</form>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	
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
	
$(".link li a").on("click", function(event){
		
		event.preventDefault(); 
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action","").attr("method", "get");		
		jobForm.submit();
	});
	
	

</script>