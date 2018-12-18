<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
	<style>
		table.table th {
			background-color: #FAFAFA;
		}
		table.table th,td{
			text-align: center;
		}
	</style>
</head>
<body>
	<section class="content-header">
		<h1>회원 검색</h1>
		<ol class="breadcrumb">
			<li>postbox</li>
			<li><a href="<%=request.getContextPath()%>/postbox/search"><b>search</b></a></li>
		</ol>
	</section>
	<section class="content">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">'??'건의 내용이 검색되었습니다</h3>
					<div class="box-tools">
						<div class="input-group input-group-sm" style="width: 150px;">
							<input type="text" name="keyword" class="form-control pull-right" placeholder="검색...">
							<div class="input-group-btn">
								<button type="submit" class="btn btn-default">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- table -->
				<div class="box-body table-responsive no-padding">
					<table class="table table-hover">
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>이메일</th>
						</tr>
						<tr>
							<td><a href="#">nicosara</a></td>
							<td>김형민</td>
							<td>nicosara@gmail.com</td>
						</tr>
					</table>
				</div>
				<!-- table.end -->
				<div class="box-footer">
					<ul class="pagination pagination-sm no-margin pull-right">
						<li><a href="#">&lt;&lt;</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">&gt;&gt;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>
</body>