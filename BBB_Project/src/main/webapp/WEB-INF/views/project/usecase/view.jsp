<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<body>
	<section class="content-header">
		<h1>Use Case Diagram</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/main/myPartakeList">
				<i class="fa fa-dashboard"></i>My Project</a>
			</li>
			<li><a href="<%=request.getContextPath() %>/project/main?pjNum=${logonProject.pjNum}"></a>${logonProject.name }</li>
			<li class="active">use case</li>
		</ol>
	</section>
	<br/>
		

	<section class="content-body" >
	<div class="row">
		<div class="col-md-12">
			<!-- Box Comment -->
			<div class="box box-widget">
			
				<div class="box-header with-border">
					<!-- 작성자 정보 -->
					<c:if test="${!empty usecaseList }" >
					<c:forEach var="usecase" items="${usecaseList }">
					<div class="user-block">
						<img class="img-circle" src="<%=request.getContextPath()%>/resources/dist/img/user1-128x128.jpg" alt="User Image"> 
						<span class="username">
							<a href="#">${usecase.writer }</a>
						</span>
						<span class="description"><fmt:formatDate pattern="yyyy-MM-dd" value="${usecase.indate}" /></span>
					</div>
					</c:forEach>
					</c:if>
					<c:if test="${empty usecaseList }" >
					<div class="user-block">
						<h3>작성 정보가 존재하지 않습니다.</h3>
					</div>
					</c:if>
					<!-- /.작성자 정보 -->
					
					<!-- 유즈케이스 등록창 버튼 -->
					<div class="box-tools">
						<button style="float: right; margin-top:10px;" type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-usecase">Create UC</button>
					</div>
					<!-- /. 유즈케이스 등록창 버튼 -->
				</div>
				<!-- /.box-header -->
				
				<!-- 사진 뷰 -->
				<c:if test="${!empty imageUrl }" >
				<div class="box-body">
					<img src="<spring:url value='/ucImage${imageUrl}'/>" width="100%" />
				</div>
				</c:if>
				<c:if test="${empty imageUrl }" >
				
				</c:if>
				<!-- /.사진 뷰 -->
				<!-- 댓글 시작 -->
				<c:if test="${!empty usecaseList }" >
				<div class="box-footer box-comments" >
					<c:if test="${!empty replyList }" >
						<c:forEach var="reply" items="${replyList }">
							<div class="box-comment">
								<!-- 댓글을 등록한 사람 프로필사진 -->
								<img class="img-circle img-sm" src="<%=request.getContextPath()%>/resources/dist/img/user3-128x128.jpg" alt="User Image">
		
								<div class="comment-text">
									<span class="username">
										<span class="user" >${reply.writer}</span>
										<span class="text-muted pull-right"><fmt:formatDate pattern="hh:MM a yyyy-MM-dd" value="${reply.indate}" /></span>
									</span>
									<!-- /.댓글작성자 이름 -->
									${reply.content }
								</div>
								<!-- /.comment-text -->
							</div>
						</c:forEach>
					</c:if>
					<!-- /.box-comment -->

					<!-- /.box-footer -->
					<div class="box-footer">
						<form action="registerReply" method="post">
							<img class="img-responsive img-circle img-sm" src="<%=request.getContextPath()%>/resources/dist/img/user4-128x128.jpg" alt="Alt Text">
							<!-- .img-push is used to add margin to elements next to floating images -->
							<div class="img-push">
								<input type="hidden" name="writer" value="${loginUser.id }">
								<input type="text" name="content" class="form-control input-sm" placeholder="Press enter to post comment">
							</div>
						</form>
					</div>
					<!-- /.box-footer -->
				</div>
				</c:if>
				<!-- /.댓글 끝 --> 
			</div>
			<!-- /.col -->
		</div>
	</div>
	</section>

	<div class="modal fade" id="modal-usecase">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Use-Case Create</h4>
				</div>
				<div class="modal-body">
					<form action="register" method="POST" role="form">
						<input type="hidden" name="writer" value="${loginUser.id }">
						<label class="control-label">File Upload</label>
                        <div class="fileDrop" style="width: 100%; height: 100px; border: 1px dotted gray; background-color: lightslategray; margin: auto;">
                        </div>
					</form>
				</div>

				<div class="modal-footer">
					<ul class="mailbox-attachments clearfix uploadedList"></ul>
					<button type="submit" id="submitBtn" class="btn btn-primary">Save</button>
					<button type="button" id="cancel_btn" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->



<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="templateAttach" type="text/x-handlebars-template">
<li style="width:30%;font-size:0.8em; text-align:center; position:relative;">
	<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"
	   style="position:absolute;right:0;top:0;padding:0;" >
		<i class="fa fa-fw fa-remove"></i>
	</a>
	<span class="mailbox-attachment-icon has-img">
      <img src="{{imgsrc}}" alt="Attachment"></span>
    <div class="mailbox-attachment-info">
	  <a href="{{getLink}}" class="mailbox-attachment-name thumbnail">{{fileName}}</a>     
    </div>
</li>
</script>
<script>

var pjNum=${logonProject.pjNum};
var template=Handlebars.compile($('#templateAttach').html());


$.getJSON("getAttach/"+pjNum,function(list){
	$(list).each(function(){
		var fileInfo=getFileInfo(this,"<%=request.getContextPath()%>");
		var html=template(fileInfo);
		$('.uploadedList').append(html);
		
	});
});
</script>
<script>
var template=Handlebars.compile($('#templateAttach').html());

$(document).on("dragenter dragover drop",function(event){
	event.preventDefault();
});
$('.fileDrop').on('drop',function(event){
	event.preventDefault();
	
	var files=event.originalEvent.dataTransfer.files;
	/* var file=files[0]; */
	
	for(var file of files){	
		
		if(file.size>1024*1024*5){
			alert("파일 용량이 5MB를 초과하였습니다.");
			return false;
		}
		
		var formData=new FormData();
		formData.append("file",file);
		
		$.ajax({
			url:"<%=request.getContextPath()%>/uploadAjax",
			type:"post",
			data:formData,
			processData:false,
			contentType:false,
			success:function(data){
				var fileInfo=getUploadFileInfo(data,"<%=request.getContextPath()%>");
				var html=template(fileInfo);
				$(".uploadedList").append(html);
				$('.fileDrop').hide();
			},
			error : function(error){
				alert('통신 오류가 발생하였습니다. 잠시후 다시 시도해주시기 바랍니다. 증상이 지속될 경우 자세한 사항은 관리자에게 문의 바랍니다.');
			}
		});
	}
});

function getUploadFileInfo(fullName,contextPath){
	
	var fileName,imgsrc,getLink;
	var fileLink;
	if(checkImageType(fullName)){
		imgsrc=contextPath+"/displayFile?fileName="+fullName;
		fileLink=fullName.substr(14);
		
		var front=fullName.substr(0,12); // /2017/12/15/
		var end=fullName.substr(14); // s_ 이후
		
		getLink=front+end;		
	}else{
		imgsrc=contextPath+"/resources/dist/img/file.png";
		fileLink=fullName.substr(12);
		getLink=fullName;
	}
	
	
	fileName=fileLink.substr(fileLink.indexOf("$$")+2);
	
	return {fileName:fileName,imgsrc:imgsrc,getLink:getLink,fullName:fullName};
	
}

function checkImageType(fileName){
	var pattern=/jpg|gif|png|jpeg/i;
	
	return fileName.match(pattern);
}


$('.uploadedList').on('click','.thumbnail',function(e){
	e.preventDefault();
	
	var form =$('<form>').attr({action:"<%=request.getContextPath()%>/displayFile",method:"get"});
	var input = $('<input>').attr("name","fileName").val($(this).attr("href"));
	
	$(document.body).append(form);
	
	form.append(input);
	form.submit();
});
</script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
var form = $('form[role="form"]');

$("button[type='submit']").on("click", function(e){
   e.preventDefault();
   
   $(".uploadedList .delbtn").each(function(i, obj){
      var fullName=$(this).attr('href');
      var uuuid="";
      var fileName="";
      var writer = "${loginUser.id}";
      if(checkImageType(fullName)){
         uuuid=fullName.substring(14).split('$$')[0];
         fileName=fullName.substring(14).split('$$')[1];
         fileType="1";
      }else{
         uuuid=fullName.substring(12).split('$$')[0];
         fileName=fullName.substring(12).split('$$')[1];
         fileType="0";
      }
      
      var uploadPath=fullName.substring(0,12).replace(/\//g,"\\");
            
      var input1=$('<input>').attr('type','hidden').attr('name','attachList['+i+'].uuuid').val(uuuid);
      var input2=$('<input>').attr('type','hidden').attr('name','attachList['+i+'].fileName').val(fileName);
      var input3=$('<input>').attr('type','hidden').attr('name','attachList['+i+'].fileType').val(fileType);
      var input4=$('<input>').attr('type','hidden').attr('name','attachList['+i+'].savePath').val(uploadPath);
      var input5=$('<input>').attr('type','hidden').attr('name','attachList['+i+'].writer').val(writer);
      form.append(input1).append(input2).append(input3).append(input4).append(input5);
   });
   
   form.submit();
   
});

$('.uploadedList').on('click','.delbtn',function(event){
	event.preventDefault();
	var that=$(this);
	
	$.ajax({
		url:'<%=request.getContextPath()%>/deleteFile',
		type:'post',
		data:{fileName:$(this).attr('href')},
		success:function(result){
			if(result=='deleted'){
				that.parent('li').remove();
				$('.fileDrop').show();
			}
		}
	});
});

$('.box-comment').on('click', function(e){
	
	var writer = $(this).children('div.comment-text').children('span.username').children('span.user').html();
	var id = '${loginUser.id}';

	if(writer == id){
		alert("삭제하시겠습니까?");
	}else{
		alert("권한이 없습니다");
	}
});
</script>

</body>