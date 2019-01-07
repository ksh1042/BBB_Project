<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<body>
 <!-- Main content -->
    <section class="content">
      
      <!-- 나의 참여목록 리스트 테이블 -->
      <div class="row">
        <!-- <div class="col-md-6"> -->
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header with-border">
            	<div class="select-list inv">
            		<ul class="select">
            			<li class="div" id="selected" ><button type="button" class="btn btn-block btn-default">참여중인 프로젝트</button></li>
            			<li class="add"><button type="button" class="btn btn-block btn-default">신청중인 프로젝트</button></li>
            		</ul>
            		<!-- <div class="sibal saekki">
            	  		참여중인 프로젝트
              		</div>
	              	<div class="sibal">
        	      		신청중인 프로젝트
    	          	</div> -->
              	</div>
            </div>
            
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tr>
                  <th>#</th>
                  <th>프로젝트 명</th>
                  <th>개설자</th>
                  <th style="width:10%;">참여현황</th>
                </tr>
                
                
             	
				<c:forEach var="partake" items="${myPartakeList }" varStatus="num">
				<tr class="partakeList">
					<c:if test="${empty myPartakeList }">
						<td colspan="4">현재 진행중인 프로젝트가 없습니다.</td>
					</c:if>
					<c:if test="${!empty myPartakeList }">
	             	  <td>${num.index+1 }</td>
	                  <td>
	                  	<a href="<%=request.getContextPath() %>/project/main?pjNum=${partake.pjNum}">
	                  		${partake.name}
	                  	</a>
	                  </td>
	                  <td>${partake.creator}</td>
	                  <td><button type="button" disabled="disabled" class="btn btn-block btn-success">참여중</button></td>
                	</c:if>
                </tr>
				</c:forEach>
				
				<c:forEach var="bindProject" items="${bindProject }" varStatus="num">
					<c:if test="${empty bindProject }">
						<tr>
						<td colspan='4'>현재 신청중인 프로젝트가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty bindProject }">
					<tr class="bindList" id="bindList">	
		             	<td>${num.index+1 }</td>
		                <td>
			                <a href="<%=request.getContextPath() %>/project/main?pjNum=${partake.pjNum}">
			                  		${bindProject.name}
			                </a>
		                </td>
		                <td>${bindProject.creator}</td>
		                <td><button type="button" class="btn btn-block btn-warning cancel" id="${bindProject.pjNum }">신청중</button></td>
	                </tr>
	                </c:if>
				</c:forEach>
						  
              </table>
              
            </div>
            
            <!-- /.box-body -->
            <!-- / 나의 참여목록 리스트 테이블 끝 -->
                  
          </div>
          <!-- /.box -->
          <button type="button" class="btn btn-warning" onclick="newProject_go();">새 프로젝트</button>

        </div>
        
        <!-- /.col -->
      </div>
      <!-- /.row -->
     
      <!-- /.box -->
    </section>
    <!-- /.content -->
    

	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		function newProject_go(){
			location.href="<%=request.getContextPath()%>/main/addProject"
		}
		
		$(document).ready(function(){
			
			$('li.div').on('click',function(){
				$('.partakeList').removeAttr('id','bindList');
				$('.bindList').attr('id','bindList');
				$('li.add').removeAttr('id','selected');
				$('li.div').attr('id','selected');
			});
			$('li.add').on('click',function(){
				$('.bindList').removeAttr('id','bindList');
				$('.partakeList').attr('id','bindList');
				$('li.div').removeAttr('id','selected');
				$('li.add').attr('id','selected');
			})
		});
		
		var id = '${loginUser.id}';
		$('.cancel').on('click', function(){
			if(confirm("신청을 취소하시겠습니까?") == true){
					var form = $(this).attr('id');
					$.ajax({
						type:"post",
						url:"<%=request.getContextPath()%>/main/joinCancel",
						data:JSON.stringify({
							"id":id,
							"pjNum":form,
						}),
						headers:{
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"post"
						},
						success:function(data){
							if(data="SUCCESS"){
								alert('신청이 취소되었습니다.');
							}
							
							location.reload();
						},
						error:function(error){
							alert("취소가 실패했습니다. 잠시후 다시 시도해주세요.");
						}
					});
			}else{
				return;
			}
		});
		
	</script>
</body>
</html>










