<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page trimDirectiveWhitespaces="true" %>
<head>
	<style>
		.fileDrop{
			width:80%;
			height:100px;
			border:1px dotted gray;
			background-color:lightslategray;
			margin:auto;
		}
	</style>
</head>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">프로젝트 라이브러리 등록</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-left">
						<li class="breadcrumb-item">
							
						</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
		</div>
	</section>
	
	<section class="content">
		<div class="form-group has-feedback col-md-9" style="margin">
			<div class="form-group">
				<label class="control-label">파일 등록</label>
			</div>
			<form role="form" method="post" action="registerPlan">
			<div class="form-group">
				<div class="box">
					<div class="box-body dropzone" style="text-align : center;">
						<b>이 곳에 파일을 Drag & Drop 해 주세요</b>
					</div>
					<div class="box-footer">
						<ul class="mailbox-attachments clearfix uploadedList">
						</ul>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="box">
					<div class="box-body">
						<button type="submit" class="btn btn-primary" style="float:right;" 
							onclick="submit_go();">등록</button>
						<button type="submit" class="btn btn-warning"
							onclick="back_go();">돌아가기</button>
					</div>
				</div>
			</div>
			</form>
		</div>
	</section>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script id="templateAttach" type="text/x-handlebars-template">
	<li style="width:20%;font-size:0.8em;position:relative;">
		<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"
	   		style="position:absolute;right:0;top:0;padding:0;" >
				<i class="fa fa-fw fa-remove"></i>
		</a>
		<span class="mailbox-attachment-icon has-img">
	      	<img src="{{imgsrc}}" alt="Attachment">
		</span>
    	<div class="mailbox-attachment-info">
	  		<a href="{{getLink}}" class="mailbox-attachment-name thumbnail">{{fileName}}</a>     
  	  	</div>
	</li>
	</script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	
	<script>
		function back_go() {
			history.go(-1);
		}
		var form = $('form[role="form"]');
		$("button[type='submit']").on("click", function(e){
			e.preventDefault();
			if(!$('.uploadedList').find('li')){
				alert("업로드예정인 계획서가 없습니다.");
				return;
			}
			/* alert("submit"); */
			$(".uploadedList .delbtn").each(function(i, obj){
				var fullName=$(this).attr('href');
				var puuid="";
				var fileName="";
				if(checkImageType(fullName)){
					puuid=fullName.substring(14).split('$$')[0];
					fileName=fullName.substring(14).split('$$')[1];
					fileType="1";
				}else{
					puuid=fullName.substring(12).split('$$')[0];
					fileName=fullName.substring(12).split('$$')[1];
					fileType="0";
				}
				
				var uploadPath=fullName.substring(0,12).replace(/\//g,"\\");
						
				var input1=$('<input>').attr('type','hidden').attr('name','attachList['+i+'].puuid').val(puuid);
				var input2=$('<input>').attr('type','hidden').attr('name','attachList['+i+'].fileName').val(fileName);
				var input3=$('<input>').attr('type','hidden').attr('name','attachList['+i+'].fileType').val(fileType);
				var input4=$('<input>').attr('type','hidden').attr('name','attachList['+i+'].savePath').val(uploadPath);
				
				form.append(input1).append(input2).append(input3).append(input4);
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
						$('.dropzone').show();
					}
				}
			});
		});
	
		var template = Handlebars.compile($('#templateAttach').html());
		
		$(document).on("dragenter dragover drop",function(e){
			e.preventDefault();
		});
		$('.dropzone').on('drop', function(e){
			e.preventDefault();

			var files = e.originalEvent.dataTransfer.files;
			/* var extend = files[0].name.substr(files[0].name.lastIndexOf('.')+1); */
			
			if(files.length > 1){
				alert('파일 업로드는 한 개만 가능합니다');
				return;
			}
			if(extend != 'pdf' && extend != 'PDF'){
				alert('pdf파일만 업로드가 가능합니다');
				return;
			}
			
			var formData = new FormData();
			formData.append('file', files[0]);
			
			
			$.ajax({
				url : '<%=request.getContextPath()%>/uploadAjax',
				type : 'post',
				data : formData,
				processData : false,
				contentType : false,
				success : function(data){
					var fileInfo = getUploadFileInfo(data, '<%= request.getContextPath()%>');
					var html = template(fileInfo);
					$('.uploadedList').append(html);
					$('.dropzone').hide();
				},
				error : function(error){
					alert('통신 오류가 발생하였습니다. 잠시후 다시 시도해주시기 바랍니다. 증상이 지속될 경우 자세한 사항은 관리자에게 문의 바랍니다.');
				}
			});
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
		
		/*  */
		
		
	</script>
</body>