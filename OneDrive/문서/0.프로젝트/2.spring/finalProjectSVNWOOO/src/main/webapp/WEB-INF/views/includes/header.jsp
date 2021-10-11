<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.zerock.domain.AuthVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
Authentication auth = SecurityContextHolder.getContext().getAuthentication();

Object principal=auth.getPrincipal();
String name="";
if(principal !=null&&principal instanceof AuthVO){
   name=((AuthVO)principal).getAuth();
}
%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>WOOO</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16"  href="/resources/images/favicon.png">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="theme-color" content="#ffffff">        
<link rel="stylesheet" type="text/css" href="/resources/css/import.css" />
<script type="text/javascript" src="/resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/resources/js/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>



</head>
<body>
   <div id="wrap">

      <!-- gnb -->
      <div class="gnb">
         <h1>
            <a href="/index"><img src="/resources/images/logo9.png" alt="wm" style="width:200px" /></a>  
         </h1>
         <ul>
            <li><a href="/mg/mgList" class="m_register">사원조회</a></li>
            <li><a href='/holiday/list?e_id=<sec:authentication property="principal.member.e_name"/>' class="m_approval">업무 승인</a></li>
            <sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')">
            	<li>
            		<a href="/holidayOK/list?e_id=<sec:authentication property='principal.member.e_name'/>" class="m_approvalP">업무 승인 결재</a>
                </li>
            </sec:authorize>
            <li><a href="/calendar/calendar" class="m_calendar">캘린더</a></li>            
            <li><a href="/message/messageList?m_eid1=<sec:authentication property='principal.member.e_name'/>" class="m_receiveM">받은쪽지함</a></li>
            <li><a href="/messageSe/messageSendList?m_eid2=<sec:authentication property='principal.member.e_name'/>" class="m_sendM">보낸쪽지함</a></li>
            <li><a href="/meeting/meeting1" class="m_zoom">화상회의</a></li>
            <li><a href="/remote?e_id=<sec:authentication property='principal.username'/>" class="m_remote">원격</a></li>
            <li><a href="/board/list" class="m_notice">공지사항</a></li>
         </ul>
      </div>
      <!-- gnb -->

      <!-- contents -->
      <div class="contents">

         <!-- header -->
         <div class="header">
            <div class="header_right_group">
               <sec:authorize access="isAuthenticated()">
                  <p>
                     <sec:authentication property="principal.member.e_name" />
                     님 반갑습니다.
                  </p>
               </sec:authorize>
               <ul class="h_icon_group">
                  <li><a
                     href='/member/modify?e_id=<sec:authentication property="principal.username"/>'
                     class="h_top_my" title="마이페이지 수정">정보수정</a></li>
                  <li><a href="/customLogout" class="h_top_logout" title="로그아웃">로그아웃</a></li>
               </ul>
            </div>
         </div>
         <!-- header -->

         <!-- cont_wrap -->
         <div class="cont_wrap">