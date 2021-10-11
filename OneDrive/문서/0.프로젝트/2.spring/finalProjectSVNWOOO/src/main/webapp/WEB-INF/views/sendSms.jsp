<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<form method="post" id="smsForm" action="/sendSms">
    <ul>
      <li>보낼사람 : <input type="text" name="from"/></li>
      <li>내용 : <textarea name="text"></textarea></li>
      <li><input type="submit" value="전송하기" /></li>
    </ul>
  </form>

  <script>
    function sendSMS(pageName){

    	console.log("문자를 전송합니다.");
    	$("#smsForm").attr("action", pageName + "");
    	$("#smsForm").submit();
    }
  </script>