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
    
    <!-- 나의 참여목록 검색바 -->
     <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">참여 프로젝트 검색</h3>

              <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
      
                  <input type="text"  class="form-control pull-right" placeholder="Search">

                  <div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
   
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
      <!-- /나의 참여목록 검색바 끝 -->
      
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
                  <th>개설번호</th>
                  <th>프로젝트 명</th>
                  <th>개설자</th>
                  <th>진행도</th>
                </tr>
                
                
             
				<c:forEach var="partake" items="${myPartakeList }" varStatus="num">
						
				<tr>	
             	  <td>${num.index+1 }</td>
             	  <td>
             	  	<a href="<%=request.getContextPath() %>/project/projectMain?${partake.pjNum}">${partake.pjNum }</a>
             	  </td>
                  <td>${partake.name}</td>
                  <td>${partake.creator}</td>
                  <td>
                   <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-danger" style="width: 55%"></div>
                    </div>
                    <span class="badge bg-red">55%</span>
                  </td>
				</c:forEach>
						  
              </table>
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
    

	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</body>
</html>










