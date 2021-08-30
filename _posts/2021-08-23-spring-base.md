---
layout: post 

title: "Spring 스프링 MVC 프로젝트의 기본 구성 1. - 기본설정 / 데이터베이스 연결 / 영속, 비즈니스계층의 CRUD"
excerpt: ""

categories:
  - Spring
tags:
  - [Spring]
  
toc: true
toc_sticky: true
 
date: 2021-08-23
last_modified_at: 2021-08-23
---

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/spring2.jpg?raw=true)

# 프로젝트 생성 

new - Spring Legacy Project - Spring MVC Project 클릭 후 - next 클릭 - 패키지명 org.zerock.controller.. 걍암거나

# 스프링 기초 적용

### pom.xml

```jsp
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/maven-v4_0_0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>org.zrock</groupId>
	<artifactId>controller</artifactId>
	<name>ex02</name>
	<packaging>war</packaging>
	<version>1.0.0-BUILD-SNAPSHOT</version>
	<properties>
		<!-- 수정 1. ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★-->
		<java-version>1.8</java-version>  <!-- 여기 -->
		<org.springframework-version>5.0.7.RELEASE</org.springframework-version>  <!-- 여기 -->
		<org.aspectj-version>1.6.10</org.aspectj-version>
		<org.slf4j-version>1.6.6</org.slf4j-version>
	</properties>
	<dependencies>
		<!-- Spring -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-context</artifactId>
			<version>${org.springframework-version}</version>
			<exclusions>
				<!-- Exclude Commons Logging in favor of SLF4j -->
				<exclusion>
					<groupId>commons-logging</groupId>
					<artifactId>commons-logging</artifactId>
				 </exclusion>
			</exclusions>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-webmvc</artifactId>
			<version>${org.springframework-version}</version>
		</dependency>
		
		
		<!-- 추가 3. ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★-->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-test</artifactId>
			<version>${org.springframework-version}</version>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-jdbc</artifactId>
			<version>${org.springframework-version}</version>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-tx</artifactId>
			<version>${org.springframework-version}</version>
		</dependency>
				
				
		<!-- AspectJ -->
		<dependency>
			<groupId>org.aspectj</groupId>
			<artifactId>aspectjrt</artifactId>
			<version>${org.aspectj-version}</version>
		</dependency>	
		
		<!-- Logging -->
		<dependency>
			<groupId>org.slf4j</groupId>
			<artifactId>slf4j-api</artifactId>
			<version>${org.slf4j-version}</version>
		</dependency>
		<dependency>
			<groupId>org.slf4j</groupId>
			<artifactId>jcl-over-slf4j</artifactId>
			<version>${org.slf4j-version}</version>
			<scope>runtime</scope>
		</dependency>
		<dependency>
			<groupId>org.slf4j</groupId>
			<artifactId>slf4j-log4j12</artifactId>
			<version>${org.slf4j-version}</version>
			<scope>runtime</scope>
		</dependency>
		
		<!-- 수정 6. ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★-->
		<dependency>
			<groupId>log4j</groupId>
			<artifactId>log4j</artifactId>
			<version>1.2.17</version>  <!-- 여기 -->
		</dependency>

		<!-- @Inject -->
		<dependency>
			<groupId>javax.inject</groupId>
			<artifactId>javax.inject</artifactId>
			<version>1</version>
		</dependency>
				
		<!-- 수정 4. ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★-->
		<!-- Servlet -->
		<dependency>
		    <groupId>javax.servlet</groupId>
		    <artifactId>javax.servlet-api</artifactId>
		    <version>4.0.1</version>  <!-- 여기 -->
		    <scope>provided</scope>
		</dependency>
		
		
		<dependency>
			<groupId>javax.servlet.jsp</groupId>
			<artifactId>jsp-api</artifactId>
			<version>2.1</version>
			<scope>provided</scope>
		</dependency>
		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>jstl</artifactId>
			<version>1.2</version>
		</dependency>
	
		<!-- 수정 5. ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★-->
		<!-- Test -->
		<dependency>
			<groupId>junit</groupId>
			<artifactId>junit</artifactId>
			<version>4.12</version>  <!-- 여기 -->
			<scope>test</scope>
		</dependency>        
		
		
		<!-- 추가 7. MyBatis 사용할 것이므로 ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->
		<!-- https://mvnrepository.com/artifact/com.zaxxer/HikariCP -->
		<dependency>
		    <groupId>com.zaxxer</groupId>
		    <artifactId>HikariCP</artifactId>
		    <version>3.4.5</version>
		</dependency>
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
		    <version>1.3.2</version>
		</dependency>				
		<!-- https://mvnrepository.com/artifact/org.projectlombok/lombok -->
		<dependency>
		    <groupId>org.projectlombok</groupId>
		    <artifactId>lombok</artifactId>
		    <version>1.18.12</version>
		    <scope>provided</scope>
		</dependency>
		<!-- https://mvnrepository.com/artifact/org.bgee.log4jdbc-log4j2/log4jdbc-log4j2-jdbc4.1 -->
		<dependency>
		    <groupId>org.bgee.log4jdbc-log4j2</groupId>
		    <artifactId>log4jdbc-log4j2-jdbc4.1</artifactId>
		    <version>1.16</version>
		</dependency>

				
				
				
		
	</dependencies>
    <build>
        <plugins>
            <plugin>
                <artifactId>maven-eclipse-plugin</artifactId>
                <version>2.9</version>
                <configuration>
                    <additionalProjectnatures>
                        <projectnature>org.springframework.ide.eclipse.core.springnature</projectnature>
                    </additionalProjectnatures>
                    <additionalBuildcommands>
                        <buildcommand>org.springframework.ide.eclipse.core.springbuilder</buildcommand>
                    </additionalBuildcommands>
                    <downloadSources>true</downloadSources>
                    <downloadJavadocs>true</downloadJavadocs>
                </configuration>
            </plugin>
            <plugin>
           		<!-- 수정 2. ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★-->
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>2.5.1</version>
                <configuration>
                    <source>1.8</source>   <!-- 여기 -->
                    <target>1.8</target>  <!-- 여기 -->
                    <compilerArgument>-Xlint:all</compilerArgument>
                    <showWarnings>true</showWarnings>
                    <showDeprecation>true</showDeprecation>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.codehaus.mojo</groupId>
                <artifactId>exec-maven-plugin</artifactId>
                <version>1.2.1</version>
                <configuration>
                    <mainClass>org.test.int1.Main</mainClass>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>

```

**프로젝트 우클릭 - maven - update project 꼭!!!**

**프로젝트 우클릭 - properties - Java Build Path - Libraries 탭 - 오른쪽 두번째 버튼 Add External JARs... - c > sqldeveloper > lib > ojdbc8.jar**

**프로젝트 우클릭 - properties - Deployment Assembly - Add 버튼 - Java Build Path Entries - next 버튼 - ojdbc8.jar 파일 클릭 후 finish**

---

### root-context.xml

**두번째 탭 Namespaces에서 mybatis 체크!**

```jsp
<!-- 추가 -->
	<bean id="hikariConfig" class="com.zaxxer.hikari.HikariConfig">
		<property name="driverClassName" value="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"></property>
		<property name="jdbcUrl" value="jdbc:log4jdbc:oracle:thin:@localhost:1521:XE"></property>
		<property name="username" value="c##jane"></property>
		<property name="password" value="1234"></property>		
	</bean>
	<bean id="dataSource" class="com.zaxxer.hikari.HikariDataSource" destroy-method="close">
		<constructor-arg ref="hikariConfig" />
	</bean>
	<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
		<property name="dataSource" ref="dataSource"></property>
	</bean>
	
	<mybatis-spring:scan base-package="org.zerock.mapper" />
	<!-- <context:component-scan base-package="org.zerock.service"></context:component-scan> -->
```

### log4jdbc.log4j2.properties 파일

> 프로젝트  - src/main/resources에 생성, src/test/resources에도

최상단 [File]클릭 => [New]클릭 => [Other]클릭 => [General] 선택 => [Untitled Text File]을 선택 후 [Finish] 버튼을 클릭

```jsp
log4jdbc.spylogdelegator.name=net.sf.log4jdbc.log.slf4j.Slf4jSpyLogDelegator
```

---

# oracle 연결

### DataSourceTest.java

> 프로젝트  - src/test/java - org.zerock.persistence 패키지 만든 후 생성

```java
package org.zerock.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)  //스프링 실행
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")  //이 빈을 읽어라. (모든 빈을 만드는건 root-context.xml에 들어있음!)
@Log4j
public class DataSourceTest {
	
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

### JDBCTests.java

```java
package org.zerock.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
   
   static {
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   @Test
   public void textConnection(){
      try(Connection con =
            DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:XE",
            "c##jane",
            "1234")){ //try-with-resources
         log.info(con);
      }catch (Exception e){
         fail(e.getMessage());
      }
   }
}
```

---

##### 기본셋팅 후 DB 연결됐나 확인

**JDBCTests.java - testConnection 더블클릭 후 우클릭 - Run AS - JUnit Test로 확인**

<u>여기까지가 p.173 기본 셋팅~</u>

---

---

---

# sql developer 테이블 생성

시퀀스는 자동으로 넘버 생성. 1234...   

regdate은 생성시간, updatedate는 최종 수정 시간   
기본값으로 sysdate 지정해서 레코드가 생성된 시간은 자동으로 기록

```jsp
create sequence seq_board;

create table tbl_board(
bno number(10, 0),
title varchar2(200) not null,
content varchar2(2000) not null,
writer varchar2(50) not null,
regdate date default sysdate,
updatedate date default sysdate
);

alter table tbl_board add constraint pk_board
primary key(bno);

commit;
```

**시퀀스 - 편집 - 캐시없음 해주기**

---

### 더미 데이터 추가

의미 없는 데이터를 더미데이터라고 한다

```jsp
insert into tbl_board(bno, title, content, writer) values (seq_board.nextval, '테스트 제목', '테스트 내용', 'user00');

commit;
```

---

# 8.1 영속 계층의 구현 준비

### BoardVO.java

VO 클래스 작성. dto같은거임   
@Data 어노테이션은 getter/setter, toString을 해줌

> 프로젝트  - src/main/java - org.zerock.domain 패키지 만든 후 생성

```java
package org.zerock.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;

}

```

### BoardMapper 인터페이스

어노테이션(@Select)으로 sql 손쉽게 처리함.

> 프로젝트  - src/main/java - org.zerock.mapper 패키지 만든 후 생성

```java
package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;

public interface BoardMapper {

	@Select("select * from tbl_board where bno > 0")
	public List<BoardVO> getList();
}

```

### BoardMapperTest.java

위에꺼 잘 연결됐나 확인   
확인해보는법은 testGetList 영역 더블클릭 후 우클릭 - Run As - 2 JUnit Test

> 프로젝트  - src/test/java - org.zerock.mapper 패키지 만든 후 생성

```java
package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
}

```

### BoardMapper.xml

MyBatis는 SQL을 처리하는데 어노테이션이나 XML을 이용할 수 있다.   
간단한 SQL이라면 어노테이션이 무난하지만, 복잡한 SQL문이면 유용하지 못함(코드 수정하고 다시 빌드해야해서 유지보수성이 떨어짐)   
XML인 경우 단순 텍스트 수정으로 끝남.

Mapper XML 파일 p.187   
BoardMapper.xml 파일 만든 후, BoardMapper 인터페이스에서 @Select문 주석처리해버리고, BoardMapperTest.java에서 실행 되나 다시 확인

> 프로젝트  - src/main/resources - zerock(폴더 신규 생성) - mapper(폴더 신규 생성) - 안에 xml(BoardMapper) 생성

```jsp
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
	PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="org.zerock.mapper.BoardMapper"> <!-- namespace은 Mapper 인터페이스와 동일한 이름 -->

<select id="getList" resultType="org.zerock.domain.BoardVO"> <!-- id는 메서드의 이름과 일치 / resultType는 select 쿼리의 결과를 특정 클래스의 객체로 만들기 위해 설정 -->
<![CDATA[  
select * from tbl_board where bno > 0
]]>
</select> <!-- CDATA는 XML에서 부등호를 사용하기 위해 사용 -->

</mapper>
	
```

---

# 8.2 영속 영역의 CRUD 구현

##### create(insert) 처리

### BoardMapper 인터페이스

```java
package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;

public interface BoardMapper {

	//@Select("select * from tbl_board where bno > 0")
	public List<BoardVO> getList();
	
	public void insert(BoardVO board);
	public void insertSelectKey(BoardVO board);
}

```

### BoardMapper.xml

```jsp
<!-- 데이터 삽입 -->
<insert id="insert">
	insert into tbl_board(bno, title, content, writer)
	values (seq_board.nextval, #{title}, #{content}, #{writer})
</insert>

<insert id="insertSelectKey">
	<selectKey keyProperty="bno" order="BEFORE"
		resultType="long">
		select seq_board.nextval from dual
	</selectKey>
	
	insert into tbl_board(bno, title, content, writer)
	values(#{bno}, #{title}, #{content}, #{writer})
</insert>
<!-- //데이터 삽입 -->
```

---

### BoardMapperTest.java

```java
//insert
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");
		
		mapper.insert(board);
		
		log.info(board);
	}
	
	//insert bno 값 처리?
	@Test
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글 select key");
		board.setContent("새로 작성하는 내용 select key");
		board.setWriter("newbie");
		
		mapper.insert(board);
		
		log.info(board);
	}
```

---

##### read(select) 처리

### BoardMapper 인터페이스

```java
public BoardVO read(Long bno);
```

### BoardMapper.xml

```jsp
<!-- read -->
<select id="read" resultType="org.zerock.domain.BoardVO">
	select * from tbl_board where bno = #{bno}
</select>
<!-- //read -->
```

### BoardMapperTest.java

```java
//read
	@Test
	public void testRead() {
		
		//존재하는 게시물 번호로 테스트
		BoardVO board = mapper.read(5L);
		
		log.info(board);
	}
```

---

##### delete 처리

### BoardMapper 인터페이스

```java
public int delete(Long bno);
```

### BoardMapper.xml

```jsp
<!-- delete -->
<delete id="delete">
	delete from tbl_board where bno = #{bno}
</delete>
<!-- //delete -->
```

### BoardMapperTest.java

```java
//delete
	@Test
	public void testDelete() {
				
		log.info("DELETE COUNT : " + mapper.delete(3L));
	}
```

---

##### update 처리

### BoardMapper 인터페이스

```java
public int update(BoardVO board);
```

### BoardMapper.xml

```jsp
<!-- update -->
<update id="update">
	update tbl_board
	set title = #{title},
	content = #{content},
	writer = #{writer},
	updateDate = sysdate
	where bno = #{bno}
</update>
<!-- //update -->
```

### BoardMapperTest.java

```java
//update
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		//실행 전 존재하는 번호인지 확인할 것
		board.setBno(5L);
		board.setTitle("수정된 제목");
		board.setContent("수정된 내용");
		board.setWriter("user00");
		
		int count = mapper.update(board);
		
		log.info("UPDATE COUNT : " + count);
	}
```

---

# CRUD 소스 total

### BoardMapper 인터페이스

```java
package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;

public interface BoardMapper {

	//@Select("select * from tbl_board where bno > 0")
	public List<BoardVO> getList();
	
	public void insert(BoardVO board);
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
}

```

### BoardMapper.xml

```jsp
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
	PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="org.zerock.mapper.BoardMapper"> <!-- namespace은 Mapper 인터페이스와 동일한 이름 -->


<!-- 테이블 조회 -->
<select id="getList" resultType="org.zerock.domain.BoardVO"> <!-- id는 메서드의 이름과 일치 / resultType는 select 쿼리의 결과를 특정 클래스의 객체로 만들기 위해 설정 -->
	<![CDATA[  
		select * from tbl_board where bno > 0
	]]>
</select> <!-- CDATA는 XML에서 부등호를 사용하기 위해 사용 -->
<!-- //테이블 조회 -->


<!-- 데이터 삽입 -->
<insert id="insert">
	insert into tbl_board(bno, title, content, writer)
	values (seq_board.nextval, #{title}, #{content}, #{writer})
</insert>

<insert id="insertSelectKey">
	<selectKey keyProperty="bno" order="BEFORE"
		resultType="long">
		select seq_board.nextval from dual
	</selectKey>
	
	insert into tbl_board(bno, title, content, writer)
	values(#{bno}, #{title}, #{content}, #{writer})
</insert>
<!-- //데이터 삽입 -->


<!-- read -->
<select id="read" resultType="org.zerock.domain.BoardVO">
	select * from tbl_board where bno = #{bno}
</select>
<!-- //read -->


<!-- delete -->
<delete id="delete">
	delete from tbl_board where bno = #{bno}
</delete>
<!-- //delete -->


<!-- update -->
<update id="update">
	update tbl_board
	set title = #{title},
	content = #{content},
	writer = #{writer},
	updateDate = sysdate
	where bno = #{bno}
</update>
<!-- //update -->



</mapper>
	
```

### BoardMapperTest.java

```java
package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	//list
	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
	
	//insert
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");
		
		mapper.insert(board);
		
		log.info(board);
	}
	
	//insert bno 값 처리?
	@Test
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글 select key");
		board.setContent("새로 작성하는 내용 select key");
		board.setWriter("newbie");
		
		mapper.insert(board);
		
		log.info(board);
	}
	
	//read
	@Test
	public void testRead() {
		
		//존재하는 게시물 번호로 테스트
		BoardVO board = mapper.read(5L);
		
		log.info(board);
	}
	
	//delete
	@Test
	public void testDelete() {
				
		log.info("DELETE COUNT : " + mapper.delete(3L));
	}
	
	//update
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		//실행 전 존재하는 번호인지 확인할 것
		board.setBno(5L);
		board.setTitle("수정된 제목");
		board.setContent("수정된 내용");
		board.setWriter("user00");
		
		int count = mapper.update(board);
		
		log.info("UPDATE COUNT : " + count);
	}
}

```