<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
  	<sec:authorize access="hasAuthority('ROLE_USER')">
  	<c:if test="${loginUser.id eq board.writer }">
    	<button type="submit" id="modifyBtn" class="btn btn-warning">Modify</button>&nbsp;
    	<button type="submit" id="removeBtn" class="btn btn-danger">REMOVE</button>&nbsp;
    </c:if>
    </sec:authorize>
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

					<div class="row">
						<div class="col-md-12">

							<div class="box box-success">
								<div class="box-header">
									<h3 class="box-title">ADD NEW REPLY</h3>
								</div>
								<div class="box-body">
									<label for="exampleInputEmail1">Writer</label> 
									<input class="form-control" readonly value="${loginUser.id}" type="text"  id="newReplyWriter"> 
									<label for="exampleInputEmail1">Reply Text</label> 
									<input class="form-control" type="text" placeholder="REPLY TEXT" id="newReplyText">

								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<button type="button" class="btn btn-primary" id="replyAddBtn">ADD REPLY</button>
								</div>
							</div>


							<!-- The time line -->
							<ul class="timeline">
								<!-- timeline time label -->
								<li class="time-label" id="repliesDiv">
									<span class="bg-green"> Replies List </span>
								</li>
							</ul>

							<div class='text-center'>
								<ul id="pagination" class="pagination pagination-sm no-margin ">
								</ul>
							</div>

						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->

					<!-- Modal -->
					
					<div id="modifyModal" class="modal modal-primary fade"
						role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">#rno</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body" data-rNum>
									<p>
										<input type="text" id="content" class="form-control">
									</p>
								</div>
								<div class="modal-footer">
									
  									<c:if test="${loginUser.id eq board.writer }">
											<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
											<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
									</c:if>
									
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
					
	</section>
	<!-- /.content -->
	<script>
	var bNum=${board.bNum};

	$('#replyAddBtn').on('click',function(e){
		var writer=$('#newReplyWriter').val();
		var content=$('#newReplyText').val();

		
		if(content==""){
			alert('댓글 내용은 필수입니다.');
			$('#newReplyText').focus();
			return;
		}
		
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/board/replies",
			data:JSON.stringify({
				"bNum":bNum,
				"writer":writer,
				"content":content
	
			}),
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"post"
			},
			success:function(data){
				if(data="SUCCESS"){
					alert('등록되었습니다.');
				}
				getPage("replies/"+bNum+"/1");
				
		
				$('#newReplyText').val("");
			},
			error:function(error){
				alert("댓글등록에 실패했습니다.");
			}
		});
	});
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rNum={{rNum}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate indate}}
		<a class="btn btn-primary btn-xs" id="modifyReplyBtn"
	    data-toggle="modal" data-target="#modifyModal">Modify</a>
  </span>
  <h3 class="timeline-header"><strong>{{rNum}}</strong> -{{writer}}</h3>
  <div class="timeline-body">{{content}} </div>		
</li>
{{/each}}
</script>

<script>
Handlebars.registerHelper("prettifyDate",function(timeValue){
	var dateObj=new Date(timeValue);
	var year=dateObj.getFullYear();
	var month=dateObj.getMonth()+1;
	var date=dateObj.getDate();
	return year+"/"+month+"/"+date;
});

var printData=function(replyArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html=template(replyArr);
	$('.replyLi').remove();
	target.after(html);
};

var replyPage=1;

getPage("replies/"+bNum+"/"+replyPage);

function getPage(pageInfo){	
	$.getJSON(pageInfo,function(data){
		printData(data.list,$('#repliesDiv'),$('#template'));	
		printPaging(data.pageMaker,$('.pagination'));
	});
}

var printPaging=function(pageMaker,target){
	var str="";
	if(pageMaker.prev){
		str+="<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
	}
	for(var i=pageMaker.startPage,len=pageMaker.endPage;i<=len;i++){
		var strClass = pageMaker.cri.page==i?'class=active':'';
		str+="<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
	}
	if(pageMaker.next){
		str+="<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
	}
	target.html(str);
}


$('.pagination').on('click','li a',function(event){
	event.preventDefault();
	replyPage=$(this).attr("href");
	getPage("replies/" + bNum+ "/" + replyPage);
});

$('.timeline').on('click', '.replyLi', function(event) {
	var reply = $(this);
	$('#content').val(reply.find('.timeline-body').text());
	$('.modal-title').html(reply.attr('data-rNum'));
});
		
$('#replyModBtn').on('click',function(event){
	var rNum=$('.modal-title').html();
	var content=$('#content').val();

$.ajax({
	method:'put',
	url:"replies/"+rNum,
	headers:{
		"Content-Type":"application/json",
		"X-HTTP-Method-Override":"PUT"
	},
	data:JSON.stringify({content:content}),
	dataType:'text',
	success:function(result){
		if(result=="SUCCESS"){
			alert("수정되었습니다.");
			getPage("<%=request.getContextPath()%>/board/replies/"+bNum+"/"+replyPage);
		}
	},
	error:function(error){
		alert("댓글 수정에 실패했습니다.");
	},
	complete:function(){
		$('#modifyModal').modal('hide');
	}
	
});
});

$('#replyDelBtn').on('click',function(event){
	var rNum=$('.modal-title').html();
	$.ajax({
		method:'delete',
		url:"replies/"+rNum,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Override":"delete"
		},
		dataType:'text',
		success:function(result){
			if(result="SUCCESS"){
				alert("삭제되었습니다.");
				getPage("<%=request.getContextPath()%>/board/replies/"+bNum+"/"+replyPage);
			}
		},
		error:function(error){
			alert('삭제를 실패했습니다.');
		},
		complete:function(){
			$('#modifyModal').modal('hide');
		}

});
	

});
</script>

</body>
