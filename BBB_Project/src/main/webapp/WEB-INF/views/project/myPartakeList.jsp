<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>나의 프로젝트 리스트</title>
</head>
<body>
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">My Project Partake List</h1>
				</div>
				<!-- <div class="col-sm-6">
					<ol class="breadcrumb float-sm-left">
						<li class="breadcrumb-item" />
					</ol>
				</div> -->
				<!-- /.col -->
			</div>
		</div>
	</div>
	<br />

	<div class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box">
					<div class="box-body">
						<table class="table table-bordered">
							<tr class="">
								<th>프로젝트번호</th>
								<th>프로젝트명</th>
								<th>개설자</th>
							</tr>
							<c:forEach var="partake" items="${myPartakeList }">
								<tr>
								<td>${partake.pjNum }</td>
								<td>${partake.name}</td>
								<td>${partake.creator }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</body>
</html>










