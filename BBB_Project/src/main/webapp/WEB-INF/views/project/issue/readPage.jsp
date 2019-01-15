<%@page import="com.bbb.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
	<style>
hr {
	border-top: 1px solid #BDBDBD;
	border-bottom: 1px solid #F6F6F6;
}
</style>

	<section class="content-header">
		<h1 style="cursor: pointer;"
			onclick="javascript:location.href='<%=request.getContextPath()%>/project/issue/list';">이슈 게시판</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/main/myPartakeList">
					<i class="fa fa-dashboard"></i>내 프로젝트
			</a></li>
			<li><a href="<%=request.getContextPath()%>/project/main?pjNum=${logonProject.pjNum}">${logonProject.name }</a></li>
			<li class="active"><a href="<%=request.getContextPath()%>/project/issue/list">이슈 리스트</a></li>
			<li class="active">${issue.title }</li>
		</ol>
	</section>

	<section class="content">

		<form role="form">
			<input type='hidden' name='iNum' value="${issue.iNum}"> <input
				type='hidden' name='page' value="${cri.page}"> <input
				type='hidden' name='perPageNum' value="${cri.perPageNum}"> <input
				type='hidden' name='searchType' value="${cri.searchType}"> <input
				type='hidden' name='keyword' value="${cri.keyword}">
		</form>
		<!-- row -->
		<div class="row">
			<div class="col-md-12">
				<!-- The time line -->
				<h4>
					<strong>${issue.title }</strong>
				</h4>
				<hr />
				<ul class="timeline">
					<!-- timeline time label -->
					<li class="time-label"><c:if test="${issue.openyn eq 0 }">
							<span class="bg-green"> <span>이슈 열림</span>
							</span>
						</c:if> <c:if test="${issue.openyn eq 1}">
							<span class="bg-red"> <span>이슈 닫힘</span>
							</span>
						</c:if></li>
					<!-- /.timeline-label -->
					<!-- timeline item -->
					<li><i class="fa fa-user bg-aqua"></i> <!--이슈닫기 아이콘  --> <!-- <li><i class="fa fa-fw fa-ban" style="background-color:#FF0000;color:white;"></i> -->
						<div class="timeline-item">

							<span class="time"><i class="fa fa-clock-o"></i> ${indate}</span>

							<h3 class="timeline-header">
								<strong>${issue.writer }</strong>
							</h3>

							<div class="timeline-body">${issue.content }</div>
							<c:if test="${loginUser.id eq issue.writer }">
								<div class="timeline-footer" style="height: 50px;">
									<button type="button" class="btn btn-primary btn-xs"
										style="padding: 5px 10px 5px 10px; float: right;"
										id="issueModifyBtn">수정</button>
									<!-- <a class="btn btn-danger btn-xs">삭제</a> -->
								</div>
							</c:if>
						</div></li>
					<!-- END timeline item -->

					<!--이슈 디테일 달리는 부분. -->

					<li class="time-label" id="issueDetailDiv"></li>
					<!--이슈 닫기   -->
					<c:if test="${issue.openyn eq 1}">
						<li><i class="fa fa-fw fa-ban"
							style="background-color: #dd4b39; color: white;"></i>
							<div class="timeline-item">
								<div class="timeline-body" style="text-align: center;">
									<h4>
										<strong>이슈가 닫혔습니다.</strong>
									</h4>
									<c:if test="${loginUser.id eq issue.writer }">
										<form action="open" method="post" name="openIssueForm">
											<input type='hidden' name='iNum' value="${issue.iNum}">
											<button type="button" class="btn btn-primary btn-xs"
												style="padding: 5px 10px 5px 10px; margin-top: 6px; margin-bottom: 3px;"
												id="openBtn">이슈 열기</button>
										</form>
									</c:if>
								</div>
							</div></li>
					</c:if>
					<li><i class="fa fa-clock-o bg-gray"></i></li>
				</ul>
			</div>
			<!-- /.col -->
		</div>

		<!-- /.row -->
		<hr />
		<!-- 이슈 디테일 작성 부분  -->
		<c:if test="${issue.openyn eq 0}">
			<div class="box box-primary" id="detailBlock">
				<!-- form start -->
				<div class="box-header with-border">
					<input class="form-control" id="newIssueDetailWriter"
						readonly="readonly" value="${loginUser.id}" />
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="form-group">
						<textArea class="form-control" style="resize: none;"
							placeholder="이슈를 남기세요." id="newIssueDetailContent" cols="10"
							rows="4"></textArea>
					</div>
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-primary pull-right"
						style="float: right; margin-left: 10px;"
						onclick="addIssueDetail_go()">등록</button>
					<c:if test="${loginUser.id eq issue.writer }">
						<button type="button" id="closeBtn" class="btn btn-default"
							style="float: right;">이슈 닫기</button>
					</c:if>
					<form name="closeForm">
						<input type='hidden' name='iNum' value="${issue.iNum}">
					</form>
				</div>
				<!-- /.box-footer -->
			</div>
		</c:if>

	</section>

<script>

	var iNum=${issue.iNum};
	
	function addIssueDetail_go(){
		
		var writer=$('#newIssueDetailWriter').val();
		var content=$('#newIssueDetailContent').val();
		
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/project/issueDetail",
			async:false,
			data:JSON.stringify({
				"iNum":iNum,
				"writer":writer,
				"content":content
			}),
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"post"
			},
			success:function(data){
				if(data="SUCCESS"){
					alert('이슈가 등록되었습니다.');
				}		
				
				getPage("<%=request.getContextPath()%>/project/issueDetail/all/"+iNum);
			
				$('#newIssueDetailWriter').val("");
				$('#newIssueDetailContent').val("");
			},
			error:function(error){
				alert("이슈 등록에 실패했습니다.");
			}
		});
	}

	
	
</script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">

	{{#each .}}

	  <li class="issueDetailList" data-idNum={{idNum}}>
         <i class="fa fa-comments bg-yellow"></i>

         <div class="timeline-item">
           <span class="time"><i class="fa fa-clock-o"></i>{{prettifyDate indate}}</span>

           <h3 class="timeline-header"><strong>{{writer}}</strong></h3>
			<input type="hidden"  class="writerInput" value="{{writer}}"/>
			<input type="hidden"  value="{{iNum}}"/>
           <div class="timeline-body div-detail">
            {{content}}
      	   </div>
			<div id="issueDetailModifyBtnDiv">
				<div class="timeline-footer" style="height: 50px;" id="detailModifyBtn">
					<button class="btn btn-primary btn-xs btn-modify" style="padding:5px 10px 5px 10px;float:right;margin-right:10px;" onclick="issueDetail_delete({{idNum}})">삭제</button>
					<button class="btn btn-primary btn-xs btn-modify" style="padding:5px 10px 5px 10px;float:right;margin-right:10px;" onclick="detailModify({{idNum}}, '<%=request.getContextPath()%>/project/issueDetail/all/{{iNum}}');">수정</button>
		  		 </div>
			</div>
         </div>
       </li>
	{{/each}}


</script>
<script id="template2" type="text/x-handlebars-template">

	{{#each .}}

	  <li class="issueDetailList" data-idNum={{idNum}}>
         <i class="fa fa-comments bg-yellow"></i>

         <div class="timeline-item">
           <span class="time"><i class="fa fa-clock-o"></i>{{prettifyDate indate}}</span>

           <h3 class="timeline-header"><strong>{{writer}}</strong></h3>
			<input type="hidden"  class="writerInput" value="{{writer}}"/>
			<input type="hidden"  value="{{iNum}}"/>
           <div class="timeline-body div-detail">
            {{content}}
      	   </div>
         </div>
       </li>
	{{/each}}

</script>
<script id="modifyTemplate" type="text/x-handlebars-template">

	{{#each .}}
	  <li class="issueDetailList" data-idNum={{idNum}}>
         <i class="fa fa-comments bg-yellow"></i>

         <div class="timeline-item">
           <span class="time"><i class="fa fa-clock-o"></i>{{prettifyDate indate}}</span>

           <h3 class="timeline-header"><strong>{{writer}}</strong></h3>
			<input type="hidden"  class="writerInput" value="{{writer}}"/>

			<input type="hidden" id="detailIdNum"  value="{{idNum}}"/>	
			<input type="hidden"  value="{{iNum}}"/>
           <div class="timeline-body div-detail">
			 <textArea style="resize:none;" id="newDetailContent" cols="135" rows="4">{{content}}</textArea>
      	   </div>
			<div id="issueDetailModifyBtnDiv">
				<div class="timeline-footer" style="height: 50px;" id="detailModifyBtn">
					<button type="button" class="btn btn-primary btn-xs btn-modify" style="padding:5px 10px 5px 10px;float:right;margin-right:10px;margin-left:10px;" onclick="modifyDetail({{idNum}});">수정완료</button>
					<button class="btn btn-primary btn-xs btn-modify" style="padding:5px 10px 5px 10px;float:right;" onclick="getPage('<%=request.getContextPath()%>/project/issueDetail/all/{{iNum}}');">취소</button>
		  		 </div>
			</div>
         </div>
       </li>
	{{/each}}
</script>
<script id="deleteIssueDetail" type="text/x-handlebars-template">

	{{#each .}}

	  <li class="issueDetailList" data-idNum={{idNum}}>
         <i class="fa fa-comments bg-yellow"></i>
			<div class="timeline-item">
				<h3 class="timeline-header"><strong>{{writer}}</strong></h3>
				<div class="timeline-body" style="text-align: center;">
					<h5>
						삭제된 내용입니다.
					</h5>
				</div>
			</div>
       </li>
	{{/each}}

</script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	
	var closeForm = $("form[name='closeForm']");
	$("#closeBtn").on("click", function() {
		if(confirm("이슈를 닫으시겠습니까?")){
			closeForm.attr("action", "close");
			closeForm.attr("method", "post");
			closeForm.submit();
		}else{
			return;
		}
	});
	
	/* var deleteForm = $("form[name='deleteDetailForm']"); */
	function issueDetail_delete(idNum){
		
		if(confirm("이슈를 삭제하시겠습니까?")){
			<%-- deleteForm.attr("action", "<%=request.getContextPath()%>/project/issueDetail/remove");
			deleteForm.attr("method", "post");
			deleteForm.submit(); --%>
			$.ajax({
				url:"<%=request.getContextPath()%>/project/issueDetail/remove",
				type:"post",
				data:{
					"idNum":idNum
				},
				success:function(data){
					if(data == "success"){
						alert("삭제되었습니다.");
						getPage("<%=request.getContextPath()%>/project/issueDetail/all/" + iNum);
					}
				},
				error:function(data){
					alert("삭제에 실패했습니다.");
				}
			});	
			
		}else{
			return;
		}
	}
	
	
	$("#openBtn").on("click", function() {
		if(confirm("이슈를 열으시겠습니까?")){
			document.openIssueForm.submit();
		}else{
			return;
		}
	});
	
	var formObj = $("form[role='form']");
	
	$("#issueModifyBtn").on("click", function() {
		$("#detailBlock").disabled();
		formObj.attr("action", "modifyPage");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
	Handlebars.registerHelper("prettifyDate",function(timeValue){
	   var dateObj=new Date(timeValue);
	   var year=dateObj.getFullYear();
	   var month=dateObj.getMonth()+1;
	   var date=dateObj.getDate();
	   var hour=dateObj.getHours();
	   var min=dateObj.getMinutes();
	   return year+"/"+month+"/"+date+" "+hour+":"+min;
	});
	
	var printData=function(replyArr,target,templateObject, templateObject2,deleteTemplateObject){
		
	   var template=Handlebars.compile(templateObject.html());
	   var template2=Handlebars.compile(templateObject2.html());
	   var deleteTemplate=Handlebars.compile(deleteTemplateObject.html());
	   var tempReplyArr = new Array();
 	   var html = "";
	   $.each(replyArr,function(index,item){
		   if(item.deleteYn == 0){
			   if(item.writer == '${loginUser.id }'){
				   tempReplyArr.push(item);
				   html += template(tempReplyArr);
			   }else{
				   tempReplyArr.push(item);
				   html += template2(tempReplyArr);
			   }
		   }else{
			   tempReplyArr.push(item);
			   html += deleteTemplate(tempReplyArr);
		   }
		   tempReplyArr.pop();
	   });
	  
	   $('.issueDetailList').remove();
	   target.after(html);
	};



	getPage("<%=request.getContextPath()%>/project/issueDetail/all/" + iNum);

		function getPage(pageInfo) {
			$.getJSON(pageInfo, function(data) {
				printData(data, $('#issueDetailDiv'), $('#template'),
						$('#template2'),$("#deleteIssueDetail"));
			});
		}

		var printModifyData=function(idNum,replyArr,target,templateObject, templateObject2, ModifyTemplateObject){
			
			   var template=Handlebars.compile(templateObject.html());
			   var template2=Handlebars.compile(templateObject2.html());
			   var modifyTemplate = Handlebars.compile(ModifyTemplateObject.html());
			   var tempReplyArr = new Array();
		 	   var html = "";
			   $.each(replyArr,function(index,item){
				   if(idNum == item.idNum){
					   tempReplyArr.push(item);
					   html += modifyTemplate(tempReplyArr);
					   tempReplyArr.pop();
				   }else{
					   if(item.writer == '${loginUser.id }'){
						   tempReplyArr.push(item);
						   html += template(tempReplyArr);
					   }else{
						   tempReplyArr.push(item);
						   html += template2(tempReplyArr);
					   }
					   tempReplyArr.pop();
				   }
			   });
			  
			   $('.issueDetailList').remove();
			   target.after(html);
			};
		
		function detailModify(idNum, pageInfo) {
			$.getJSON(pageInfo, function(data) {
				printModifyData(idNum, data, $('#issueDetailDiv'), $('#template'), $('#template2'), $('#modifyTemplate'));
			});
		}
		
		function modifyDetail(idNum) {
			var newDetailContent = $('textArea').val();
			var url = "<%=request.getContextPath()%>/project/issueDetail/modify?newDetailContent=" + newDetailContent + "&idNum=" + idNum;
			$.ajax({
			      method:'get',
			      url:url,
			       headers:{
			         "Content-Type":"application/json",
			         "X-HTTP-Method-Override":"GET"
			      },
			      dataType:'text',
			      success:function(result){
			         if(result=="SUCCESS"){
			            alert("이슈가 수정되었습니다.");
			            getPage("<%=request.getContextPath()%>/project/issueDetail/all/"+ iNum);

							}
						},
						error : function(error) {
							alert("이슈 수정에 실패했습니다.");
						}
					});
		}
	</script>
</body>