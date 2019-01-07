<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<body>
	<!-- Content Wrapper -->
	<div class="content-wrapper">
	    <!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				Administrator <small>Control panel</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active">Main</li>
			</ol>
		</section>
	
		<!-- 새로운 이슈 정보창 -->
	    <section class="content">
			<div class="row">
				<!-- 회원정보 -->
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-yellow">
						<div class="inner">
							<h3>44</h3>
	
							<p>New Register Member</p>
						</div>
						<div class="icon">
							<i class="ion ion-person-add"></i>
						</div>
						<a href="<%=request.getContextPath()%>/admin/memberList"
							class="small-box-footer">More info <i
							class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./회원정보 -->
				
				<!-- 새로운 프로젝트 -->
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-red">
						<div class="inner">
							<h3>65</h3>
	
							<p>New Create Project</p>
						</div>
						<div class="icon">
							<i class="ion ion-pie-graph"></i>
						</div>
						<a href="#" class="small-box-footer">More info <i
							class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./새로운 프로젝트 -->
				
			</div>
			<!-- /.row -->
		</section>
	    <!-- /end.새로운 이슈 정보창 -->
	    
	</div>
	<!-- /end. Content Wrapper  -->
	    


</body>
</html>










