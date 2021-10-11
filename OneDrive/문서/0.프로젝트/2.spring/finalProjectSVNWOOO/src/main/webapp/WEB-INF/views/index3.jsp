<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<%@include file="includes/header.jsp" %>

<h1>/sample/admin page</h1>


<p>principal principal : <sec:authentication property="principal"/></p> 
<br /><br />
<p>MemberVO member : <sec:authentication property="principal.member"/></p> 
<br /><br />
<p>사용자이름 e_name : <sec:authentication property="principal.member.e_name"/></p> 
<br /><br />
<p>사용자아이디 username : <sec:authentication property="principal.username"/></p> 
<br /><br />
<p>사용자 권한 리스트 authList  : <sec:authentication property="principal.member.authList"/></p> 
<br /><br />
<a href="/customLogout">Logout</a>

<br /><br /><br />

<p>e_id  : <input type="text" name="e_id" value="<sec:authentication property='principal.member.e_id'/>" /></p>




<%@include file="includes/footer.jsp" %>