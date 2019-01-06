<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
<!-- Main content -->
<section class="content">

	<!-- 회원 검색창 -->
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">회원검색</h3>
					<div class="box-tools">
						<div class="input-group input-group-sm" >
							<div>
							<form action="memberList">
								<select name="searchType">
									<option value=""
										${pageMaker.cri.searchType==null ? 'selected':'' }>검색구분</option>
									<option value="i"
										${pageMaker.cri.searchType eq 'i' ? 'selected':'' }>아이디</option>
									<option value="n"
										${pageMaker.cri.searchType eq 'n' ? 'selected':'' }>이름</option>
									<option value="e"
										${pageMaker.cri.searchType eq 'e' ? 'selected':'' }>이메일</option>
								</select>

								
									<input type="text" name="keyword" value="${pageMaker.cri.keyword }">
									<button type="submit">
										<i class="fa fa-search" ></i>
									</button>
	
							</form>
							</div>
							<hr/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /회원검색 끝 -->

	<!-- 회원 리스트 -->
	<div class="row">
		<!-- <div class="col-md-6"> -->
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">Member List</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="text-align: center";>#</th>
							<th style="text-align: center";>ID</th>
							<th style="text-align: center";>NAME</th>
							<th style="text-align: center";>E-mail</th>
							<th style="text-align: center";>가입일</th>
							<th style="text-align: center";>이메일인증</th>
						</tr>

						<c:forEach var="member" items="${memberList }" varStatus="status">

							<tr>
								<td style="text-align: center";>${status.count }</td>
								<td style="text-align: center";>${member.id}</td>
								<td style="text-align: center";>${member.name}</td>
								<td style="text-align: center";>${member.email}</td>
								
								<td style="text-align: center";><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${member.indate}" /></td>
								<td style="width: 150px;">
									<div>
									&nbsp;<button type="button" class="btn btn-info"  onclick="submit_go('${member.id}');">인증</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-danger"  onclick="cancel_go('${member.id}');">취소</button>
									
									</div>
								</td>
						</c:forEach>
					</table>
				</div>
				<!-- /.box-body -->
				<!-- / 나의 참여목록 리스트 테이블 끝 -->

				<!-- 페이지번호 -->
				<div class="box-footer">
					<div class="text-center">
					<ul class="pagination link pagination-sm no-margin pull-right">
						
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
					
				</div>
				<!-- 페이지 번호 끝 -->

			</div>
			<!-- /.box -->

		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
	<form id="jobForm">
		<input type="hidden" name="page" value="${pageMaker.cri.page }">
		<input type="hidden" name="perPageNum"
			value="${pageMaker.cri.perPageNum }"> <input type="hidden"
			name="searchType" value="${pageMaker.cri.searchType }" /> <input
			type="hidden" name="keyword" value="${pageMaker.cri.keyword }" />
	</form>

	<!-- /.box -->
</section>
<!-- /.content -->

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(".link li a").on("click", function(event){
		event.preventDefault();
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action", "memberList").attr("method","get");
		jobForm.submit();
	});
	
	function submit_go(id){
		var jobForm = $("#jobForm");
		
		var input = $('<input>').attr({
			name : 'id',
			value : id
		});
		jobForm.append(input);
		jobForm.attr("action","cancel").attr("method","post");
		jobForm.submit();
		alert('인증을 허가했습니다.');
	}
	function cancel_go(id){
		var jobForm = $('#jobForm');
		
		var input = $('<input>').attr({
			name : 'id',
			value : id
		});
		jobForm.append(input);
		jobForm.attr("action","submit").attr("method","post");
		jobForm.submit();
		alert('인증을 취소했습니다.');
		
	}
</script>
</body>
</html>










