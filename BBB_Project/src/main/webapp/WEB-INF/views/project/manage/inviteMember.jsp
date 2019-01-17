<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
<style>
.teamMemberList>td{
	text-align:center;
}
</style>
</head>
<body>
<section class="content-header">
		<h1>초대할 멤버 검색</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/main/myPartakeList">
				<i class="fa fa-dashboard"></i>My Project</a>
			</li>
			<li><a href="<%=request.getContextPath() %>/project/main?pjNum=${logonProject.pjNum}"></a>${logonProject.name }</li>
			<li class="active">프로젝트 초대</li>
		</ol>
</section>
 <!-- Main content -->
    <section class="content">
      
      <!-- 나의 참여목록 리스트 테이블 -->
      <div class="row">
        <!-- <div class="col-md-6"> -->
        <div class="col-xs-12">
          <div class="box">
           <div class="col-sm-6 searchDiv" style="width:100%; padding:10px">
                    <form action="inviteMember">                       
                  <div class="input-group input-group-sm" style="position:relative;float:right; margin-right:0;width:50%;">
                     <span class="input-group-btn"> 
                        <select class="form-control" name="searchType" style="height:30px; width: 105px; font-size:11px;">
                           <option value="All" selected>전체</option>
                           <option value="id">아이디</option>
                           <option value="nm">이름</option>
                           <option value="em">이메일</option>
                        </select>   
                     </span>
                     <input type="text" name="keyword" class="form-control" value="${ pageMaker.cri.keyword }"> 
                     <span class="input-group-btn">
                        <button type="submit" class="btn btn-default btn-flat">검색</button>
                     </span>
                  </div>
                     </form>
               </div>
            
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tr>
                  <th style="width:10%;">#</th>
                  <th style="width:25%;">ID</th>
                  <th class="hidden-xs" style="width:15%;">이름</th>
                  <th style="width:40%;">E-mail</th>
                  <th style="width:15%;">초대하기</th>
                </tr>
             	
				<c:if test="${empty inviteList }">
					<tr class="teamMemberList">
					<c:if test="${empty cri.keyword }">
						<td colspan="5" >회원을 검색 해주세요.</td>
					</c:if>
					<c:if test="${!empty cri.keyword }">
						<td colspan="5" >검색된 회원이 없습니다.</td>
					</c:if>
					</tr>
				</c:if>
				
				<c:forEach var="inviteList" items="${inviteList }" varStatus="num">
					<tr class="teamMemberList">
	             	  <td>${num.index+1 }</td>
	                  <td class="id">
	                  	<a href="<%=request.getContextPath() %>/project/main?pjNum=${partake.pjNum}">
	                  		${inviteList.id}
	                  	</a>
	                  </td>
	                  <td class="hidden-xs">${inviteList.name }</td>
	                  <td>${inviteList.email}</td>
	                  <td><button type="button" class="btn btn-block btn-success invite" style="width:100; height:20px; line-height:5px;"id="${inviteList.id }">초대</button></td>
                	</tr>
				</c:forEach>
              </table>
            </div>
            <!-- /.box-body -->
            <c:if test="${!empty inviteList }">
          	<div class="box-footer">
				
					<div class="text-center" >
						<ul class="pagination link">
							<c:if test="${pageMaker.prev}">
								<li><a href="${pageMaker.startPage - 1}">&laquo;</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="${idx}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="${pageMaker.endPage +1}">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</c:if>
          </div>
          <!-- /.box -->
        
        <!-- /.col -->
      </div>
      <!-- /.row -->
     
      <!-- /.box -->
    </section>
    <!-- /.content -->
    <form id="jobForm">
			  <input type='hidden' name="page" value="${pageMaker.cri.page}"/>
			  <input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}"/>
			  <input type='hidden' name="keyword" value="${pageMaker.cri.keyword}"/>
			  <input type="hidden" name="searchType" value="${pageMaker.cri.searchType }" />
		</form>
	
	<!-- content.end -->
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		var pjNum = ${logonProject.pjNum};
		$('.invite').on('click', function(){
			if(confirm("해당 회원을 초대 하시겠습니까?") == true){
					var id = $(this).attr('id');
					$.ajax({
						type:"post",
						url:"<%=request.getContextPath()%>/project/manage/inviteMember",
						data:JSON.stringify({
							"id" : id,
							"pjNum" : pjNum
						}),
						headers:{
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"post"
						},
						success:function(data){
							if(data="SUCCESS"){
								alert(id+'회원을 초대했습니다.');
							}
							
							location.reload();
						},
						error:function(error){
							alert("회원의 초대가 실패했습니다. 잠시후 다시 시도해주세요.");
						}
					});
			}else{
				return;
			}
		});
		
		$(".link li a").on("click", function(event){
			
			event.preventDefault(); 
			
			var targetPage = $(this).attr("href");
			
			var jobForm = $("#jobForm");
			jobForm.find("[name='page']").val(targetPage);
			jobForm.attr("action","").attr("method", "get");		
			jobForm.submit();
		});
		
	</script>
</body>
</html>










