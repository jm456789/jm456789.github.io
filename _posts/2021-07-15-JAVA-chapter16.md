---
layout: post

title: "JAVA Chapter16 JDBC 프로그래밍 - 데이터베이스란? / DBMS / 데이터베이스의 종류 / SQL / JDBC / MySQL WorkBench를 이용한 데이터베이스 활용 / 데이터베이스 사용 / 데이터 검색 및 변경"
excerpt: "데이터베이스란? / DBMS / 데이터베이스의 종류 / SQL / JDBC / MySQL WorkBench를 이용한 데이터베이스 활용 / 데이터베이스 사용 / 데이터 검색 및 변경"

categories:
  - JAVA
tags:
  - [JAVA]
  
toc: true
toc_sticky: true
 
date: 2021-07-15
last_modified_at: 2021-07-15
---

# 16. JDBC 프로그래밍

### 데이터베이스란?

데이터베이스는 여러 응용 시스템들의 통합된 정보들을 저장하여 운영할 수 있는 공용 데이터들의 집합이다. 데이터베이스는 대규모의 데이터를 효율적으로 저장, 검색, 갱신할 수 있도록 데이터를 고도로 조직화하여 저장한다.

---

### DBMS

데이터베이스를 관리하는 소프트웨어 시스템을 DBMS라고 한다. DBMS는 다수의 사용자들이 동시에 데이터베이스를 사용할 수 있도록 관리한다. 대표적인 DBMS는 오라클, SQL Server, MySQL 등이 있다.

---

### 데이터베이스의 종류

##### 관계형 데이터베이스

관계형 데이터베이스는 데이터들이 다수의 테이블로 구성된다.    
테이블의 각 행은 하나의 레코드이며, 각 테이블은 키와 값들의 관계로 표현된다. 키는 테이블의 열 이름이며, 키 중에서 특정 레코드를 검색하거나 레코드들을 정렬할 때 우선적으로 참조되는 키를 일차키(프라이머리 키)라고 한다. 여러 테이블 간에는 공통된 이름의 열을 포함할 수 있음 이런 경우 서로 다른 테이블 간에 관계가 성립된다.(이를 외래키)

##### 객체 지향 데이터베이스

객체 지향 데이터베이스는 객체 지향 프로그래밍에 쓰이는 것으로, 정보를 객체의 형태로 표현하는 데이터베이스이며 오브젝트 데이터베이스라고도 부른다. 장점은 객체 모델이 그대로 데이터베이스에도 적용되므로 응용프로그램의 객체 모델과 데이터베이스의 모델이 부합하는데 있다. 그러나 현재 관계형 데이터베이스로 된 DBMS와 그에 따른 응용프로그램들이 주류를 이루고 있어 객체 지향 데이터베이스는 틈새시장을 차지하고 있다.

---

### SQL

SQL은 관계형 데이터베이스 관리시스템에서 데이터베이스 스키마 생성, 자료의 검색, 관리, 수정, 그리고 데이터베이스 객체 접근 관리 등을 위해 고안된 언어이다.

---

### JDBC

JDBC는 관계형 데이터베이스에 저장된 데이터를 접근 및 조작할 수 있게 하는 자바 API이다. JDBC는 자바 응용프로그램이 다양한 DBMS에 대해 일관된 API로 데이터베이스 연결, 검색, 수정, 관리 등을 할 수 있게 한다. 그러므로 자바 응용프로그램 개발자는 DMBS의 종류에 관계 없이 JDBC API 만을 이용하면 된다.

---

### MySQL WorkBench를 이용한 데이터베이스 활용

p.846 오라클에서 해봤던거..

```java
insert into student(name, dept, id) values ('김철수', '컴퓨터시스템', '1091011'); //레코드 추가
```

```java
select name, dept, id 
from student 
where dept='컴퓨터공학'; //데이터 검색
```

```java
update student set dept='컴퓨터공학'
where name='최고봉' //데이터 수정
```

```java
delete from student where name='최고봉' //데이터 삭제
```

---

### 자바의 JDBC 프로그래밍

### 데이터베이스 연결 설정

---

### 데이터베이스 사용

자바에서 SQL 문을 실행하기 위해서는 **Statement 클래스**를 이용하고,     
SQL문 실행 결과를 얻어오기 위해서는 **ResultSet 클래스**를 이용한다.
데이터를 검색하기 위해서는 **executeQuery()** 메소드를 추가하고,   
추가, 수정, 삭제와 같이 데이터 변경은 **executeUpdate()** 메소드를 이용한다.   
ResultSet 객체는 현재 데이터의 행(레코드 위치)을 가리키는 커서를 관리한다. 초기 값은 첫 번째 행 이전을 가리키도록 되어있다.

---

### 데이터 검색

```java
package jdbcEx;

import java.io.*;
import java.sql.*;

public class jdbcEx {

	public static void main(String[] args) {
		Connection conn;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb", "root", "1234");
			System.out.println("DB 연결 완료");			
			stmt = conn.createStatement();
			
			ResultSet srs = stmt.executeQuery("select * from student");			
			printData(srs, "name", "id", "dept");
			
			srs = stmt.executeQuery("Select name, id, dept from student where name='이기자'");
			printData(srs, "name", "id", "dept");
			
			conn.close();
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("JDBC 드라이버 로드 에러");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 실행 에러");
		}

	}
	
	private static void printData(ResultSet srs, String col1, String col2, String col3) throws SQLException {
		while(srs.next()) {
			if(col1 != "") {
				System.out.print(new String(srs.getString("name")));
			}if(col2 != "") {
				System.out.print("\t|\t" + srs.getString("id"));
			}if(col3 != "") {
				System.out.println("\t|\t" + new String(srs.getString("dept")));
			}else {
				System.out.println();
			}
		}
	}
}
```

---

### 데이터의 변경

```java
package jdbcEx;

import java.io.*;
import java.sql.*;

public class jdbcEx2 {

	public static void main(String[] args) {
		Connection conn;
		Statement stmt = null;
		
		//update를 이렇게 할 수 있다. 추가
		String name ="아무개", id="0893012", dept="컴퓨터공학";
		String sql="";
		
		PreparedStatement pstmt = null;
		String insertSql = "";
		//--update를 이렇게 할 수 있다. 추가
		
		try {
			Class.forName("com.mysql.jdbc.Driver");			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb", "root", "1234");
			System.out.println("DB 연결 완료");			
			stmt = conn.createStatement();
			
			//update를 이렇게 할 수 있다. 추가
			insertSql = "insert into student(name, id, dept) values(?, ?, ?)";
			pstmt = conn.prepareStatement(insertSql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, dept);
			pstmt.executeUpdate();
			//--update를 이렇게 할 수 있다. 추가
			
			//stmt.executeUpdate("insert into student(name, id, dept) values ('아무개', '0893012', '컴퓨터공학');");
			printTable(stmt);
			
			stmt.executeUpdate("update student set id='0189011' where name='아무개'");			
			printTable(stmt);
			
			stmt.executeUpdate("delete from student where name='아무개'");
			printTable(stmt);
			
			conn.close();
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("JDBC 드라이버 로드 에러");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 실행 에러");
		}

	}
	
	private static void printTable(Statement stmt) throws SQLException {
		ResultSet srs = stmt.executeQuery("select * from student");
		
		while(srs.next()) {
			System.out.print(new String(srs.getString("name")));
			System.out.print("\t|\t" + srs.getString("id"));
			System.out.println("\t|\t" + new String(srs.getString("dept")));
		}
		
		System.out.println(""); //insert 한 결과, update 한 결과, delete 한 결과 순으로 출력
	}

}

```