<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<body>  
    <!-- Content Header (Page header) -->
	<section class="content-header">
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath() %>/project/main?pjNum=${logonProject.pjNum}">
				<i class="fa fa-dashboard">&nbsp;&nbsp;&nbsp;${logonProject.name }</i></a></li>
			<li class="active">대시보드</li>
		</ol>
	</section>
	<br/>
	
	<!-- 새로운 이슈 정보창 -->
    <section class="content">
		<div class="row">

			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-aqua">
					<div class="inner">
						<h3>150</h3>

						<p>New Orders</p>
					</div>
					<div class="icon">
						<i class="ion ion-bag"></i>
					</div>
					<a href="#" class="small-box-footer">More info <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->

			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-green">
					<div class="inner">
						<h3>
							53<sup style="font-size: 20px">%</sup>
						</h3>

						<p>간트차트</p>
					</div>
					<div class="icon">
						<i class="ion ion-stats-bars"></i>
					</div>
					<a href="<%=request.getContextPath()%>/project/gantt/list" class="small-box-footer">More info 
						<i class="fa fa-arrow-circle-right"></i>
					</a>
				</div>
			</div>
			<!-- ./col -->

			<!-- 회원정보 -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-yellow">
					<div class="inner">
						<h3>2</h3>

						<p>새로운 팀원</p>
					</div>
					<div class="icon">
						<i class="ion ion-person-add"></i>
					</div>
					<a href="" class="small-box-footer">More info 
						<i class="fa fa-arrow-circle-right"></i>
					</a>
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
	    
</body>