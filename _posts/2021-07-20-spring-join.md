---
layout: post  

title: "Spring 01. 회원가입, 로그인, 회원정보수정 "
excerpt: ""

categories:
  - Spring
tags:
  - [Spring]
  
toc: true
toc_sticky: true
 
date: 2021-07-20
last_modified_at: 2021-07-20
---

# SQL - user 생성 및 테이블 생성, 행 추가

### sql plus

id:system / pw:Manager1

cnn system/Manager1

create user c##jane identified by 1234;

grant connect, resource to c##jane;

# oracle or sql plus(commit)

접속 + -> Name, 사용자이름, 비밀번호 -> 저장 -> 접속

### 테이블 생성 

create table counter(   
    ID number primary key,   
    Name varchar(20),   
    phoneNumber varchar(20)   
);

### 행 추가

insert into member(id, pw, name, phone) values('aa','123','홍길동','010-0000-0002');

### 행 추가 전에 권한 줘야 함

시스템에 다시 접속해서   
alter user c##jane default tablespace users quota unlimited on users;

---

# eclipsed에서 sqldeveloper 연결하기

eclipse - 해당 Dynamic Web Project - src - main - webapp - WEB-INF - lib 폴더 안에   
C:\app\User\product\18.0.0\dbhomeXE\jdbc\lib 폴더 안에 있는 ojdbc8.jar 파일 복사해서 붙여넣기

---

# join.html

```jsp
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form action="JoinYes" method="post">
	이름 : <input type="text" name="name" size="20" /> <br />
	아이디 : <input type="text" name="id" size="20" /><br />
	비밀번호 : <input type="text" name="pw" size="20" /><br />
	전화번호 : <select name="phone1">
		<option value="010">010</option>
		<option value="016">016</option>
		<option value="017">017</option>
		<option value="018">019</option>
		<option value="019">011</option>
	</select>
	<input type="text" name="phone2" size="10" /> - <input type="text" name="phone3" size="10" /><br />
	성별 : <input type="radio" name="gender" value="man" /> 남
	<input type="radio" name="gender" value="woman" /> 여<br />
	<input type="submit" value="회원가입" />  
	<input type="reset" value="취소" />  
</form>

</body>
</html>
```

# JoinYes.java

```java
package com.sub.ex;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JoinYes
 */
@WebServlet("/JoinYes")
public class JoinYes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connect;
	private Statement stmt;
	private String name, id, pw, ph1, ph2, ph3, gen;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JoinYes() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("doGet()");
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		System.out.println("doPost()");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ActionDo()");
		request.setCharacterEncoding("euc-kr");

		name = request.getParameter("name");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		ph1 = request.getParameter("phone1");
		ph2 = request.getParameter("phone2");
		ph3 = request.getParameter("phone3");
		gen = request.getParameter("gender");

		String query = "insert into member values('" + name + "', '" + id + "','" + pw + "','" + ph1 + "','" + ph2 + "','" + ph3 + "','" + gen + "')";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "c##jane", "1234");
			stmt = connect.createStatement();
			int n = stmt.executeUpdate(query);

			if(n == 1) {
				System.out.println("insert sucess");
				response.sendRedirect("joinResult.jsp");
			}else {
				System.out.println("insert fail");
				response.sendRedirect("join.html");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(connect != null) connect.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}

```

# joinResult.jsp

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

회원가입이 정상 처리되었습니다. <br />
<a href="login.html">Login</a>

</body>
</html>
```

# login.html

```jsp
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form action="LoginYes" method="post">
	id : <input type="text" name="id" /><br />
	pw : <input type="text" name="pw" />
	<input type="submit" value="Login" />	
</form>

</body>
</html>
```

# LoginYes.java

```java
package com.sub.ex;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginYes
 */
@WebServlet("/LoginYes")
public class LoginYes extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Connection connect;
    private Statement stmt;
    private ResultSet resultSet;
    private String name, id, pw, ph1, ph2, ph3, gen;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginYes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		
		String query = "select * from member where id='" + id + "' and pw = '" + pw + "'";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connect =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "c##jane", "1234");
			stmt = connect.createStatement();
			resultSet = stmt.executeQuery(query);
			
			while(resultSet.next()) {
				id = resultSet.getString("id");
				pw = resultSet.getString("pw");
				name = resultSet.getString("name");
				ph1 = resultSet.getString("phone1");
				ph2 = resultSet.getString("phone2");
				ph3 = resultSet.getString("phone3");
				gen = resultSet.getString("gender");
			}
			
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("name", name);
			httpSession.setAttribute("id", id);
			httpSession.setAttribute("pw", pw);
			
			response.sendRedirect("loginResult.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(connect != null) connect.close();
				if(resultSet != null) resultSet.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}

```

# loginResult.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%!
	String name, id, pw;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	name = (String)session.getAttribute("name");
	id = (String)session.getAttribute("id");
	pw = (String)session.getAttribute("pw");
%>

<%=name %>님 안녕하세요 <br />
<a href="modify.jsp">회원정보 수정</a>

</body>
</html>
```

# modify.jsp

```jsp
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%!
	Connection connect;
	Statement stmt;
	ResultSet resultSet;
	String name, id, pw, ph1, ph2, ph3, gen;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	id = (String)session.getAttribute("id");

	String query = "select * from member where id = '" + id + "'";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	connect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "c##jane", "1234");
	stmt = connect.createStatement();
	resultSet = stmt.executeQuery(query);
	
	while(resultSet.next()){
		id = resultSet.getString("id");
		pw = resultSet.getString("pw");
		name = resultSet.getString("name");
		ph1 = resultSet.getString("phone1");
		ph2 = resultSet.getString("phone2");
		ph3 = resultSet.getString("phone3");
		gen = resultSet.getString("gender");
	}
%>

<form action="ModifyOk" method="post">
	이름 : <input type="text" name="name" size="20" value=<%=name %>> <br />
	아이디 : <%=id %><br />
	비밀번호 : <input type="text" name="pw" size="20" /> <br />
	전화번호 : <select name="phone1">
		<option value="010">010</option>
		<option value="016">016</option>
		<option value="017">017</option>
		<option value="018">019</option>
	</select>
	<input type="text" name="phone2" size="10" value=<%=ph2 %> /> - <input type="text" name="phone3" size="10" value=<%=ph3 %> />
	<%
		if(gen.equals("man")){
	%>
			성별 : <input type="radio" name="gender" value="man" checked="checked" /> 남
			 <input type="radio" name="gender" value="woman" /> 여 <br />
	<%
		}else{
	%>		 
		성별 : <input type="radio" name="gender" value="man" /> 남
			 <input type="radio" name="gender" value="woman" checked="checked" /> 여 <br />
	<%
		}
	%>	
	<input type="submit" value="정보수정"> <input type="reset" value="초기화" />	 

</form>

</body>
</html>
```

# ModifyOk.java

```java
package com.sub.ex;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ModifyOk
 */
@WebServlet("/ModifyOk")
public class ModifyOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connect;
    private Statement stmt;
    private String name, id, pw, ph1, ph2, ph3, gen;
    HttpSession httpSession;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("EUC-KR");
		httpSession = request.getSession();
		
		name = request.getParameter("name");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		ph1 = request.getParameter("phone1");
		ph2 = request.getParameter("phone2");
		ph3 = request.getParameter("phone3");
		gen = request.getParameter("gender");
		
		String sid = (String)httpSession.getAttribute("id");
		System.out.println(sid);
		
		if(pwCorfime()) {
			System.out.println("OK");
			
			//String query = "update member set name='" + name + "' , phone1 = '" + ph1 + "', phone2 ='" + ph2 + "', phone3 = '" + ph3 + "' , gender = '"+ gen + "'";
			String query = "update member set name='" + name + "' , phone1 = '" + ph1 + "', phone2 ='" + ph2 + "', phone3 = '" + ph3 + "' , gender = '"+ gen + "' where id = '" + sid + "'";
					
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				connect =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "c##jane", "1234");
				stmt = connect.createStatement();
				int n = stmt.executeUpdate(query);
				
				if(n == 1) {
					System.out.println("update success");
					httpSession.setAttribute("name", name);
					response.sendRedirect("modifyResult.jsp");
				}else {
					System.out.println("update fail");
					response.sendRedirect("modify.jsp");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(stmt != null) stmt.close();
					if(connect != null) connect.close();
				}catch(Exception e) {}
			}
		}else {
			System.out.println("NG");
			try {
				response.sendRedirect("modify.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	private boolean pwCorfime() {
		boolean rs = false;
		
		String sessionPw = (String)httpSession.getAttribute("pw");
		
		if(sessionPw.equals(pw)) {
			rs = true;
		}
		
		return rs;
	}
	
}

```
