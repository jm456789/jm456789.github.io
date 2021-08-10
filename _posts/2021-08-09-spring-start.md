---
layout: post 

title: "Spring 설치 및 기초"
excerpt: ""

categories:
  - Spring
tags:
  - [Spring]
  
toc: true
toc_sticky: true
 
date: 2021-08-09
last_modified_at: 2021-08-09
---

---

* JDK 1.8 버전 설치
* STS(이클립스) 설치 및 프로젝트 생성
* Tomcat 설치 및 연동
* 오라클 데이터베이스 / SQL Developer 설치 및 설정
* 스프링 프로젝트 생성 및 라이브러리 추가
* MyBatis / mybatis-spring 설정
* 스프링 MVC 개발 설정

---

# JDK 1.8 버전 설치

내pc 우클릭 - 속성 - 고급 시스템 설정 - 맨아래 환경변수에서 시스템변수(두번째)에서 새로만들기    
변수이름 : JAVA_HOME설정.    
환경변수 값 : JDK가 설치된 경로 지정.(bin까지)   

Path - 편집 - 새로만들기 - %JAVA_HOME%   

설정 후 cmd c:w>에서 javac 입력 후 확인?

---

# Eclipse 혹은 STS3 설치

스프링 개발 경험이 없다면 STS 가 더 편함.

### 실행 환경 편집

STS 3.9.12 다운로드 후 압축 풀고 sts-bundle을 c로 옮겨 넣기   
sts-bundle - sts-3.9.12.RELEASE - STS.ini 파일을 메모장으로 열어서 맨 위에 코드 두줄 추가

```java
-vm
C:\Program Files\Java\jdk1.8.0_301\bin\javaw.exe
..이하 생략...
```

### UTF-8 설정

스프링에서 window - Preferences - General - Workspace - UTF-8로 변경   
스프링에서 window - Preferences - Web - css, html, jsp도 다 UTF-8로 변경

### Web browser 변경

window - web browser - 3 chrome으로 변경

---

# Tomcat (9) 서버 설정

왼쪽 하단 Servers 탭에서 우클릭 - new - Server 클릭 - Apache - Tomcat 9 - next - finish   
Servers에서 Tomcat 더블클릭해서 HTTP 포트번호 8090으로 바꿔줌(이클립스랑 충돌날 수 있어서?)

---

# 스프링 프로젝트 생성

File - New - Spring Legacy Project 클릭 - Spring MVC Project 클릭 후 생성   

### 스프링 버전 변경

pom.xml 에서 아래같이 변경 후 프로젝트 우클릭 - maven - Update Project 꼭 해줘야 함!!!

```jsp
...중략...
<properties>
    <java-version>1.8</java-version> <!-- 이거 수정 -->
    <org.springframework-version>5.0.7.RELEASE</org.springframework-version> <!-- 이거 수정 -->
    <org.aspectj-version>1.6.10</org.aspectj-version>
    <org.slf4j-version>1.6.6</org.slf4j-version>
</properties>
...중략...
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-compiler-plugin</artifactId>
    <version>2.5.1</version>
    <configuration>
        <source>1.8</source> <!-- 이거 수정 -->
        <target>1.8</target> <!-- 이거 수정 -->
        <compilerArgument>-Xlint:all</compilerArgument>
        <showWarnings>true</showWarnings>
        <showDeprecation>true</showDeprecation>
    </configuration>
</plugin>
```

업데이트 했으면 JRE System Library[JavaSE-1.8]로 변경된거 확인 가능.   

작성된 프로젝트가 잘 되는지 보려면 프로젝트 우클릭 Run As - Run on Server     
새 창 크롬이 뜨면 성공. 내용은 오류난다. colsole 보면 내용이 뭐가 나타나긴 함.

---

# lombok 라이브러리 설치

lombok사용하면 getter, setter, toString, 생성자 등을 자동생성.   

Installer 창 뜨면 체크는 다 해제하고 STS만 체크, Install/Update버튼 클릭 후, Quit Installer    
Lombok1.18.12 설치하면 C:\sts-bundle\sts-3.9.12.RELEASE에 자동으로 추가되어 있음. 

pom.xml에 junit아래에 아래 코드 추가. 후에 프로젝트-maven-update 꼭!

```jsp
<dependency>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
    <version>1.18.0</version>
    <scope>provided</scope>
</dependency>    
```

---

# @Configuration

Java 설정을 이용하는 경우에 XML 대신 설정 파일을 직접 작성할 필요가 있다.   
@Configuration이라는 어노테이션을 이용해서 해당 클래스의 인스턴스를 이용해서 설정 파일을 대신합니다.   
??? 걍 xml 안쓰고 java로 화면 띄운다는 듯
(p.43)

---

# 의존성 주입 테스트

p.53 

pom.xml에 추가되는 라이브러리

```jsp
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-test</artifactId>
    <version>${org.springframework-version}</version>
</dependency>

<dependency>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
    <version>1.18.0</version>
    <scope>provided</scope>
</dependency>   
<dependency>
    <groupId>log4j</groupId>
    <artifactId>log4j</artifactId>
    <version>1.2.17</version>			
</dependency>
```

pom.xml에서 변경되는 라이브러리

```jsp
<dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <version>4.12</version>
    <scope>test</scope>
</dependency>    
```

### 예제 클래스 생성

Restaurant.java

```java
package org.zerock.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component  //하나의 빈으로 하겠다, 왼쪽에 s모양 자동 생성됨.
@Data
public class Restaurant {
	
	@Autowired
	private Chef chef;
}

```

### xml을 이용하는 의존성 주입 설정

스프링에서 관리되는 객체를 흔히 빈이라 하고 이에 대한 설정은 xml과 java를 이용해서 처리할 수 있다.

프로젝트의 src폴더 내에 spring - root-context.xml은 스프링 프레임워크에서 관리해야 하는 객체(이러한 객체를 스프링에서는 빈이라고 표현)를 설정하는 설정파일.   
더블 클릭 후 NameSpaces 탭에서 context 항목 체크, source 탭 선택 후 아래 코드 추가

```jsp
<!-- Root Context: defines shared resources visible to all other web components -->
<context:component-scan base-package="org.zerock.sample"></context:component-scan>
```

### 테스트 코드를 통한 확인

SampleTests.java -> 코드 설명은 p.61...

```java
package org.zerock.sample;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SampleTests {

	@Autowired  //new를 안써서 객체를 생성을 안해도 스프링이 자동으로 객체를 생성해서 돌아가게 해준다?
	private Restaurant restaurant;
	
	@Test
	public void testExit() {  //실행해서 볼 때는 testExit-Run As-JUnit test
		assertNotNull(restaurant);
		
		log.info(restaurant);
		log.info("----------------------------");
		log.info(restaurant.getChef());
	}
	
}

```

### 단일 생성자의 묵시적 자동 주입

SampleHotel.java(p.68)

```java
package org.zerock.sample;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.ToString;

@Component
@ToString
@Getter
public class SampleHotel {
	
	private Chef chef;
	
	public SampleHotel(Chef chef) {
		this.chef = chef;
	}
}

```

```java
package org.zerock.sample;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Component
@ToString
@Getter
@AllArgsConstructor
public class SampleHotel {
	
	private Chef chef;
}

```

---

# 오라클, SQL Developer설치 (p.71)

---

# 프로젝트의 JDBC 연결

프로젝트 우클릭 - 맨아래 Properties - JAVA Build Path - Libraries 탭에서 오른쪽 두번째 add External JARs 버튼 클릭 후 - c아래 SQL Developer안에 lib안에 ojdbc8파일 선택 - apply    

바로 위에 Deployment Assembly로 이동해서 add버튼 - Java Build Path Entries 클릭 후 적용, Apply

### JDBC 테스트 코드

JDBC 제대로 연결됐나 확인 코드

JDBCTests.java

```java
package org.zerock.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	static {  //클래스 내의 데이터 초기화하는 키워드. static은 한번만 초기화
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {  //실행은 testConnection더블클릭 - Run As - 2 JUnit
		
		//try-with-resources 문법이다. Autocloseable 인터페이스를 구현하는 클래스 기반...?
		try(Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "c##jane", "1234")){  //성공적으로 Connection 될경우 나중에 자동으로 close해줌
			log.info(con);
		}catch(Exception e) {
			fail(e.getMessage());  //fail은 Test(JUnit)에서 쓸 수 있는거?
		}
	}
}

```

---

# 커넥션 풀 설정

일반적으로 여러 명의 사용자를 동시에 처리해야 하는 웹 애플리케이션의 경우 <u>데이터베이스 연결을 이용할 때는 커넥션풀을 이용</u>하므로, 아예 스프링에 커넥션 풀을 등록해서 사용하는것이 좋다.   
커넥션 풀은 여러 종류가 있고 여기서는 최근 유행하는 HikariCP 사용.   

구글에 maven hikaricp 검색해서 홈페이지 접속 후 가장 최근이면서 Usages가 많은 3.4.5버전 사용. 클릭해서 들어가면 소스 코드 나오니 복사해서 pom.xml에 붙여넣은 후 저장, 프로젝트 우클릭 - maven -  업데이트 프로젝트 해줘야함.   
**pom.xml을 수정한 후에는 반드시 프로젝트 업데이트 해줘야 함!!!!!!!**

```jsp
<!-- https://mvnrepository.com/artifact/com.zaxxer/HikariCP -->
<dependency>
    <groupId>com.zaxxer</groupId>
    <artifactId>HikariCP</artifactId>
    <version>3.4.5</version>
</dependency>
```

### root-context.xml에 bean으로 등록

**빈으로 등록해서 쓰려면 여기서 해야함!!!**

```jsp
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="http://www.springframework.org/schema/beans https://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.3.xsd">
	
	
	<!-- 빈을 등록하려면 다 여기서 해야 함!!!! -->
	
	
	<!-- hikari는 jar파일밖에 없어서 아래처럼 component 어노테이션 사용 못함. -->	
	<bean id="hikariConfig" class="com.zaxxer.hikari.HikariConfig">
		<property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"></property>
		<property name="jdbcUrl" value="jdbc:oracle:thin:@localhost:1521:XE"></property>
		<property name="username" value="c##jane"></property>
		<property name="password" value="1234"></property>
	</bean>
	
	<bean id="dataSource" class="com.zaxxer.hikari.HikariDataSource" destroy-method="close">
		<constructor-arg ref="hikariConfig"></constructor-arg>
	</bean>
	
	
	
	<!-- 어노테이션(component)을 사용하여 패키지 안에 있는 모든 자바 파일을 bean으로 등록 -->
	<!-- Root Context: defines shared resources visible to all other web components -->
	<context:component-scan base-package="org.zerock.sample"></context:component-scan>
	
</beans>

```

### 빈으로 등록된 DataSource 이용해서 확인하는 테스트 코드

DataSourceTests.java

```java
package org.zerock.persistence;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.sample.SampleTests;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)  //스프링 실행
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")  //이 빈을 읽어라. (모든 빈을 만드는건 root-context.xml에 들어있음!)
@Log4j
public class DataSourceTests {
	
	@Autowired
	private DataSource datasource;
	
	@Test
	public void testConnection() {
		try(Connection con = datasource.getConnection()){
			log.info(con);
		}catch(Exception e) {
			fail(e.getMessage());
		}
	}
	
}

```

---

# MyBatis와 스프링 연동

MyBatis는 흔히 SQL 매핑 프레임워크로 분류되는데, 개발자들은 JDBC 코드의 복잡하고 지루한 작업을 피하는 용도로 많이 사용한다.   
SQL 질의문을 더 쉽게?   
p.89 JDBC와의 차이점..

### pom.xml에 라이브러리 추가

```jsp
<!-- https://mvnrepository.com/artifact/org.mybatis/mybatis -->
<dependency>
    <groupId>org.mybatis</groupId>
    <artifactId>mybatis</artifactId>
    <version>3.4.6</version>
</dependency>
        
<!-- https://mvnrepository.com/artifact/org.mybatis/mybatis-spring -->
<dependency>
    <groupId>org.mybatis</groupId>
    <artifactId>mybatis-spring</artifactId>
    <version>1.3.1</version>
</dependency>

<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-tx</artifactId>
    <version>${org.springframework-version}</version>
</dependency>

<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-jdbc</artifactId>
    <version>${org.springframework-version}</version>
</dependency>
```

### root-context.xml로 빈 생성

```jsp
<!--위에꺼 hikari -->
<bean id="dataSource" class="com.zaxxer.hikari.HikariDataSource" destroy-method="close">
    <constructor-arg ref="hikariConfig"></constructor-arg>
</bean>
<!--위에꺼 hikari -->

<!-- 외부에서 제공받은 라이브러리. 코드는 없고 jar파일만 있기 때문에 component 사용 못한다. -->
<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
    <property name="dataSource" ref="dataSource"></property>
</bean>
```

### 빈으로 등록된 DataSource 이용해서 확인하는 테스트 코드

DataSource.java

```java
package org.zerock.persistence;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.sample.SampleTests;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)  //스프링 실행
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")  //이 빈을 읽어라. (모든 빈을 만드는건 root-context.xml에 들어있음!)
@Log4j
public class DataSourceTests {
	
    //위에 썼던거.. 없어도 된다 hikari를 이용한 커넥션 풀 연결.
	@Autowired
	private DataSource datasource;
	
	@Test
	public void testConnection() {
		try(Connection con = datasource.getConnection()){
			log.info(con);
		}catch(Exception e) {
			fail(e.getMessage());
		}
	}
    //위에 썼던거.. 없어도 된다 hikari
	

    //SQLSession은 커넥션 역할, SQLSessionFactory는 SQLSession객체 생성해주는 역할
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testMyBatis() {
		try(SqlSession session = sqlSessionFactory.openSession(); Connection con = session.getConnection();){
			log.info(session);
			log.info(con);
		}catch(Exception e) {
			fail(e.getMessage());
		}
	}
	
}

```

---

# Mapper

SQL과 그에 대한 처리를 지정하는 역할. MyBatis-Spring을 이용하는 경우에는 Mapper를 XML과 인터페이스+어노테이션의 형태로 작성할 수 있다.

### Mapper 인터페이스

Mapper를 작성하는 작업은 XML을 이용할 수 있지만, 이번에는 인터페이스 사용.

TimeMapper.java (인터페이스)

```java
package org.zerock.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {
	
	@Select("SELECT sysdate FROM dual")
	public String getTime();
	
}

```

### Mapper 설정

root-context.xml에서 두번째 탭 Namespaces에서 mybatis-spring 체크박스 체크.

```jsp
<!--기존에 있는거-->
<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
    <property name="dataSource" ref="dataSource"></property>
</bean>
<!--기존에 있는거-->

<mybatis-spring:scan base-package="org.zerock.mapper"/> <!--추가!!-->

<!--기존에 있는거-->
<context:component-scan base-package="org.zerock.sample"></context:component-scan>
<!--기존에 있는거-->
```

### Mapper 테스트 (자바를 이용하는 경우)

TimeMapperTests.java

```java
package org.zerock.persistence;


import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.mapper.TimeMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)  //스프링 실행
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")  //이 빈을 읽어라. (모든 빈을 만드는건 root-context.xml에 들어있음!)
@Log4j
public class TimeMapperTests {
	
	@Autowired
	private TimeMapper timeMapper;
	
	@Test
	public void testGetTime() {
		log.info(timeMapper.getClass().getName());
		log.info(timeMapper.getTime());
	}
}

```

### XML 매퍼와 같이 쓰기

TimeMapper 인터페이스

```java
package org.zerock.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {
	
	@Select("SELECT sysdate FROM dual")
	public String getTime();
	
	public String getTime2();  //이거 추가
}

```

TimeMapper.xml

```jsp
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
	PUBLIC "-//mybatis.org//DTD Mapper 3.0//EM"
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
	
<mapper namespace="org.zerock.mapper.TimeMapper">
	
	<select id="getTime2" resultType="String">
	SELECT sysdate FROM dual
	</select>
	
</mapper>
```

TimeMapperTests.java  ->  테스트 확인

```java
package org.zerock.persistence;


import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.mapper.TimeMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)  //스프링 실행
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")  //이 빈을 읽어라. (모든 빈을 만드는건 root-context.xml에 들어있음!)
@Log4j
public class TimeMapperTests {
	
	@Autowired
	private TimeMapper timeMapper;
	
	@Test
	public void testGetTime() {
		log.info(timeMapper.getClass().getName());
		log.info(timeMapper.getTime());
	}
	
    //여기부분만 추가~~~ 위에는 앞에서 했던거.
	@Test
	public void testGetTime2() {
		log.info("getTime2");
		log.info(timeMapper.getTime2());
	}
}

```

