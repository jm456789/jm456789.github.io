<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- <%@include file="../views/includes/header.jsp" %> --%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>WOOO</title>
<link rel="icon" type="image/png" sizes="16x16"  href="/resources/images/favicon.png">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="theme-color" content="#ffffff">  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/login.css" />" rel="stylesheet">
</head>
<body>
	<div class="login_Area">
	<h2>로그아웃 하시겠습니까?</h2><br>

<form action="/customLogout" method='post'>
<input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}" />
<button class='btn_login'>예</button>
</form>
<form>
<input type="button" class='btn_login' value="뒤로가기" onclick="history.back(-1);">
</form>
</div>
</body>
</html>
