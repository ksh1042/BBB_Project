<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<head>
	<title>자료실</title>
</head>

<body>
<!-- Main content -->
<!-- Content Header (Page header) -->
<section class="content-header">
  <h1>
   자료실
    <small>(다운로드)</small>
  </h1>
  
</section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
      <!-- left column -->
      <div class="col-md-12">
        <!-- general form elements -->
        <div class="box box-primary">
        <div class="box-header">
          <h3 class="box-title">READ BOARD</h3>
        </div><!-- /.box-header -->

 <form role="form" action="updatePage" method="post">
    
    <input type='hidden' name='bNum' value ="${boardVO.bNum}">
    <input type='hidden' name='page' value ="${cri.page}">
    <input type='hidden' name='perPageNum' value ="${cri.perPageNum}">
    
 </form>   
    
  <div class="box-body">
    <div class="form-group">
      <label for="exampleInputEmail1">제목</label>
      <input type="text" name='title' class="form-control" 
         value="${boardVO.title}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">내용</label>
      <div class="box">
      
      	<div id="content-area" class="box-body">
      		${ boardVO.content }
      	</div>
      	
      </div>
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1" >작성자</label>
      <input type="text" name="writer" class="form-control" 
        value="${boardVO.writer}" readonly="readonly">
    </div>
    
    <!-- attach list -->
	<div class="form-group">
		<label for="exampleInputEmail1">파일 첨부</label>
		<ul class="mailbox-attachments clearfix uploadedList"></ul>
	</div>
</div>
    
  </div><!-- /.box-body -->

  <div class="box-footer">
    <button type="submit" id="modifyBtn" class="btn btn-warning">수정</button>
    <button type="submit" id="removeBtn" class="btn btn-danger">삭제</button>
    <button type="submit" id="listBtn" class="btn btn-primary">목록으로 </button>
  </div>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>


var formObj = $("form[role='form']");


$("#modifyBtn").on("click", function(){
	formObj.attr("action", "fileboardmodify");
	formObj.attr("method", "get");		
	formObj.submit();
});

$("#removeBtn").on("click", function(){
	formObj.attr("action", "fileboardremove");
	formObj.submit();
});

$("#listBtn").on("click", function(){
	formObj.attr("method", "get");
	formObj.attr("action", "fileboardlist");
	formObj.submit();
});


</script>
<%@ include file="/WEB-INF/views/fileboard/fileboardreadattach.jsp" %>


  
  
        </div><!-- /.box -->
      </div><!--/.col (left) -->
 
      </div>   <!-- /.row -->
    </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
    
</body>









