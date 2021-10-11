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

	<img src="/resources/images/LoginLg.png" alt="로그인">
	  
	<h2><c:out value="${error}"/></h2>
	<h2><c:out value="${logout}"/></h2>
	
	<form method='post' action="/login">
		<div>
			<input type='text' name='username' class="login_input" title="아이디 입력" placeholder="USERNAME">
		</div>
		<div>
			<input type='password' name='password' class="login_input" title="비밀번호 입력" placeholder="PASSWORD">
		</div>
		
		<div>
			<input type='submit' class='btn_login' value="SIGN IN">
		</div>
		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
</div>
  
  
  
  
  
  
  
  
  
  
  
  
  
</body>
<%-- <%@include file="../views/includes/footer.jsp" %> --%>
</html>

