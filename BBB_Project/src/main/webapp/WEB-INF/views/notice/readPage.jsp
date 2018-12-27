<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>


<head>
	<title>자유게시판</title>
</head>

<body>
<!-- Main content -->
<!-- Content Header (Page header) -->
<section class="content-header">
  <h1>
   상세페이지
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

 <form role="form" action="modifyPage" method="post">
    
    <input type='hidden' name='bNum' value ="${board.bNum}">
    <input type='hidden' name='pjNum' value ="${board.pjNum}">
    <input type='hidden' name='page' value ="${cri.page}">
    <input type='hidden' name='perPageNum' value ="${cri.perPageNum}">
    
 </form>   
    
  <div class="box-body">
    <div class="form-group">
      <label for="exampleInputEmail1">Title</label>
      <input type="text" name='title' class="form-control" 
         value="${board.title}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">Content</label>
      <textarea class="form-control"  name="content" rows="3" 
      readonly="readonly">${board.content}</textarea>
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1" >Writer</label>
      <input type="text" name="writer" class="form-control" 
        value="${board.writer}" readonly="readonly">
    </div>
  </div><!-- /.box-body -->

  <div class="box-footer">
    <button type="submit" id="modifyBtn" class="btn btn-warning">Modify</button>
    <button type="submit" id="removeBtn" class="btn btn-danger">REMOVE</button>
    <button type="submit" id="listBtn" class="btn btn-primary">LIST</button>
  </div>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>


var formObj = $("form[role='form']");

console.log(formObj);

$("#modifyBtn").on("click", function(){
	formObj.attr("action", "modifyPage");
	formObj.attr("method", "get");		
	formObj.submit();
});

$("#removeBtn").on("click", function(){
	formObj.attr("action", "removePage");
	formObj.submit();
});

$("#listBtn").on("click", function(){
	formObj.attr("method", "get");
	formObj.attr("action", "listPage");
	formObj.submit();
});


</script>


  
  
        </div><!-- /.box -->
      </div><!--/.col (left) -->
 
      </div>   <!-- /.row -->
    </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
    
</body>
  