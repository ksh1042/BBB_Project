<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
	<style>
		li.post-reply div.timeline-item {
			width :85%;
			background-color: #FBFBFF;
			float : right;
		}
	</style>
</head>
<body>
	<section class="content-header">
	
		<c:if test="${ loginUser.id == param.id }">
			<h1><a href="#">내</a> 사서함</h1>
		</c:if>
		<c:if test="${ loginUser.id != param.id }">
			<h1><a href="#">${ param.id }</a>님의 사서함</h1>
		</c:if>
		
		<ol class="breadcrumb">
			<li>postbox</li>
			<li><a href="<%= request.getContextPath() %>/postbox/list"><b>list</b></a></li>
		</ol>
	</section>
	
	<section class="content">
		<div class="row">
			<div class="col-md-9">
				<ul class="timeline" id="timelineDiv">	<!-- timeline id -->
					<!-- sample-column -->
					<c:if test="${ empty postList }">
						<li>
							<div class="timeline-item">
								<h3 class="timeline-header"></h3>
								<div class="timeline-body">
									표시할 내용이 없습니다.
								</div>
								<div class="timeline-footer">
								</div>
							</div>
						</li>
					</c:if>
					<c:forEach var="post" items="${ postList }" varStatus="stat">
						<c:if test="${ post.pbfNum eq 0 }">
							<li class="divider"></li>
						</c:if>
						<li class="${ post.pbfNum != 0 ? 'post-reply' : 'post-main' }">
							<i class="fa fa-user ${ post.writer eq loginUser.id ? 'bg-aqua' : 'bg-green' }"></i>
							<div class="timeline-item">
								
								<span class="time"><i class="fa fa-clock-o"></i>&nbsp;
									<fmt:formatDate value="${ post.indate }" pattern="yy-MM-dd"/>
								</span>
								<h3 class="timeline-header">
									<c:if test="${ post.writer eq loginUser.id }">
										<a href="<%= request.getContextPath() %>/postbox/list?id=${ loginUser.id }">내</a> 메세지
									</c:if>
									<c:if test="${ post.writer != loginUser.id }">
										<a href="<%= request.getContextPath() %>/postbox/list?id=${ post.writer }">${ post.writer }</a>님의 메세지
									</c:if>
								</h3>
								<div class="timeline-body">${ post.content }</div>
								<div class="timeline-footer">
									<c:if test="${ post.pbfNum eq 0 }">
										<a href="#">댓글달기</a>
									</c:if>
								</div>
							</div>
						</li>
					</c:forEach>
					
					<!-- <li>
						<i class="fa fa-user"></i>
						<div class="timeline-item">
							<span class="time"><i class="fa fa-clock-o"></i>&nbsp;???</span>
							<h3 class="timeline-header">내게서 무엇을 숨기려 하는가</h3>
							<div class="timeline-body">숨겨진 내용입니다</div>
						</div>
					</li> -->
					<!-- input-sample -->
					<li>
						<i class="fa fa-user fa-user bg-aqua"></i>
						<div class="timeline-item">
							<form id="write">
								<h3 class="timeline-header">글 쓰기</h3>
								<div class="timeline-body">
									<input type="hidden" name="pbNum" value="0">
									<input type="hidden" name="pbfNum" value="0">
									<input type="hidden" name="id" value="${ param.id }">
									<input type="hidden" name="writer" value="${ loginUser.id }">
									<label>내용</label>
									<textarea class="form-control" name="content" placeholder="내용을 입력..." style="resize:vertical;"></textarea>
								</div>
								<div class="timeline-footer">
									<button class="btn btn-primary btn-xs" onclick="write_go();">입력</button>
									<button class="btn btn-primary btn-xs" onclick="test_go();">테스트</button>
									<button type="reset" class="btn btn-danger btn-xs">취소</button>
									숨김<input type="checkbox" name="visibility" >
								</div>
							</form>
						</div>
					</li>
					<!-- input-sample.end -->
				</ul>
			</div>
		</div>
	</section>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		function test_go(){
			var x = $('input[name=visibility]').is(':checked', true)? 1 : 0;
			alert(x);
		}
		function write_go(){
			var flag = false;
			
			var content = $('textarea[name=content]').val();
			var visible = $('input[name=visibility]').is(':checked', true)? 1 : 0;
			
			if(content == ''){
				alert('내용을 입력하셔야 합니다');
				$('textarea[name=comment]').focus();
				return;
			}
			
			// TODO --- 글자 길이수 제한
			if(content.length > 99999){
				alert('글자 수 초과');
				return;
			}
			$.ajax({
				url : '<%= request.getContextPath() %>/postbox/write',
				type : 'post',
				data : JSON.stringify({
					pbNum : 0,
					pbfNum : 0,
					content : content,
					id : '${param.id}',
					writer : '${loginUser.id}',
					visibility : visible
				}),
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"post"
				},
				success : function(data){	
					if(data == 'SUCCESS'){
						alert('글이 정상적으로 등록되었습니다.');
						flag = true;
					}
				},
				error : function(error){
					alert('통신 오류가 발생하였습니다. 잠시후 다시 시도해주시기 바랍니다. 증상이 지속될 경우 자세한 사항은 관리자에게 문의 바랍니다.');
					flag = false;
				}
				
			});
			
		}
		
		var printData=function(replyArr,target,templateObject){
			var template=Handlebars.compile(templateObject.html());
			var html=template(replyArr);
			$('.timeline-item').remove();
			target.after(html);
		};
		
		function refreshPage(pageUrl){
			$.getJSON(pageUrl, function(data){
				printData(data.list,$('#timelineDiv'),$('#template'));
			});
		}
	</script>
	<script id="template" type="text/x-handlebars-template">
	{{#each .}}
	<li>
		<i class="fa fa-user bg-aqua"></i>
		<div class="timeline-item">
			<span class="time"><i class="fa fa-clock-o"></i>&nbsp;날짜</span>
			<h3 class="timeline-header">내 메시지</h3>
			<div class="timeline-body">내용이 들어간다 들어간다.</div>
			<div class="timeline-footer">
				<a href="#">댓글달기</a>
			</div>
		</div>
	</li>
	{{/each}}
	</script>
</body>