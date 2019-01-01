<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${ loginUser.emailyn eq 0 }">
	<script>
		alert('이메일 인증이 완료되어야 이용하실 수 있는 서비스입니다.');
		location.href = '<%= request.getContextPath() %>/commons/emailAuth';
	</script>
</c:if>
