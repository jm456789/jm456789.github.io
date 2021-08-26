---
layout: post  

title: "jsp&Servlet EL과 JSTL 기초 예제 " 
excerpt: ""

categories:
  - javascript&jsp&Servlet
tags:
  - [jsp, Servlet, jsp&Servlet]
  
toc: true
toc_sticky: true
 
date: 2021-08-20
last_modified_at: 2021-08-20
---

# EL

### el1.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<%
	 request.setAttribute("siteName", "JSPStudy.co.kr");
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h2>EL의 기본문법1</h2>
사이트명 : <b>${siteName}</b>

</body>
</html>
```

---

### scope1.jsp

```jsp
<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>Expression Language</title>
</head>
<body>
<h2>EL의 Scope1</h2>
<%
	int sum = 0;
	for(int i = 1 ; i <= 10 ; i++){ 
		sum += i;
	}
	request.setAttribute("sum", new Integer(sum));
%>
<jsp:forward page="scope2.jsp"/>
</body>
</html>
```

### scope2.jsp

```jsp
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	 pageContext.setAttribute("msg", "꿈은 이루어 진다.");
%>
<html>
<head>
<title>Expression Language</title>
</head>
<body>
<h2>EL의 Scope1</h2>
msg(pageScope로 받은값) :  <b>${pageScope.msg}</b><p/>
1에서 10까지 합(request로 받은값) : <b><%=request.getAttribute("sum") %></b><p/>
1에서 10까지 합(requestScope로 받은값) : <b>${requestScope.sum}</b><p/>
</body>
</html>
```

---

### scope3.jsp

```jsp
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	  session.setAttribute("id", "rorod");
	  application.setAttribute("siteName", "JSPStudy.co.kr");
%>
<html>
<head>
<title>Expression Language</title>
</head>
<body>
<h2>EL의 Scope2</h2>
<jsp:forward page="scope4.jsp"/>
</body>
</html>
```

### scope4.jsp

```jsp
<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>Expression Language</title>
</head>
<body>
<h2>EL의 Scope2</h2>
id(sessionScope로 받은값) :  <b>${sessionScope.id}</b><p/>
siteName(applicationScope로 받은값) : <b>${applicationScope.siteName}</b><p/>
</body>
</html>
```

---

### param1.html

```jsp
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Expression Language</title>
</head>
<body>
<h2>EL의 param1</h2>
<form method="post" action="param1.jsp">
	id : <input name="id"><br/>	
	pass : <input type="password" name="pwd"><br/>	
	
	name : <input name="name"><br/>	
	hobby : 독서<input type="checkbox" name="hobby" value="독서">
				여행<input type="checkbox" name="hobby" value="여행"> 
				게임<input type="checkbox" name="hobby" value="게임"> 
				영화<input type="checkbox" name="hobby" value="영화"> 
				운동<input type="checkbox" name="hobby" value="운동"><br/>
	
	<input type="submit" value="LOGIN">
</form>
</body>
</html>
```

### param1.jsp

```jsp
<%@ page contentType="text/html; charset=EUC-KR" %>

<% request.setCharacterEncoding("euc-kr"); %>

<html>
<head>
<title>Expression Language</title>
</head>
<body>
<h2>EL의 param1</h2>
id : ${param.id}<br/>
pwd : ${param["pwd"]}<br/>

name : ${param['name']}<br/>
hobby : ${paramValues.hobby[0]}&nbsp;
			${paramValues.hobby[1]}&nbsp;
			${paramValues.hobby[2]}&nbsp;
			${paramValues.hobby[3]}&nbsp;
			${paramValues.hobby[4]}

</body>
</html>
```

---

### header.jsp
```jsp
<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>Expression Language</title>
</head>
<body>
<h2>EL의 header 내장객체</h2>
  호스트명 : <b>${header.host}</b><p/>
 사용브라우저 : <b> ${header["user-agent"]}</b><p/>
 사용언어 : <b> ${header["accept-language"]}</b><p/>
</body>
</html>
```

---

### operators.jsp

```jsp
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		pageContext.setAttribute("J",31);
		pageContext.setAttribute("S",8);
		pageContext.setAttribute("P",22);
%>
<html>
<head>
<title>Expression Language</title>
</head>
<body>
<h2>EL의 Operators</h2>
<b>J = ${J}, S = ${S}, P = ${P}</b><p/> 
<b>산술 연산자</b><hr width="250" align="left"/>
&#36;{J + S} : ${J + S}<br/> 
&#36;{J - S} : ${J - S}<br/> 
&#36;{J * S} : ${J * S}<br/> 
&#36;{J / S} : ${J / S}<br/> 
&#36;{J % S} : ${J % S}<p/> 

<b>비교 연산자</b><hr width="250" align="left"/>
&#36;{J < S} : ${J lt S}<br/> 
&#36;{J > S} : ${J gt S}<br/>
&#36;{S <= P} : ${S le P}<br/>
&#36;{S >= P} : ${S ge P}<br/>
&#36;{(10*10) == 100} : ${(10*10) eq 100}<br/> 
&#36;{(10*10) != 100} : ${(10*10) ne 100}<p/>

<b>논리 및 조건 연산자</b><hr width="250" align="left"/>
&#36;{J > P && P < S} : ${J>P and P<S}<br/>
&#36;{J > P || P < S} : ${J>P or P<S}<br/>
&#36;{!(J == P)} : ${not(J==P)}<br/>
&#36;{(J == S)? "같다" : "다르다" } : ${(J==S) ? "같다" : "다르다"}<p/> 
</body>
</html>
```

---

### empty.jsp

```jsp
<%@ page contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<title>Expression Language</title>
</head>
<body>
<h2>EL의 Empty</h2>
name의 요청 여부 : <b>${empty param.name}</b><br/>
<a href="empty.jsp?name=rorod">name값이 있는 요청</a> || 
<a href="empty.jsp">name값이 없는 요청</a>
</body>
</html>
```

---

### array1.jsp

```jsp
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	  String studyArr[] = {"Java", "JSP", "Android", "Spring"};
      pageContext.setAttribute("study", studyArr);
%>
<html>
<head>
<title>Expression Language</title>
</head>
<body>
<h2>EL의 Array1</h2>
<b>Java Program 과목</b><hr width="150" align="left"/>
1. ${study[0] }<br/>
2. ${study[1] }<br/>
3. ${study[2] }<br/>
4. ${study[3] }<br/>
</body>
</html>
```

---

### array2.jsp

```jsp
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="java.util.ArrayList"%>
<%
	  ArrayList<String> familyList  = new ArrayList<String>();
	  String nameArr[] = {"simba", "rorod", "tina", "poli"};
	  /* for(int i=0;i<nameArr.length;i++){
		  familyList.add(nameArr[i]);
	  } */
	  for(String s : nameArr){
		  familyList.add(s);
	  }
      pageContext.setAttribute("Family",familyList);
%>
<html>
<head>
<title>Expression Language</title>
</head>
<body>
<h2>EL의 Array2</h2>
<b>Family List</b><hr width="135" align="left"/>
1. ${Family[0] }<br/>
2. ${Family[1] }<br/>
3. ${Family[2] }<br/>
4. ${Family[3] }<br/>
</body>
</html>
```

---

### ELBean.java

```java
package ch18;

public class ELBean {
	private String siteName;

	public String getSiteName() {
		return siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
}

```

### beans.html

```jsp
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Expression Language</title>
</head>
<body>
<h2>EL의 Beans</h2>
<form method="post" action="beans.jsp">
	사이트명 : <input name="siteName"><br/>	
	<input type="submit" value="SEND">
</form>
</body>
</html>
```

### beans.jsp

```jsp
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="bean" class="ch18.ELBean"/>
<jsp:setProperty name="bean" property="siteName"/>
<html>
<head>
<title>Expression Language</title>
</head>
<body>
<h2>EL의 Beans</h2>
빈즈액션 태그<br/> 
사이트명 : <jsp:getProperty name="bean"  property="siteName"/><p/>
EL Beans <br/>
사이트명 : ${bean.siteName}
</body>
</html>
```

---

### ELMethod.java

```java
package ch18;

import java.text.DecimalFormat;

public class ELMethod {
	public static String comma(int number) {
		DecimalFormat df = new DecimalFormat("#,##0");
		return df.format(number);
	}
}
```

### tlds/Functions.tld

```java
<taglib xmlns="http://java.sun.com/xml/ns/javaee" version="2.1">
    <tlib-version>1.0</tlib-version>
    <jsp-version>2.2</jsp-version>
    <short-name>JSPTag</short-name>
    <function>
        <name>comma</name>
        <function-class>ch18.ELMethod</function-class>
        <function-signature>String comma(int)</function-signature>
    </function>
</taglib>
```

### web.xml

```java
//추가 
<jsp-config>
	  <taglib>
	  	<taglib-uri>/Functions.tld</taglib-uri>
	  	<taglib-location>/WEB-INF/tlds/Functions.tld</taglib-location>
	  </taglib>
	</jsp-config>
```

### elMethod.jsp

```jsp
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="m" uri="/WEB-INF/tlds/Functions.tld"%>
<html>
<head>
<title>Expression Language</title>
</head>
<body>
<h2>EL의 정적 메소드</h2>
123456789를 1000단위 구분 기호(,)로 표시하시오.<p/>
<b>result : ${m:comma(123456789)}</b> 
</body>
</html>
```

---

# JSTL

### coreTags1.jsp

```jsp
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	 String str1= "JAVA의 JSTL";	
	 String str2= null;	
%>
<html>
<head>
<title>JSTL</title>
</head>
<body>
<h2>Core Tags1</h2>
<c:set var="str3" value="JSPStudy" scope="page"/>
<c:set var="str4" value="JSTL" scope="session"/>
- <c:out value="<%=str1%>" default="기본출력값"/><br/>
- <c:out value="<%=str2%>" default="기본출력값"/><br/>
- <c:out value="${str3}" default="기본출력값"/><br/>
- <c:out value="${str4}" default="기본출력값"/><br/>
<c:remove var="str4"/>
- ${str3}의 ${str4} ...<p/>
<%String s = (String)pageContext.getAttribute("str3");%>
-<font color="red"><b><%=s%></b></font>
</body>
</html>
```
