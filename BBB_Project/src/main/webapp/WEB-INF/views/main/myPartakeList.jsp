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
              <h3 class="box-title">My ProjectPartake List</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tr>
                  <th>#</th>
                  <th>프로젝트 명</th>
                  <th>개설자</th>
                </tr>
                
                
             
				<c:forEach var="partake" items="${myPartakeList }" varStatus="num">
						
				<tr>	
             	  <td>${num.index+1 }</td>
                  <td>
                  	<a href="<%=request.getContextPath() %>/project/main?pjNum=${partake.pjNum}">
                  		${partake.name}
                  	</a>
                  </td>
                  <td>${partake.creator}</td>
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
	</script>
</body>
</html>










