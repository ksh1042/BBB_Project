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
    
    <section class="content-body" >
    	<div class="row">
		<div class="col-md-12">
			<div class="box box-solid">
				<div class="box-body">
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"
								class=""></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"
								class=""></li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img src="<%= request.getContextPath() %>/resources/images/carousel01.png" style="width:100%" alt="First slide">
								<div class="carousel-caption"></div>
							</div>
							<div class="item">
								<img src="<%= request.getContextPath() %>/resources/images/carousel02.png" style="width:100%" alt="Second slide">
								<div class="carousel-caption"></div>
							</div>
							<div class="item">
								<img
									src="<%= request.getContextPath() %>/resources/images/carousel03.png" style="width:100%" alt="Third slide">
								<div class="carousel-caption"></div>
							</div>
						</div>
						<a class="left carousel-control" href="#carousel-example-generic"
							data-slide="prev"> <span class="fa fa-angle-left"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" data-slide="next"> <span
							class="fa fa-angle-right"></span>
						</a>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		</div>
		<!-- /.col -->
	</section>
	    
</body>