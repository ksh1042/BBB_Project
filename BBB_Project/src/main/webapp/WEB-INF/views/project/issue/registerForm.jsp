<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<body>

	<section class="content-header">
		<h1 style="cursor: pointer;" onclick="javascript:location.href='<%=request.getContextPath()%>/project/issue/list';">이슈 게시판</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/main/myPartakeList">
					<i class="fa fa-dashboard"></i>내 프로젝트
			</a></li>
			<li><a
				href="<%=request.getContextPath()%>/project/main?pjNum=${logonProject.pjNum}">${logonProject.name }</a></li>
			<li class="active"><a href="<%=request.getContextPath()%>/project/issue/list">이슈 등록</a></li>
		</ol>
	</section>

	<section class="content">
		<!-- QnA 리스트 -->
		<div class="row">
			<!-- <div class="col-md-6"> -->
			<div class="col-md-12">
				<!-- general form elements -->
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">이슈 등록</h3>
					</div>
					<!-- /.box-header -->

					<form role="form" method="post" action="register"
						name="registerIssueForm">
						<div class="box-body">
							<input type="hidden" name="writer" value="${loginUser.id }">
							<%-- <input type='hidden' name='page' value="${cri.page}"> 
									<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
				   					<input type='hidden' name='searchType' value="${cri.searchType}">
				   					<input type='hidden' name='keyword' value="${cri.keyword}"> --%>

							<div class="form-group">
								<label for="exampleInputEmail1">제목</label> <input type="text"
									name="title" class="form-control" placeholder="제목을 입력하세요">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">내용</label>
								<textarea class="form-control" name="content" id="summernote" rows="10" placeholder="내용을 작성하세요"></textarea>
							</div>
						</div>
						<!-- /.box-body -->

						<div class="box-footer">
							<ul class="mailbox-attachments clearfix uploadedList"></ul>
							<button type="button" onclick="register_go()" class="btn btn-primary" style="float: right; padding-left: 20px; padding-right: 20px;margin-left:10px;">등록</button>
							<button type="button" onclick="history_back()" class="btn btn-primary" style="float: right; padding-left: 20px; padding-right: 20px;">취소</button>
						</div>
					</form>
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
		<!-- / end QnA List -->

		<form id="jobForm">
			<input type="hidden" name="page" value="${pageMaker.cri.page }">
			<input type="hidden" name="perPageNum"
				value="${pageMaker.cri.perPageNum }"> <input type="hidden"
				name="searchType" value="${pageMaker.cri.searchType }" /> <input
				type="hidden" name="keyword" value="${pageMaker.cri.keyword }" />
		</form>

		<!-- /.box -->

		<!-- /.content -->

	</section>

<!-- include libraries(jQuery, bootstrap) -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
include summernote css/js
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
summer note korean language pack
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/lang/summernote-ko-KR.js"></script>
 -->
<script type="text/javascript">

/* 	$(document).ready(function() {
	     $('#summernote').summernote({
	    	height: 300,          // 기본 높이값
	 	    minHeight: null,      // 최소 높이값(null은 제한 없음)
	 	    maxHeight: null,      // 최대 높이값(null은 제한 없음)
	 	    focus: true,          // 페이지가 열릴때 포커스를 지정함
	 	    lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
	     });
	});
 */

	function register_go() {
		document.registerIssueForm.submit();
	}
	
	function history_back(){
		
		history.go(-1);
	}
</script>
</body>