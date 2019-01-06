<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<body>

	<div class="container">
      <section class="content-header" style="cursor:pointer;" onclick="javascript:location.href='<%=request.getContextPath()%>/project/issue/list';">
			<h3>이슈 게시판</h3>
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

			<form role="form" method="post" action="register" name="registerIssueForm">
				<div class="box-body">
					<input type="hidden" name="writer" value="${loginUser.id }">
					<%-- <input type='hidden' name='page' value="${cri.page}"> 
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
   					<input type='hidden' name='searchType' value="${cri.searchType}">
   					<input type='hidden' name='keyword' value="${cri.keyword}"> --%>
   					
					<div class="form-group">
						<label for="exampleInputEmail1">제목</label> 
						<input type="text" name="title" class="form-control" placeholder="제목을 입력하세요">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">내용</label>
						<textarea id="content" class="form-control" name="content"  placeholder="내용을 작성하세요"></textarea>
					</div>
				</div>
				<!-- /.box-body -->
				
				<div class="box-footer">
					<ul class="mailbox-attachments clearfix uploadedList"></ul>	
					<button type="button" onclick="register_go()" class="btn btn-primary" style="float:right;padding-left:20px;padding-right:20px;">등록</button>
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
      </div>
      
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>   
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
   <script src="<%=request.getContextPath()%>/resources/SE2/js/HuskyEZCreator.js"></script>
   <script type="text/javascript">

   var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.

   // Editor Setting
   nhn.husky.EZCreator.createInIFrame({
   oAppRef : oEditors, // 전역변수 명과 동일해야 함.
   elPlaceHolder : "content", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
   sSkinURI : "<%=request.getContextPath()%>/resources/SE2/SmartEditor2Skin.html", // Editor HTML
   fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
   htParams : {
      
      fOnBeforeUnload : function(){},
      // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
      bUseToolbar : true,
      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
      bUseVerticalResizer : true,
      // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
      bUseModeChanger : true, 
   }
   });

  /*  $('#submitBtn').on('click',function(e){
	   var form = $('form[role="form"]');
	   
	   // id가 smarteditor인 textarea에 에디터에서 대입         
	   oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	   
	   form.submit();
	      });
         
       */
   </script>	
	



<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script>
	function register_go(){
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		document.registerIssueForm.submit();
	}
</script>
</body>