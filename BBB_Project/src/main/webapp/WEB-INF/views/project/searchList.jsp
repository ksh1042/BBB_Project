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
	        <tr class="trd">
	          <td class="inner">${ProjectVO.name }</td>
	          <td>${ProjectVO.creator }</td>
	        </tr>
	        <tr>
	          <td>${ProjectVO.indate }</td>
	          <td>인원수</td>
	        </tr>
	      <button type="button" value="신청"></button>
	      <button type="button" value="취소"></button>
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