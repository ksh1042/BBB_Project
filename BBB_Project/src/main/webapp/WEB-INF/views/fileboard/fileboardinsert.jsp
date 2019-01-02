<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head>
<style>
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategray;
	margin: auto;
}
</style>


</head>

<body>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<!-- left column -->
			<div class="col-md-12">
				<!-- general form elements -->
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">REGISTER BOARD</h3>
					</div>
					<!-- /.box-header -->

					<form role="form" method="post" action="fileboardinsert">
						<div class="box-body">
							<div class="form-group">
								<label for="exampleInputEmail1">Title</label> <input type="text"
									name='title' class="form-control" placeholder="Enter Title">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Content</label>
								<textarea class="form-control" name="content" id="content" rows="10" cols="100"
									placeholder="Enter ..."></textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Writer</label> <input
									type="text" readonly name="writer" class="form-control"
									value="${loginUser.id }">
							</div>

							<div class="form-group">
								<label>File DROP Here</label>
								<div class="fileDrop"></div>
							</div>
						</div>
						<!-- /.box-body -->

						<div class="box-footer">
							<div>
								<hr />
							</div>
							<ul class="mailbox-attachments clearfix uploadedList"></ul>
							<button type="submit" id="submitBtn" class="btn btn-primary">Submit</button>
						</div>
					</form>


				</div>
				<!-- /.box -->
			</div>
			<!--/.col (left) -->

		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->

	<!-- 에디터 시작 -->
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
		// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseToolbar : true,
		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,
		// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true, 
	}
	});

$('#submitBtn').on('click',function(e){
	var form = $('form[role="form"]');
	
	// id가 smarteditor인 textarea에 에디터에서 대입			
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	
	form.submit();
		});


	</script>
	<!-- 에디터 끝 -->
	
	<%@ include file="/WEB-INF/views/fileboard/fileboardattach.jsp"%>
	
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






