---
layout: post   

title: "Spring 04. ?.do 확장자 패턴 servlet파일을 이용, dispather"
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

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/spring1.jpg?raw=true)

---

### fronControll.jsp

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

<a href="insert.do">insert</a>
<hr />
<a href="http://localhost:8080<%=request.getContextPath() %>/update.do">update</a>  <!-- Context는 프로젝트를 의미 -->
<hr />
<a href="http://localhost:8080/Ex/select.do">select</a>
<hr />
<a href="<%=request.getContextPath() %>/delete.do">delete</a>  <!-- Context는 프로젝트를 의미 -->

<!-- do는 한곳으로 모이고, front coltroller 방식. servlet 파일로 이동 -->

</body>
</html>
```

### FrontCon.java

```java
package com.sub.ex;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontCon
 */
@WebServlet("*.do")
public class FrontCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontCon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("actionDo");
		
		String uri = request.getRequestURI();   //uri는 프로젝트 이름과 파일 이름을 합친거 가져오는거
		System.out.println("uri : " + uri);
		String conPath = request.getContextPath();   //contextPath는 프로젝트 이름 가져오기
		System.out.println("conPath : " + conPath);
		String command = uri.substring(conPath.length());  //프로젝트 이름을 제외한걸 가져와라. ex) ex01/insert.do면 conPath.length()는 프로젝트 이름의 길이를 가져와서 잘라냄. 따라서 insert.do만 남는다
		
		if(command.equals("/insert.do")) {
			System.out.println("insert");
			System.out.println("--------------------------------");
		}else if(command.equals("/update.do")) {
			System.out.println("update");
			System.out.println("--------------------------------");
		}else if(command.equals("/select.do")) {
			System.out.println("select");
			System.out.println("--------------------------------");
		}else if(command.equals("/delete.do")) {
			System.out.println("delete");
			System.out.println("--------------------------------");
		}
	}

}

```

---

# db에 있는 정보 표출

### 패키지 com.jsp.ex / MemberDao.java

```java
package com.jsp.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.jsp.ex.MemberDto;

public class MemberDao {

	public static final int MEMBER_NONEXISTENT = 0;
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;

	private static MemberDao instance = new MemberDao();
	private MemberDao() {
	}

	public static MemberDao getInstance() {
		return instance;
	}

	public int  insertMember(MemberDto dto) {
		int ri = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "insert into members values(?,?,?,?,?,?)";

		try {
			conn = getConnection();
			pstmt =  conn.prepareStatement(query);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.geteMail());
			pstmt.setTimestamp(5, dto.getrDate());
			pstmt.setString(6, dto.getAddress());
			pstmt.executeUpdate();
			ri = pstmt.executeUpdate();	
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

	private Connection getConnection() {
		Context context = null;
		DataSource dataSource = null;
		Connection conn = null;

		try {
			context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle18c");
			conn =  dataSource.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}

		return conn;
	}

	public int confirmId(String id) {
		int ri = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet  set = null;
		String query = "select id from members where id = ?";

		try {
			conn = getConnection();
			pstmt =  conn.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();


			if(set.next()) {
				ri =  MemberDao.MEMBER_EXISTENT;
			}else {
				ri = MemberDao.MEMBER_NONEXISTENT;
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
		return ri;
	}


	public int userCheck(String id, String pw) {
		int ri = 0;
		String dbPw;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet  set = null;
		String query = "select pw from members where id = ?";

		try {
			conn = getConnection();
			pstmt =  conn.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();


			if(set.next()) {
				dbPw = set.getString("pw");
				if(dbPw.equals(pw)) {
					ri =  MemberDao.MEMBER_JOIN_SUCCESS;
				}else {
					ri = MemberDao.MEMBER_LOGIN_PW_NO_GOOD;
				}
			}else {
				ri = MemberDao.MEMBER_LOGIN_IS_NOT;				
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

		return ri;
	}



	public MemberDto getMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet  set = null;
		String query = "select * from members where id = ?";
		MemberDto dto = null;


		try {
			conn = getConnection();
			pstmt =  conn.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();

			if(set.next()) {
				dto = new MemberDto();
				dto.setId(set.getString("id"));
				dto.setPw(set.getString("pw"));
				dto.setName(set.getString("name"));
				dto.seteMail(set.getString("eMail"));
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


	public int updateMember(MemberDto dto) {
		int ri = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "update members set pw=?, eMail=?, address=?  where id=?";

		try {
			conn = getConnection();
			pstmt =  conn.prepareStatement(query);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.geteMail());
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
	
	public ArrayList<MemberDto> membersAll(){
		ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement("select * from members");
			rs = pstmt.executeQuery();
			
			System.out.println("--------------------------------------");
			
			while(rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.seteMail(rs.getString("eMail"));
				dto.setrDate(rs.getTimestamp("rDate"));
				dto.setAddress(rs.getString("address"));
				
				dtos.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return dtos;
	}
}

```

### 패키지 com.jsp.ex / MemberDto.java

```java
package com.jsp.ex;

import java.sql.Timestamp;

public class MemberDto {
	private String id;
	private String pw;
	private String name;
	private String eMail;
	private Timestamp rDate;
	private String address;
	
	public MemberDto() {
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
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String geteMail() {
		return eMail;
	}
	
	public void seteMail(String eMail) {
		this.eMail = eMail;
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

### 패키지 com.sub.ex / FronCon.java

```java
package com.sub.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ex.MemberDto;
import com.jsp.ex.Service;

/**
 * Servlet implementation class FronCon
 */
@WebServlet("*.do")
public class FronCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FronCon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("actionDo");
		
		String uri = request.getRequestURI();   //uri는 프로젝트 이름과 파일 이름을 합친거 가져오는거
		System.out.println("uri : " + uri);
		String conPath = request.getContextPath();   //contextPath는 프로젝트 이름 가져오기
		System.out.println("conPath : " + conPath);
		String command = uri.substring(conPath.length());  //프로젝트 이름을 제외한걸 가져와라. ex) ex01/insert.do면 conPath.length()는 프로젝트 이름의 길이를 가져와서 잘라냄. 따라서 insert.do만 남는다
		
		if(command.equals("/membersAll.do")) {
			response.setContentType("text/html;charset=EUC-KR");  //view랑 controller랑 합쳐짐
			PrintWriter writer = response.getWriter();  //view랑 controller랑 합쳐짐
			writer.println("<html><head></head><body>");  //view랑 controller랑 합쳐짐
			Service service = new MembersAllService();  //service를 쓰는 이유는 일괄된 호출을 위해? 비슷한 형식으로 나오라고? 코드 간결화를 위해
			ArrayList<MemberDto> dtos = service.execute(request, response);  //service를 쓰는 이유는 일괄된 호출을 위해? 비슷한 형식으로 나오라고? excute?  service는 껍데기만 존재하는 추상메소드!
			
			for(int i = 0; i<dtos.size();i++){  //dtos의 레코드의 갯수만큼
				MemberDto dto = dtos.get(i);
				String id = dto.getId();
				String pw = dto.getPw();
				String name = dto.getName();
				String eMail = dto.geteMail();
				Timestamp rDate = dto.getrDate();
				String address = dto.getAddress();
				writer.println(id +","+ pw +", "+ name + ", " + eMail +", " + rDate + "," + address + "<br>" );
			}
			
			writer.println("</body></html>");
		}
	}

}

```

### 패키지 com.jsp.ex / Service.java -> 인터페이스!!!

```java
package com.jsp.ex;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public interface Service {
	public ArrayList<MemberDto> execute(HttpServletRequest request, HttpServletResponse response);

}

```

### 패키지 com.sub.ex / MembersAllService.java

```java
package com.sub.ex;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ex.MemberDao;
import com.jsp.ex.MemberDto;
import com.jsp.ex.Service;

public class MembersAllService implements Service{

	public MembersAllService() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public ArrayList<MemberDto> execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDao dao = MemberDao.getInstance();  //getInstance는 객체 생성. 이미 만들어져있는거 공유. 싱글톤
		return dao.membersAll();
	}
	
	
	
}
```

### membersAll.jsp

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

<a href="membersAll.do">전체 회원정보 조회</a>
<!-- 
	DB랑 연동하기 위해 
	라이브러리 폴더에 jdbc 파일 넣고 
	Servers-context.xml에 Resource 추가해야함
-->

</body>
</html>
```

---

### Dispather.java

```java
package com.sub.ex;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Dispather
 */
@WebServlet("/Dispather")
public class Dispather extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dispather() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("id", "hong");
		request.setAttribute("pw", "1234");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ok.jsp");  //dispatcher는 내장객체도 같이 전달?
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

}

```

### ok.jsp

실행은 자바에서 해야함!!!

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
	
	id : <%=request.getAttribute("id") %><br />
	pw : <%=request.getAttribute("pw") %>
	
</body>
</html>
```
