---
layout: post 

title: "Spring 02. 게시판 만들기 전 단계 / DAO, DTO를 이용하여 DB에 있는 정보 가져오기, DB에 insert 하기 / EL, JSTL"
excerpt: ""

categories:
  - Spring
tags:
  - [Spring]
  
toc: true
toc_sticky: true
 
date: 2021-07-26
last_modified_at: 2021-07-26
---

# DAO, DTO를 이용하여 DB에 있는 정보 가져오기

> **클라이언트** -> request -> **WAS** -> DAO -> **DB**   
> **클라이언트** <- response <- **WAS** <- DTO <- **DB**   

* DAO(Data Access Object): DB에 접속해서 데이터 추가/삭제/수정 등의 작업을 하는 클래스   
* DTO(Data Transfer Object)

### MemberDTO.java

```java
package com.jsp.daoTo;

public class MemberDTO {
	private String name;
	private String id;
	private String pw;
	private String ph1;
	private String ph2;
	private String ph3;
	private String gen;
	
	public MemberDTO(String name, String id, String pw, String ph1, String ph2, String ph3, String gen) {
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.ph1 = ph1;
		this.ph2 = ph2;
		this.ph3 = ph3;
		this.gen = gen;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPh1() {
		return ph1;
	}
	public void setPh1(String ph1) {
		this.ph1 = ph1;
	}
	public String getPh2() {
		return ph2;
	}
	public void setPh2(String ph2) {
		this.ph2 = ph2;
	}
	public String getPh3() {
		return ph3;
	}
	public void setPh3(String ph3) {
		this.ph3 = ph3;
	}
	public String getGen() {
		return gen;
	}
	public void setGen(String gen) {
		this.gen = gen;
	}
}

```

### MemberDAO.java

```java
package com.jsp.daoTo;

import java.sql.Connection;
//import java.sql.DriverManager;  //Server-context.xml에 추가해서 삭제해도 됌.
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
//	private String url = "jdbc:oracle:thin:@localhost:1521:xe";  //Server-context.xml에 추가해서 삭제해도 됌.
//	private String uid = "c##jane";
//	private String upw = "1234";
	
	private DataSource dSource;  //위에 대신 이거 추가!!
	
	private String name, id, pw, ph1, ph2, ph3, gen;
	
	public MemberDAO() {
//		try {  //Server-context.xml에 추가해서 삭제해도 됌.
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//		} catch (ClassNotFoundException e) {			
//			e.printStackTrace();
//		}
		
		try {  //위에 대신 이거 추가!!
			Context context = new InitialContext();
			dSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle18c");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberDTO> memberSelect(){
		ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			//con = DriverManager.getConnection(url, uid, upw);  //Server-context.xml에 추가해서 삭제해도 됌.
			con = dSource.getConnection(); //위에 대신 이거 추가!!
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from member");
			
			while(rs.next()) {
				name = rs.getString("name");
				id = rs.getString("id");
				pw = rs.getString("pw");
				ph1 = rs.getString("phone1");
				ph2 = rs.getString("phone2");
				ph3 = rs.getString("phone3");
				gen = rs.getString("gender");
				
				MemberDTO dto = new MemberDTO(name, id, pw, ph1, ph2, ph3, gen);
				dtos.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)rs.close();
				if(stmt != null)stmt.close();
				if(con != null)con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
	}
}

```

### memberSelect.jsp

```jsp
<%@page import="com.jsp.daoTo.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jsp.daoTo.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>DB에 있는 정보 꺼내오기?</title>
</head>
<body>

<%
	MemberDAO memberDAO = new MemberDAO();
	ArrayList<MemberDTO> dtos = memberDAO.memberSelect();
	
	for(int i = 0; i<dtos.size(); i++){
		MemberDTO dto = dtos.get(i);
		String name = dto.getName();
		String id = dto.getId();
		String pw = dto.getPw();
		String phone = dto.getPh1() + "-" + dto.getPh2() + "-" + dto.getPh3();
		String gender = dto.getGen();
		out.println("이름 : " + name + ", 아이디 : " + id + ", 비밀번호 : " + pw + ", 연락처" + phone + ", 성별 : " + gender + "<br />");
	}
%>

</body>
</html>
```

---

# PreparedStatement 이용해서 DB에 insert 하기

> PreparedStatement : Statement 객체의 단점을 보완할 수 있음

### memDataInsert.jsp

```jsp
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%!
	Connection conn;
	PreparedStatement preStmt;
	ResultSet rsSet;
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "c##jane";
	String upw = "1234";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>DB에 데이터 insert</title>
</head>
<body>

<%
	Class.forName(driver);
	conn = DriverManager.getConnection(url, uid, upw);
	int n;
	String query = "insert into mem(id, pw, name, phone) values(?,?,?,?)";
	preStmt = conn.prepareStatement(query);
	
	preStmt.setString(1, "aaa");
	preStmt.setString(2, "1111");
	preStmt.setString(3, "가나다1");
	preStmt.setString(4, "010-1111-1111");
	n = preStmt.executeUpdate();
	
	preStmt.setString(1, "bbb");
	preStmt.setString(2, "2222");
	preStmt.setString(3, "가나다2");
	preStmt.setString(4, "010-2222-2222");
	n = preStmt.executeUpdate();
	
	preStmt.setString(1, "ccc");
	preStmt.setString(2, "3333");
	preStmt.setString(3, "가나다3");
	preStmt.setString(4, "010-3333-3333");
	n = preStmt.executeUpdate();
	
	if(n == 1){
		out.println("insert success");
	}else{
		out.println("insert fail");
	}
	
	if(preStmt != null) preStmt.close();
	if(conn != null) conn.close();
%>

<br />
<a href="memberDataView.jsp">회원정보 보기</a>

</body>
</html>
```

---

# Statement 또는 PreparedStatement 이용해서 DB에 있는 테이블 값 가져오기

### memberDataView.jsp

```jsp
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%!
	Connection conn;
	Statement stmt;  //방법 1.
	PreparedStatement preStmt;  //방법 2.
	ResultSet rs;
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "c##jane";
	String upw = "1234";	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>테이블에 저장된 값 View</title>
</head>
<body>

<%
	Class.forName(driver);
	conn = DriverManager.getConnection(url, uid, upw);	
	String query = "select * from mem";
	
	//방법 1.
	stmt = conn.createStatement();
	rs = stmt.executeQuery(query);
	
	//방법 2.
	/* preStmt = conn.prepareStatement(query);
	rs = preStmt.executeQuery(); */

	while(rs.next()) {
		String id = rs.getString("id");
		String pw = rs.getString("pw");
		String name = rs.getString("name");
		String phone = rs.getString("phone");
		
		out.println("아이디 : " + id + ", 비밀번호 : " + pw + ", 이름 : " + name + ", 전화번호 : " + phone + "<br />");
	}	
%>

</body>
</html>
```

---

# Servers - context.xml에 삽입하여 드라이버 소스 한번만 입력?

> 커넥션 풀(DBCP) : 미리 객체?를 만들어놓고 접속하면 쓰세요~ (50개?)

### Servers - context.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--><!-- The contents of this file will be loaded for each web application --><Context>

    <!-- Default set of monitored resources. If one of these changes, the    -->
    <!-- web application will be reloaded.                                   -->
    <WatchedResource>WEB-INF/web.xml</WatchedResource>
    <WatchedResource>WEB-INF/tomcat-web.xml</WatchedResource>
    <WatchedResource>${catalina.base}/conf/web.xml</WatchedResource>

    <!-- Uncomment this to disable session persistence across Tomcat restarts -->
    <!--
    <Manager pathname="" />
    -->
    
    <!-- 이부분 추가! -->
    <Resource
    name = "jdbc/Oracle18c"
    auth = "Container"
    driverClassName = "oracle.jdbc.driver.OracleDriver"
    url = "jdbc:oracle:thin:@localhost:1521:xe"
    username = "c##jane"
    password = "1234"
    type = "javax.sql.DataSource"
    maxActive = "50"
    maxWait = "1000"
    />
    
</Context>
```

---

# EL(Expression Language) 표기법

> EL(Expression Language) 표기법 : 표현식이나 액션 태그를 대신해서 값을 표현하는 언어    
> <%= value %> => ${value}

##### EL 연산자(산술, 관계(==, !=, >, <. >=, <=), 조건(?t:f), 논리(&&, ||)

### el.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%=10 %><br />
<%="ok" %><br />

<hr>

${10}<br />
${"ok"}<br />

<hr>

${1+2}<br />
${20>9 }<br />
${1>2 ? "true" : "false"}<br />
${10<90 && 20 == 20}


</body>
</html>
```

---

# 액션 태그(jsp:getProperty)로 사용되는 EL (자바빈즈(get, set) 사용?)

* <jsp:getProperty name=“member” property=“name”/>
* ${member.name}

### MemberInfo.java

```java
package com.jsp.daoTo;

public class MemberInfo {
	private String name;
	private String id;
	private String pw;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	
}

```

### expressEl.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<jsp:useBean id="member" class="com.jsp.daoTo.MemberInfo" scope="page" />
<jsp:setProperty property="name" name="member" value="홍길동" />
<jsp:setProperty property="id" name="member" value="abc" />
<jsp:setProperty property="pw" name="member" value="1234" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1>액션태그를 이용한 출력</h1>
이름 : <jsp:getProperty property="name" name="member"/><br />
아이디 : <jsp:getProperty property="id" name="member"/><br />
비밀번호 : <jsp:getProperty property="pw" name="member"/><br />

<hr>

<h1>EL 표기법을 이용한 출력</h1>
이름 : ${member.name }<br />
아이디 : ${member.id }<br />
비밀번호 : ${member.pw }<br />

</body>
</html>
```

---

# EL을 위한 내장객체

* pageScope: page 객체를 참조하는 객체
* requestScope: request 객체를 참조하는 객체
* sessionScope: session 객체를 참조하는 객체
* applicationScope: application 객체를 참조하는 객체

* param : 요청 파라미터를 참조하는 객체
* paramValues: 요청 파라미터(배열)을 참조하는 객체

### objEl.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form action="objOK.jsp" method="get">
	아이디:<input type="text" name="id" /><br />
	비밀번호:<input type="password" name="pw" /><br />
	<input type="submit" value="Login" />
</form>

<%
	application.setAttribute("application_name", "app_value");
	session.setAttribute("session_name", "ss_value");
	pageContext.setAttribute("page_name", "page_value");
	request.setAttribute("request_name", "request_value");
%>

</body>
</html>
```

### objOK.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	String ii = request.getParameter("id");
	String ww = request.getParameter("pw");
%>

아이디 : <%=ii %><br />
비밀번호 : <%=ww %><br />

<hr>

아이디 : ${param.id }<br />
비밀번호 : ${param.pw }<br />

<hr>

아이디 : ${param["id"] }<br />
비밀번호 : ${param["pw"] }<br />

<hr>

applicationScope : ${applicationScope.application_name}<br />
sesionScope : ${sessionScope.session_name}<br />  <!-- 저장소에 저장된 데이터 활용 가능 -->
pageScope : ${pageScope.page_num }<br />  <!-- 범위가 현재 문서 -->
requestScope : ${requestScope.request_name }  <!-- 범위가 현재 문서 -->

</body>
</html>
```

---

# JSTL (c:set 등)

JSTL(Jsp Standard Tag Libary) : jsp 파일의 전체적인 코드의 가독성을 개선하기 위해   

설치 :    
https://tomcat.apache.org/download-taglibs.cgi에서 아래 4개 다 다운받아서 lib에 넣어야함

* taglibs-standard-compat-1.2.5.jar
* taglibs-standard-jstlel-1.2.5.jar
* taglibs-standard-spec-1.2.5.jar
* taglibs-standard-impl-1.2.5.jar

### JSTL 라이브러리

Core 라이브러리는 기본적인 라이브러리로 출력/제어문 기능이 포함되어 있음.    
<%@ taglib uri=http://java.sun.com/jsp/jstl/core prefix=“c“ %>

> 출력 태그: \<c:out\>   
> \<c:out value=“출력값” default=“기본값” escapeXml = “true or false”\>
>  
> 변수 설정 태그:\<c:set\>   
> \<c:set var=“변수명” value=“설정값” target=“객체” property=“값” scope=“범위”\>
> 
> 변수를 제거하는 태그:\<c:remove\>   
> \<c:remove var=“변수명” scope=“범위”\>
> 
> 예외 처리 태그:\<c:catch\>   
> \<c:catch var=“변수명”\>
> 
> 제어문(if) 태그:\<c:if\>   
> \<c:if test=“조건” var=“조건 처리 변수명” scope=“범위”\>
> 
> 제어문(switch) 태그:\<c:choose\>    
> \<c:choose\>    
> \<c:when test=“조건”/> 처리 내용/</c:when\>    
> \<c:otherwise>처리내용</c:otherwise\>    
> \</c:choose\>
> 
> 반복문(for) 태그:\<c:forEach\>    
> \<c:forEach items=“객체명” begin=“시작 인덱스” end=“끝 인덱스” step=“증감식” var=“변수” varStatus=“상태변수”\>    
> 
> 페이지 이동 태그:\<c:redirect\>     
> \<c:redirect url=“url”\>
> 
> 파라미터 전달 태그:\<c:param\>   
> \<c:param name=“파라미터명” value=“값”\>

```jsp
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<c:set var="varName" value="varValue" />
varName : <c:out value="${varName }" /><br />

varName : ${varName }<br />

<hr>

<c:remove var="varName" />
varName : <c:out value="${varName }" /><br />

<hr>

<c:catch var="error">
<%= 2/0 %>
</c:catch>

<hr>

<c:if test="${1+2 == 3 }">
 1+2 = 3  <!-- 참이면 출력 -->
</c:if>

<hr>

<c:if test="${1+2 != 3 }">
 1+2 != 3  
</c:if>

<hr>

<c:forEach var="fEach" begin="0" end="20" step="3" >
	${fEach}
</c:forEach>

<hr>

<c:forEach var="fEach" begin="0" end="20" step="3">
	<c:set var="sum" value="${sum+fEach }" />
</c:forEach>
${sum }


</body>
</html>
```
