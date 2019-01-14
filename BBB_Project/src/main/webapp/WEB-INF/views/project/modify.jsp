<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
textarea {
	resize: none;
}
label.lineHeight {
	line-height: 35px;
}
</style>
</head>
<body>
	<section class="content-header">
		<h1>프로젝트 수정</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/main/myPartakeList">
					<i class="fa fa-dashboard"></i>My Project
			</a></li>
			<li><a
				href="<%=request.getContextPath() %>/project/main?pjNum=${logonProject.pjNum}">${logonProject.name }</a></li>
			<li class="active"><a href="list">프로젝트 수정</a></li>
		</ol>
	</section>
	<br />
	<section class="content">
		<c:set var="originStartDate" value="${ logonProject.startDate }" scope="request"></c:set>
		<c:set var="originEndDate" value="${ logonProject.endDate }" scope="request"></c:set>
		<div class="col-xs-12">
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#default" data-toggle="tab"
						aria-expanded="true">기본설정</a></li>
					<li><a href="#advanced" data-toggle="tab" aria-expanded="false">고급설정</a></li>
					<li><a href="#remove" data-toggle="tab" aria-expanded="false">삭제</a></li>
				</ul>
				<div class="tab-content">
					<!------------------------------------------------------------------------------------------------------------------>
					<!-- modify-tab.start -->
					<div class="tab-pane active" id="default">
						<form class="form-horizontal">
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">프로젝트 명</label>

								<div class="col-sm-10">
									<input type="email" class="form-control"
										value="${ logonProject.name }" readonly>
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail" class="col-sm-2 control-label">프로젝트 생성자</label>

								<div class="col-sm-10">
									<input type="text" class="form-control"
										value="${ logonProject.creator }" readonly>
								</div>
							</div>
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">프로젝트 공개여부</label>

								<div class="col-sm-10">
									<label class="control-label">공개</label>
									<input type="radio" class="control-label" name="visibility" value="0" <c:if test="${ logonProject.visibility eq 0 }">checked</c:if>>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label class="control-label">비공개</label>
									<input type="radio" class="control-label" name="visibility" value="1" <c:if test="${ logonProject.visibility eq 1 }">checked</c:if>>
								</div>
							</div>
							<div class="form-group">
								<label for="inputExperience" class="col-sm-2 control-label">프로젝트 설명</label>

								<div class="col-sm-10">
									<textarea class="form-control" rows="15">${ logonProject.disc }</textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">프로젝트 생성일</label>
								
								<div class="col-sm-4">
							    	<input class="form-control" type="date" value='<fmt:formatDate value="${ logonProject.indate }" pattern="yyyy-MM-dd"/>' readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">프로젝트 기간</label>
								
								<div class="col-sm-4">
							    	<input class="form-control" type="date" name="startDate" value='<fmt:formatDate value="${ logonProject.startDate }" pattern="yyyy-MM-dd"/>'>
							    	<span class="help-block" id="startDateHelp"><i class=""></i></span>
								</div>
								<label class="col-sm-1 text-center lineHeight">에서</label>
								<div class="col-sm-4">
									<input class="form-control" type="date" name="endDate" value='<fmt:formatDate value="${ logonProject.endDate }" pattern="yyyy-MM-dd"/>'>
							    	<span class="help-block" id="endDateHelp"><i class=""></i></span>
								</div>
								<label class="col-sm-1 text-center lineHeight">까지</label>
								<!-- /.input group -->
							</div>

							<div class="form-group">
								<div class="col-sm-offset-10 col-sm-2">
									<button type="submit" class="btn btn-primary" style="float:right;" onclick="xxx">수정</button>
									<button type="submit" class="btn btn-default" style="float:right; margin-right:20px;">뒤로</button>
								</div>
							</div>
						</form>
					</div>
					<!-- modify-tab.end  -->
					<!------------------------------------------------------------------------------------------------------------------>
					<!-- remove-tab.start -->
					<div class="tab-pane" id="advanced">
						<div class="form-group text-center">
							<span><i class="glyphicon glyphicon-hourglass"></i></span>
							<label class="control-label">준비중인 서비스입니다...</label>
						</div>
					</div>
					<!-- remove-tab.end  -->
					<!------------------------------------------------------------------------------------------------------------------>
					<!-- remove-tab.start -->
					<div class="tab-pane" id="remove" style="height:165px;">
						<div class="callout callout-danger">
			                <h4><span><i class="fa fa-warning"></i></span>&nbsp;경고</h4>
			                <p>프로젝트를 삭제하면 기록 및 모든 내용이 삭제되며 복구할 수 없습니다. 정말로 삭제를 하실지 신중하게 결정해주시기 바랍니다. <br>※ 삭제를 원하시면 하단의 입력란에  <b>'삭제하겠습니다'</b>를 입력해주시고 확인버튼을 클릭해주세요.</p>
		              	</div>
		              	<div class="form-group">
		              		<div class="col-xs-4"></div>
		              		<div class="col-xs-4">
		              			<div class="input-group">
				              		<input class="form-control" type="text" name="deleteMessage" placeholder="삭제문구를 입력...">
				              		<span class="input-group-btn">
				                      <button type="button" class="btn btn-danger btn-flat">삭제</button>
				                    </span>
			              		</div>
		              		</div>
		              		<div class="col-xs-4"></div>
		              		
		              	</div>
					</div>
					
					<!-- remove-tab.end  -->
				</div>
			</div>
			<!-- /.box -->
		</div>
	</section>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
	</script>
</body>