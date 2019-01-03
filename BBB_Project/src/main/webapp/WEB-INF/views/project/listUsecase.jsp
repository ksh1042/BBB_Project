<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

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
					<div class="user-block">
						<img class="img-circle" src="<%=request.getContextPath()%>/resources/dist/img/user1-128x128.jpg" alt="User Image"> 
						<span class="username">
							<a href="#">${writer }</a>
						</span>
						<span class="description">작성날짜</span>
					</div>
					<!-- /.작성자 정보 -->
					
					<!-- 유즈케이스 등록창 버튼 -->
					<div class="box-tools">
						<button style="float: right; margin-top:10px;" type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-usecase">Create UC</button>
					</div>
					<!-- /. 유즈케이스 등록창 버튼 -->
				</div>
				<!-- /.box-header -->
				
				<!-- 사진 뷰 -->
				<div class="box-body">
					<img class="img-responsive pad" src="<%=request.getContextPath()%>/resources/dist/img/photo2.png" alt="Photo">
				</div>
				<!-- /.사진 뷰 -->
				
				<!-- 댓글 시작 -->
				<div class="box-footer box-comments">
					<div class="box-comment">
						<!-- User image -->
						<img class="img-circle img-sm"
							src="<%=request.getContextPath()%>/resources/dist/img/user3-128x128.jpg"
							alt="User Image">

						<div class="comment-text">
							<span class="username"> Maria Gonzales(작성자 이름) <span
								class="text-muted pull-right">8:03 PM Today(작성시간)</span>
							</span>
							<!-- /.username -->
							It is a long established fact that a reader will be distracted by
							the readable content of a page when looking at its layout.(작성내용)
						</div>
						<!-- /.comment-text -->
					</div>
					<!-- /.box-comment -->

					<!-- /.box-footer -->
					<div class="box-footer">
						<form action="#" method="post">
							<img class="img-responsive img-circle img-sm"
								src="<%=request.getContextPath()%>/resources/dist/img/user4-128x128.jpg"
								alt="Alt Text">
							<!-- .img-push is used to add margin to elements next to floating images -->
							<div class="img-push">
								<input type="text" class="form-control input-sm"
									placeholder="Press enter to post comment">
							</div>
						</form>
					</div>
					<!-- /.box-footer -->
				</div>
				<!-- /.box -->
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
					<form action="registerUsecase" method="POST">
						<input type="hidden" name="writer" value="${ loginUser.name }">
						<label class="control-label">File Upload</label>
                        <div class="fileDrop" style="width: 100%; height: 100px; border: 1px dotted gray; background-color: lightslategray; margin: auto;">
                        </div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" id="create_btn" class="btn btn-primary">Save</button>
					<button type="button" id="cancel_btn" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="templateAttach" type="text/x-handlebars-template">
<li style="width:10%;font-size:0.8em;position:relative;">
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
	
	
	fileName=fileLink.substr(fileLink.indexOf("$$")+1);
	
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
   
<script>
var form = $('form[role="form"]');
$("button[type='submit']").on("click", function(e){
   e.preventDefault();
     
   $(".uploadedList .delbtn").each(function(i, obj){
      var fullName=$(this).attr('href');
      var uuid="";
      var fileName="";
      if(checkImageType(fullName)){
         uuid=fullName.substring(14).split('$$')[0];
         fileName=fullName.substring(14).split('$$')[1];
         fileType="1";
      }else{
         uuid=fullName.substring(12).split('$$')[0];
         fileName=fullName.substring(12).split('$$')[1];
         fileType="0";
      }
      
      var uploadPath=fullName.substring(0,12).replace(/\//g,"\\");
            
      var input1=$('<input>').attr('type','hidden').attr('name','attachList['+i+'].uuid').val(uuid);
      var input2=$('<input>').attr('type','hidden').attr('name','attachList['+i+'].fileName').val(fileName);
      var input3=$('<input>').attr('type','hidden').attr('name','attachList['+i+'].fileType').val(fileType);
      var input4=$('<input>').attr('type','hidden').attr('name','attachList['+i+'].uploadPath').val(uploadPath);
      
      form.append(input1).append(input2).append(input3).append(input4);
   });
   
   form.submit();
   
});

$('.uploadedList').on('click','.delbtn',function(event){
   event.preventDefault();
   var that=$(this);
   
   $.ajax({
      url:'<%=request.getContextPath()%>/deleteFile',
         type : 'post',
         data : {
            fileName : $(this).attr('href')
         },
         success : function(result) {
            if (result == 'deleted') {
               that.parent('li').remove();
            }
         }
      });
   });
</script>

</body>