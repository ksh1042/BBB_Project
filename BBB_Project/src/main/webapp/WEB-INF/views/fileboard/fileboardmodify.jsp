<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<body>
<style>
	.fileDrop{
			width:80%;
			height:100px;
			border:1px dotted gray;
			background-color:lightslategray;
			margin:auto;
		}
</style>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">글 수정</h3>
				</div>
				<!-- /.box-header -->

<form role="form" action="fileboardmodify" method="post">

	<input type='hidden' name='page' value="${cri.page}"> 
	<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">

					<div class="box-body">

						<div class="form-group">
							<label for="exampleInputEmail1">글번호</label> <input type="text"
								name='bno' class="form-control" value="${boardVO.bNum}"
								readonly="readonly">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">제목</label> <input type="text"
								name='title' class="form-control" value="${boardVO.title}">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">내용</label>
							<textarea class="form-control" name="content" id="content" rows="3">${boardVO.content}</textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">작성자</label> 
							<input readonly type="text" name="writer" class="form-control"
								value="${boardVO.writer}">
						</div>
						<div class="form-group">
							<label>파일을 이곳에 드래그 해주세요.</label>
							<div class="fileDrop"></div>
						</div>						
					</div>
					<!-- /.box-body -->
				<div class="box-footer">
					<div>
						<hr/>
					</div>
					<ul class="mailbox-attachments clearfix uploadedList"></ul>
					<button type="submit" class="btn btn-warning">수정</button>
					<button type="submit" class="btn btn-primary">취소</button>
				</div>
			
				</form>
	
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

	
		

			
		
	</script>
	<script>
					var titleFlag = false;
					
					$('input[name="title"]').on('blur',function(e){
						$(this).css({borderColor : 'red'});
						var title = $(this).val();
						
						if(title == null || title == ''){
							$('#titleHelp').css({color:'red'});
							$('#titleHelp').html('제목을 입력하세요.');
							$(this).focus();
							return;
						}
						if(title.length > 20){
							$('#titleHelp').css({color:'red'});
							$('#titleHelp').html('제목은 20자를 넘지 않습니다.');
							$(this).focus();
							return;
						}else{
							$(this).css({borderColor : 'green'});
							$('span#titleHelp').html('');
							titleFlag = true;
						}
						
						verifyCheck();
					});
					
					
					var formObj = $("form[role='form']");

					console.log(formObj);

					$("#cancelBtn").on("click",function() {
						self.location = "listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
					});

					$("#saveBtn").on("click", function() {
						if(!titleFlag){
							$('button#saveBtn').prop('disable',true);
							$('span#titleHelp').css({color:'red',fontWeight:'bold'});
							$('span#titleHelp').html('');
							$('input[name=title]').css({borderColor:'red'});
							return;
						}
						formObj.submit();
					});
					
					function verifyCheck(){
						if(!titleFlag){
							$('button#saveBtn').prop('disabled',true);
							$('span#titleHelp').css({
								color:'red',
								fontWeight:'bold'
							});
							$('span#titleHelp').html('');
							$('input[name=]').css({
								borderColor : 'red'
							});
							return;
						}
						$('button#saveBtn').prop('disabled',false);
					}
				</script>
<script>
$(document).ready(
	function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-primary")
				.on("click",function() {
					self.location = "listPage?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				});

		$(".btn-warning").on("click",function() {
					formObj.submit();
				});
	});
</script>




			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

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
<%@ include file="/WEB-INF/views/fileboard/fileboardattach.jsp" %>
<%@ include file="/WEB-INF/views/fileboard/fileboardreadattach.jsp" %>

<script>
var form=$('form[role="form"]');

$('.uploadedList').on('click','.delbtn',function(event){
	event.preventDefault();
	
	$(this).parent('li').remove();		
	var input= $('<input>').attr({
									type:"hidden",
									name:"oldAttach",
									value:$(this).attr('href')
								});	
	form.append(input);
});


form.submit(function(event){
	event.preventDefault();
	
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
	form.get(0).submit();
});

</script>


</body>
