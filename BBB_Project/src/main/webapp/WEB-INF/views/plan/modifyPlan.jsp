<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<body>
	<section class="content-header">
		<h1 style="cursor: pointer;"onclick="javascript:location.href='<%=request.getContextPath()%>/project/issue/list';">프로젝트 계획서</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/project/main?pjNum=${logonProject.pjNum}">
			<i class="fa fa-dashboard"></i>${logonProject.name }</a></li>
			<li class="active"><a href="<%=request.getContextPath()%>/project/plan/modifyPlan">계획서</a></li>
		</ol>
	</section>
	
	<section class="content">
	
		<div class="callout callout-info">
	        <h4>Tip!</h4>
	        <p>아래의 박스에 파일을 드래그하여 올려주세요!&nbsp;&nbsp; 계획서 파일은 1개만 등록 가능하며 파일용량은 5MB로 제한합니다.</p>
        </div>
        
		<div class="form-group has-feedback" style="margin">
			<form role="form" method="post" action="modifyPlan">
			<div class="form-group">
				<div class="box">
					<div class="box-body dropzone" style="text-align : center; width: 100%; height: 200px;  background-color: lightslategray; margin: auto;">
						<b>계획서 파일 등록</b>
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
						<button type="submit" class="btn btn-primary" style="float:right;">수정</button>
						<button type="button" class="btn btn-warning"
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
			/* if(extend != 'zip' && extend != 'ZIP'){
				alert('zip 압축파일만 업로드가 가능합니다');
				return;
			} */
			
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
		
		var puuid = "${logonProject.puuid}";
		
		$.getJSON("getAttach/"+puuid,function(list){
			$(list).each(function(){
				var fileInfo=getFileInfo(this,"<%=request.getContextPath()%>");
				var html=template(fileInfo);
				$('.uploadedList').append(html);
				
			});
		});
		
		function getFileInfo(attachJson,contextPath){
			var fileName,imgsrc,getLink;
			var fullName;
			if(attachJson.fileType=="1"){
				fullName=attachJson.savePath.replace(/\\/g,"/")
						 +"s_"+attachJson.puuid+"$$"+attachJson.fileName;
				imgsrc=contextPath+"/displayFile?fileName="+fullName;				
			}else{
				fullName=attachJson.savePath.replace(/\\/g,"/")
						 +attachJson.puuid+"$$"+attachJson.fileName;
				imgsrc=contextPath+"/resources/dist/img/file.png";		
			}
			getLink=attachJson.savePath.replace(/\\/g,"/")
				    +attachJson.puuid+"$$"+attachJson.fileName;
			fileName=attachJson.fileName;
			
			return {fileName:fileName,imgsrc:imgsrc,getLink:getLink,fullName:fullName};
		}
		
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