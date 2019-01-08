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
								<textarea id="content" class="form-control" class="summernote" rows="10"
									placeholder="내용을 작성하세요"></textarea>
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

<!-- include summernote css/js-->
<link href="/summernote/summernote.css" rel="stylesheet">
<script src="plugins/summernote/summernote.js"></script>
<!-- summer note korean language pack -->
<script src="plugins/summernote/lang/summernote-ko-KR.js"></script>

<script>
	function register_go() {
		document.registerIssueForm.submit();
	}
	
	function history_back(){
		
		history.go(-1);
	}
</script>
</body>