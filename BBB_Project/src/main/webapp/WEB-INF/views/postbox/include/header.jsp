<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><decorator:title default="내 사서함"></decorator:title></title>
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/resources/Ionicons/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/resources/dist/css/AdminLTE.min.css">
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/resources/dist/css/skins/skin-blue.min.css">
	
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	<decorator:head />
</head>

<body class="hold-transition skin-blue sidebar-mini">