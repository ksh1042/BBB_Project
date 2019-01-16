<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<body>

	<section class="content-header">
		<h1 style="cursor: pointer;"
			onclick="javascript:location.href='<%=request.getContextPath()%>/project/issue/list';">이슈</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/project/main?pjNum=${logonProject.pjNum}">
					<i class="fa fa-dashboard"></i>${logonProject.name }
			</a></li>
			<li class="active"><a href="<%=request.getContextPath()%>/project/issue/list">이슈</a></li>
			<li class="active">${issue.title }</li>
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
					<h3 class="box-title">이슈 수정</h3>
				</div>
				<!-- /.box-header -->

			<form role="form" method="post" action="modifyPage" name="modifyIssueForm">
				<div class="box-body">
					<input type="hidden" name="iNum" value="${issue.iNum }"/>
					<input type='hidden' name='page' value="${cri.page}"> 
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
   					<input type='hidden' name='searchType' value="${cri.searchType}">
   					<input type='hidden' name='keyword' value="${cri.keyword}">
   									
					<div class="form-group">
						<label for="exampleInputEmail1">제목</label> 
						<input type="text" name="title" class="form-control" placeholder="제목을 입력하세요" value="${issue.title }">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">내용</label>
						<textarea id="content" class="form-control" name="content" rows="3" placeholder="내용을 작성하세요">${issue.content }</textarea>
					</div>
				</div>
				<!-- /.box-body -->
				
				<div class="box-footer">
					<ul class="mailbox-attachments clearfix uploadedList"></ul>	
					<button type="button" class="btn btn-primary" style="float:right;padding-left:20px;padding-right:20px;" onclick="issueModify_go()">수정</button>
					<button type="button" class="btn btn-default" style="padding-left:20px;padding-right:20px;" onclick="issueList_go()">취소</button>
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
			<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum }"> 
			<input type="hidden" name="searchType" value="${pageMaker.cri.searchType }" /> 
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }" />
		</form>
	
		<!-- /.box -->
		
		<!-- /.content -->
	      	
      
      </section>	

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	function issueList_go(){
		history.go(-1);
	}
	
	function issueModify_go(){
		var flag=confirm("이슈를 수정하시겠습니까?");
		if(flag){
			document.modifyIssueForm.submit();
		}
		
	}

</script>
	
	
</body>