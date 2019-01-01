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
   상세페이지
    <small>(너의 이야기)</small>
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
    <li class="active">Here</li>
  </ol>
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

 <form role="form" action="modifyPage" method="post">
    
    <input type='hidden' name='bNum' value ="${boardVO.bNum}">
    <input type='hidden' name='page' value ="${cri.page}">
    <input type='hidden' name='perPageNum' value ="${cri.perPageNum}">
    
 </form>   
    
  <div class="box-body">
    <div class="form-group">
      <label for="exampleInputEmail1">Title</label>
      <input type="text" name='title' class="form-control" 
         value="${boardVO.title}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">Content</label>
      <div class="box">
      	<div class="box-header">
      		${ boardVO.title }
      	</div>
      	<div id="content-area" class="box-body">
      		${ boardVO.content }
      	</div>
      	<div class="box-footer">
      		${ boardVO.writer }
      	</div>
      </div>
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1" >Writer</label>
      <input type="text" name="writer" class="form-control" 
        value="${boardVO.writer}" readonly="readonly">
    </div>
    
    <!-- attach list -->
	<div class="form-group">
		<label for="exampleInputEmail1">Attach File</label>
		<ul class="mailbox-attachments clearfix uploadedList"></ul>
	</div>
</div>
    
  </div><!-- /.box-body -->

  <div class="box-footer">
    <button type="submit" id="modifyBtn" class="btn btn-warning">Modify</button>
    <button type="submit" id="removeBtn" class="btn btn-danger">REMOVE</button>
    <button type="submit" id="listBtn" class="btn btn-primary">GO LIST </button>
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


  
  
        </div><!-- /.box -->
      </div><!--/.col (left) -->
 
      </div>   <!-- /.row -->
    </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
    
</body>

<%@ include file="/WEB-INF/views/fileboard/fileboardreadattach.jsp" %>








