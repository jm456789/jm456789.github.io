---
layout: post 

title: "Spring 03. DB에 저장하여 사용한 로그인, 회원가입, 메인, 로그아웃, 정보수정, 싱글톤개념"
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

---

라이브러리 폴더에 ojdbc8.jar 파일 넣고,   
Servers - context.xml에 Resource ~~ 추가 되어있어야 함.   
자세한건 이전 포스트 jsp&Servlet 02. 게시판 만들기 전 단계 26 Jul 2021에서..

---

### MemberDto.java

```java
package com.jsp.ex;

import java.sql.Timestamp;

public class MemberDto {
	private String id;
	private String pw;
	private String name;
	private String email;
	private Timestamp rDate;
	private String address;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getrDate() {
		return rDate;
	}
	public void setrDate(Timestamp rDate) {
		this.rDate = rDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}

```

### MemberDao.java

```java
package com.jsp.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDao {
	public static final int MEMBER_NONEXISTENT = 0;  //final 상수 만들때는 static도 붙여주기!
	public static final int MEMBER_EXISTENT = 1; 
	public static final int MEMBER_JOIN_FAIL = 0; 
	public static final int MEMBER_JOIN_SUCCESS = 1; 
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0; 
	public static final int MEMBER_LOGIN_SUCCESS = 1; 
	public static final int MEMBER_LOGIN_IS_NOT = 1;	
	private static MemberDao instance = new MemberDao();  //싱글톤.  //자기자신 객체 생성. 필드로 포함. 객체타입의 필드
	
	private MemberDao() {  //싱글톤.		
	}
	
	public static MemberDao getInstance() {  //싱글톤. 자세한건 SingleTone.java 확인
		return instance;
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	public int insertMember(MemberDto dto) {  //join.jsp 에서 가입시 사용
		int ri = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "insert into members values(?,?,?,?,?,?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setTimestamp(5, dto.getrDate());
			pstmt.setString(6, dto.getAddress());
			ri = pstmt.executeUpdate();  //insert된 ri는 1행이라 ri에 1이 들어감. 변경된 레코드의 개수 정수값으로 반환. 1
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return ri;
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	private Connection getConnection() {
		Context context = null;
		DataSource dataSource = null;  //DBCP. Servers-context.xml에 소스 추가한걸 사용하겠다
		Connection conn = null;
		
		try {
			context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle18c");
			conn = dataSource.getConnection();  //DBCP로 이미 만들어져있는걸 가져와서 쓰겠다
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	public int confirmId(String id) {  //회원가입시 아이디가 이미 있는지 확인
		int ri = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select id from members where id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			
			if(set.next()) {  //아이디가 있으면
				ri = MemberDao.MEMBER_EXISTENT;  //ri 에 MEMBER_EXISTENT 값 1이 담김
			}else {
				ri = MemberDao.MEMBER_NONEXISTENT;  //ri 에 MEMBER_NONEXISTENT 값 0이 담김
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				set.close();
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return ri;  //위에 if문에서 담긴 값 리턴
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	public int userCheck(String id, String pw) {  //로그인시 아이디와 비밀번호 맞는지 체크?
		int ri = 0;
		String dbPw;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select pw from members where id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			
			if(set.next()) {  //아이디가 있으면
				dbPw = set.getString("pw");  //레코드에서 pw의 값을 문자로 변호나해서 dbPw에 저장
				
				if(dbPw.equals(pw)) {  //DB에있는 pw와 입력한 pw 비교
					ri = MemberDao.MEMBER_JOIN_SUCCESS;  //ri 에 MEMBER_JOIN_SUCCESS 값 1이 담김
				}else {
					ri = MemberDao.MEMBER_LOGIN_PW_NO_GOOD;  //ri 에 MEMBER_LOGIN_PW_NO_GOOD 값 0이 담김
				}				
			}else {
				ri = MemberDao.MEMBER_LOGIN_IS_NOT;  //ri 에 MEMBER_LOGIN_IS_NOT 값 1이 담김
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				set.close();
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return ri;  //위에 if문에서 담긴 값 리턴
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	public MemberDto getMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select * from members where id = ?";
		MemberDto dto = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			
			if(set.next()) { //dto에 필드 값 설정
				dto = new MemberDto();
				dto.setId(set.getString("id"));
				dto.setPw(set.getString("pw"));
				dto.setName(set.getString("name"));
				dto.setEmail(set.getString("email"));
				dto.setrDate(set.getTimestamp("rDate"));
				dto.setAddress(set.getString("address"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				set.close();
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	public int updateMember(MemberDto dto) {  //회원가입시 DB에 정보 업데이트? 회원가입 후 정보수정?
		int ri = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "update members set pw=?, email=?, address=? where id=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getId());
			ri = pstmt.executeUpdate();			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return ri;
	}
	
}

```

---

# 로그인

### login.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<% if(session.getAttribute("ValidMem") != null) { %>
	<jsp:forward page="main.jsp"></jsp:forward>
<%} %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form action="LoginOk.jsp" method="post">
	아이디 : <input type="text" name="id" value="<%if(session.getAttribute("id") != null) out.println(session.getAttribute("id")); %>" /><br />
	비밀번호 : <input type="password" name="pw" /><br />
	<input type="submit" value="로그인" />
	<input type="button" value="회원가입" onclick="javascript:window.location = 'join.jsp'" />
</form>

</body>
</html>
```

# 로그인 확인

### LoginOk.jsp

```jsp
<%@page import="com.jsp.ex.MemberDao"%>
<%@page import="com.jsp.ex.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDao dao = MemberDao.getInstance();
	
	int checkNum = dao.userCheck(id, pw);
	
	if(checkNum == -1){
%>
	<script language="javascript">
		alert("아이디가 존재하지 않습니다.");
		history.go(-1);
	</script>
<%
	}else if(checkNum == 0){
%>
	<script language="javascript">
		alert("비밀번호가 틀립니다.");
		history.go(-1);
	</script>
<%
	}else if(checkNum == 1){
		MemberDto dto = dao.getMember(id);
		
		if(dto == null){
%>			
	<script language="javascript">
		alert("존재하지 않는 회원입니다.");
		history.go(-1);
	</script>
<%
		}else{
			String name = dto.getName();
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("ValidMem", "yes");
			response.sendRedirect("main.jsp");
		}
	}
%>
		
	


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
```

---

# 회원가입

### join.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script language="javascript" src="members.js" charset="utf-8"></script>
</head>
<body>

<form action="joinOk.jsp" method="post" name="reg_frm">
	<p>아이디 : <input type="text" name="id" /></p>
	<p>비밀번호 : <input type="password" name="pw" /></p>
	<p>비밀번호 확인 : <input type="password" name="pw_check" /></p>
	<p>이름 : <input type="text" name="name" /></p>
	<p>메일 : <input type="text" name="email" /></p>
	<p>주소 : <input type="text" name="address" /></p>
	<input type="button" value="회원가입" onclick="infoConfirm()" />
	<input type="reset" value="취소" onclick="javascript:window.location='login.jsp'" />
</form>

</body>
</html>
```

### members.js

```java
function infoConfirm(){  //회원가입시 사용. join.jsp
	if(document.reg_frm.id.value.length == 0){
		alert("아이디는 필수사항입니다.");
		reg_frm.id.focus();
		return;
	}
	if(document.reg_frm.id.value.length < 4){
		alert("아이디는 4글자 이상이어야 합니다.");
		reg_frm.id.focus();
		return;
	}
	if(document.reg_frm.pw.value.length == 0){
		alert("비밀번호는 필수사항입니다.");
		reg_frm.pw.focus();
		return;
	}
	if(document.reg_frm.pw.value !== document.reg_frm.pw_check.value){
		alert("비밀번호가 일치하지 않습니다.");
		reg_frm.pw.focus();
		return;
	}
	if(document.reg_frm.name.value.length == 0){
		alert("이름은(는) 필수사항입니다.");
		reg_frm.name.focus();
		return;
	}
	if(document.reg_frm.email.value.length == 0){
		alert("이메일은 필수사항입니다.");
		reg_frm.email.focus();
		return;
	}
	document.reg_frm.submit();
}

function updateInfoConfirm(){  //정보수정시 사용. modify.jsp
	if(document.reg_frm.pw.value == ""){
		alert("패스워드를 입력하세요");
		reg_frm.pw.focus();
		return;
	}
	if(document.reg_frm.pw.value != document.reg_frm.pw_check.value){
		alert("패스워드가 일치하지 않습니다");
		reg_frm.pw.focus();
		return;
	}
	if(document.reg_frm.mail.value.length == 0){
		alert("메일은 필수사항입니다.");
		reg_frm.mail.focus();
		return;
	}
	alert("정보가 수정되었습니다.");
	document.reg_frm.submit();
}
```

# 회원가입 확인

### joinOk.jsp

```jsp
<%@page import="com.jsp.ex.MemberDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="dto" class="com.jsp.ex.MemberDto" />
<jsp:setProperty name="dto" property="*" />  <!-- * 사용하면 자동으로 이전의 문서에서 값이 넘어온거 자동으로 설정? 날짜정보 제외하고 -->
<%
	dto.setrDate(new Timestamp(System.currentTimeMillis()));  //real date는 dto에서 setrDate이렇게 한거 가져와서 씀
	MemberDao dao = MemberDao.getInstance();  //dao는 싱글톤이니 이렇게 객체 참조할 수 있도록 선언해준다.
	if(dao.confirmId(dto.getId()) == MemberDao.MEMBER_EXISTENT){  //앞의 조건은 MemberDao.java 95번째줄에서 1이 담김.
%>

<script language="javascript">
	alert("아이디가 이미 존재합니다.")
	history.back();
</script>

<%
	}else{
		int ri = dao.insertMember(dto);  //48번째줄
		
		if(ri == MemberDao.MEMBER_JOIN_SUCCESS){
			session.setAttribute("id", dto.getId());
%>			

<script language="javascript">
	alert("회원가입을 축하합니다.")
	document.location.href="login.jsp";  //회원가입 성공시 login페이지로 이동
</script>
<%
		}else{
%>
<script language="javascript">
	alert("회원가입에 실패했습니다.")
	document.location.href="login.jsp";
</script>
<%
		}
	}
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
```

---

# 메인

### main.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	if(session.getAttribute("ValidMem") == null){
%>		
	<jsp:forward page="login.jsp" />
<%
	}
	
	String name = (String) session.getAttribute("name");
	String id = (String) session.getAttribute("id");
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1><%=name %>님 안녕하세요.</h1>
<form action="Logout.jsp" method="post">
	<input type="submit" value="로그아웃" />
	<input type="button" value="정보수정" onclick="javascript:window.location ='modify.jsp'" />
</form>

</body>
</html>
```

---

# 로그아웃

### Logout.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	session.invalidate();
	response.sendRedirect("login.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
```

---

# 정보수정

### modify.jsp

```jsp
<%@page import="com.jsp.ex.MemberDto"%>
<%@page import="com.jsp.ex.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%request.setCharacterEncoding("euc-kr");%>
<%
    String id = (String)session.getAttribute("id");
    MemberDao dao = MemberDao.getInstance();
    MemberDto dto = dao.getMember(id);  //MemberDao.java 154번째줄부터
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script language="javascript" src="members.js" charset="utf-8"></script>
</head>
<body>

<form action="main.jsp" method="post" name="reg_frm">
	아이디 : <%= dto.getId() %> <br />
	비밀번호 : <input type="password" name="pw" /> <br />
	비밀번호 확인 : <input type="password" name="pw_check" /> <br />
	이름 : <%= dto.getName() %> <br />
	메일 : <input type="text" name="mail" value="<%= dto.getEmail() %>" /> <br />
	주소 : <input type="text" name="address" value="<%= dto.getAddress() %>" /> <br />
	<input type="button" value="수정" onclick="updateInfoConfirm()">
	<input type="reset" value="취소" onclick="javascript:window.location='login.jsp'">
</form>

</body>
</html>
```

---

# 싱글톤

### SingleTone.java

```java
package com.jsp.ex;

public class SingleTone {
	
	String charSize = "11";  //다른 클래스에서 출력해서 보기 위한 테스트. SingleToneView.java
	
	
	
	//싱글톤 => 객체생성 딱 한번만 가능. 하나 만들어놓고 공유하는 메모리 형태. 갖다 써~
	private static SingleTone instance = new SingleTone();  //자기자신 객체 생성. 필드로 포함. 객체타입의 필드
	
	private SingleTone() { 
	}
	
	public static SingleTone getInstance() {
		return instance;
	}
	//싱글톤
	
	
	
	//다른 클래스(SingleToneView.java)에서 싱글톤을 쓰려면 일반적인 new는 private으로 막혀있어서 못쓴다. 외부에서 객체 생성 안된다.
	//MemberDao dd = new MemberDao(); 이거는 못씀
	//MemberDao dd = MemberDao.getInstance(); 해야함
	//System.println(dd.charSize); 하면 11 출력
	
}

```

### SingleToneView.java

```java
package com.jsp.ex;

public class SingleToneView {

	public static void main(String[] args) {
		//SingleTone dd = new SingleTone(); 이거는 못씀!
		SingleTone dd = SingleTone.getInstance(); //해야함!
		System.out.println(dd.charSize);  //dd만쓰면 dd에 대한 캐시코드값만 나옴

		//출력 11
	}

}

```
