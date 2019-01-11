<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
<style>
.table > thead > tr > td,
.table > tbody > tr > td,
.table > tfoot > tr > td {
  padding: 3px;
  vertical-align: middle;
}
</style>
</head>
<body>
<section class="content-header">
		<h1>신청받은 멤버관리</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/main/myPartakeList">
				<i class="fa fa-dashboard"></i>My Project</a>
			</li>
			<li><a href="<%=request.getContextPath() %>/project/main?pjNum=${logonProject.pjNum}"></a>${logonProject.name }</li>
			<li class="active">신청받은 멤버관리</li>
		</ol>
</section>
 <!-- Main content -->
    <section class="content">
      
      <!-- 나의 참여목록 리스트 테이블 -->
      <div class="row">
        <!-- <div class="col-md-6"> -->
        <div class="col-xs-12">
          <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table joinTable table-bordered">
                <tr>
                  <th>#</th>
                  <th>ID</th>
                  <th class="hidden-xs">이름</th>
                  <th style="width:10%;">E-mail</th>
                  <th style="width:30%;">선택</th>
                </tr>
				<c:if test="${empty joinList}">
					<tr class="joinList">	
						<td colspan="4" style="text-align:center;">현재 신청온 회원이 없습니다.</td>
					</tr>
				</c:if>
				
				<c:forEach var="joinList" items="${joinList }" varStatus="num">
					<tr class="joinList" style="line-height:15px; padding:3px; ">
		             	<td>${num.index+1 }</td>
		                <td>
			                <a href="<%=request.getContextPath() %>/project/main?pjNum=${partake.pjNum}">
			                  		${joinList.id}
			                </a>
		                </td>
		                <td class="hidden-xs">${joinList.name }</td>
		                <td>${joinList.email }</td>
		                <td><input type="checkbox" id="idList" name="" value="${joinList.id }" style="width:25px; height:25px;"/></td>
	                </tr>
				</c:forEach>
						  
              </table>
		          <button type="button" class="btn btn-block btn-danger refuse" id="${partake.id }"style="margin-top:15px;float:right;width:100px;margin-right:0px;">거절</button>
                  <button type="button" class="btn btn-block btn-primary apply" id="${partake.id }"style="width:100px;float:right;margin-top:15px;margin-right:25px;">수락</button>
              
            </div>
            
            <!-- /.box-body -->
            <!-- / 나의 참여목록 리스트 테이블 끝 -->
          </div>
          <!-- /.box -->
          

        </div>
        
        <!-- /.col -->
      </div>
      <!-- /.row -->
     
      <!-- /.box -->
    </section>
    <!-- /.content -->
    
	
	<!-- content.end -->
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		var pjNum = ${logonProject.pjNum};
		var applyList = new Array();
		$('.apply').on('click', function(){
			$('input[type=checkbox]').each(function(){
				if($(this).is(':checked')){
					var temp = $(this).val();
					applyList.push(temp);
				}
			});
			if(applyList[0] == null){
				alert('선택된 회원이 없습니다.');
				return;
			}
			if(confirm("프로젝트 참여를 수락하시겠습니까?") == true){
					$.ajax({
						type:"post",
						url:"<%=request.getContextPath()%>/project/manage/applyMember",
						data:JSON.stringify({
							applyList : applyList
						}),
						headers:{
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"post"
						},
						success:function(data){
							if(data="SUCCESS"){
								alert('참여를 수락했습니다.');
							}
							
							location.reload();
						},
						error:function(error){
							alert("수락에 실패했습니다. 잠시후 다시 시도해주세요.");
						}
					});
			}else{
				return;
			}
		});
		
		var pjNum = ${logonProject.pjNum};
		$('.refuse').on('click', function(){
			$('input[type=checkbox]').each(function(){
				if($(this).is(':checked')){
					var temp = $(this).val();
					applyList.push(temp);
				}
			});
			if(applyList[0]==null){
				alert('선택된 회원이 없습니다.');
				return;
			}
			if(confirm("프로젝트 참여를 거절하시겠습니까?") == true){
					$.ajax({
						type:"post",
						url:"<%=request.getContextPath()%>/project/manage/refuseMember",
						data:JSON.stringify({
							applyList : applyList
						}),
						headers:{
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"post"
						},
						success:function(data){
							if(data="SUCCESS"){
								alert('참여를 거절했습니다.');
							}
							
							location.reload();
						},
						error:function(error){
							alert("거절에 실패했습니다. 잠시후 다시 시도해주세요.");
						}
					});
			}else{
				return;
			}
		});
		
	</script>
</body>
</html>










