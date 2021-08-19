---
layout: post 

title: "Spring Sample Controller"
excerpt: ""

categories:
  - Spring
tags:
  - [Spring]
  
toc: true
toc_sticky: true
 
date: 2021-08-19
last_modified_at: 2021-08-19
---

---

# 프로젝트 생성 

new - Spring Legacy Project - Spring MVC Project 클릭 후 - next 클릭 - 패키지명 org.zerock.controller.. 걍암거나

# 스프링 기초 적용

### pom.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/maven-v4_0_0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>org.zeroc</groupId>
	<artifactId>controller</artifactId>
	<name>ex01</name>
	<packaging>war</packaging>
	<version>1.0.0-BUILD-SNAPSHOT</version>
	
	<!-- ★★★★★★★★★★★★★★★★수정 1.★★★★★★★★★★★★★★★★ -->
	<properties>
		<java-version>1.8</java-version>  <!-- 여기수정 -->
		<org.springframework-version>5.0.7.RELEASE</org.springframework-version>  <!-- 여기수정 -->
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
		
		<!-- ★★★★★★★★★★★★★★★★추가 3.★★★★★★★★★★★★★★★★ -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-test</artifactId>
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
		
		<!-- ★★★★★★★★★★★★★★★★수정 4.★★★★★★★★★★★★★★★★ -->
		<dependency>
			<groupId>log4j</groupId>
			<artifactId>log4j</artifactId>
			<version>1.2.17</version>   <!-- 여기수정, exclusions랑 scope 삭제 -->
			
		</dependency>

		<!-- @Inject -->
		<dependency>
			<groupId>javax.inject</groupId>
			<artifactId>javax.inject</artifactId>
			<version>1</version>
		</dependency>
				
				
		<!-- ★★★★★★★★★★★★★★★★추가 및 수정★★★★★★★★★★★★★★★★ -->		
		<!-- Servlet -->
		<!-- <dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>servlet-api</artifactId>
			<version>2.5</version>
			<scope>provided</scope>
		</dependency> -->
		
		
		
		<!-- https://mvnrepository.com/artifact/javax.servlet/javax.servlet-api -->
		<dependency>
		    <groupId>javax.servlet</groupId>
		    <artifactId>javax.servlet-api</artifactId>
		    <version>4.0.1</version>
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
	
		<!-- ★★★★★★★★★★★★★★★★수정 5.★★★★★★★★★★★★★★★★ -->
		<!-- Test -->
		<dependency>
			<groupId>junit</groupId>
			<artifactId>junit</artifactId>
			<version>4.12</version>  <!-- 여기수정 -->
			<scope>test</scope>
		</dependency>        
		
		
		<!-- ★★★★★★★★★★★★★★★★추가 2.★★★★★★★★★★★★★★★★ -->
		<!-- https://mvnrepository.com/artifact/org.projectlombok/lombok -->
		<dependency>
		    <groupId>org.projectlombok</groupId>
		    <artifactId>lombok</artifactId>
		    <version>1.18.12</version>
		    <scope>provided</scope>
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
            
            <!-- ★★★★★★★★★★★★★★★★수정 1.★★★★★★★★★★★★★★★★ -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>2.5.1</version>
                <configuration>
                    <source>1.8</source>  <!-- 여기수정 -->
                    <target>1.8</target>  <!-- 여기수정 -->
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

---

# 흐름

web.xml이 기초? 기본?. 어쨌든 흐름 보면    

1. root-context.xml 에서 java들이 컨트롤 된다?
2. servlet - DispatcherServlet이 부분이 front를 컨트롤 한다
3. servlet-context.xml 로 들어가서 보면 prefix : /WEB-INF/views/ 와 suffix : .jsp가 있음. => **views 폴더에 들어있는 .jsp들을 컨트롤. front부분을 다룬다**
3. -1. servlet-mapping에서 <url-pattern>/</url-pattern> 이걸 보면 / 있는 부분은 다 여기로 옴? **front에서 jsp 경로들 사이에 / 있으니 다 여기로 온다**

### web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app version="2.5" xmlns="http://java.sun.com/xml/ns/javaee"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://java.sun.com/xml/ns/javaee https://java.sun.com/xml/ns/javaee/web-app_2_5.xsd">

	<!-- The definition of the Root Spring Container shared by all Servlets and Filters -->
	<context-param>
		<param-name>contextConfigLocation</param-name>
		<param-value>/WEB-INF/spring/root-context.xml</param-value>
	</context-param>
	
	<!-- Creates the Spring Container shared by all Servlets and Filters -->
	<listener>
		<listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
	</listener>

	<!-- Processes application requests -->
	<servlet>
		<servlet-name>appServlet</servlet-name>
		<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>  <!-- DispatcherServlet이게 front Controller임 -->
		<init-param>
			<param-name>contextConfigLocation</param-name>
			<param-value>/WEB-INF/spring/appServlet/servlet-context.xml</param-value>   <!-- 이파일 가서 보기 -->
		</init-param>
		<load-on-startup>1</load-on-startup>
	</servlet>
		
	<servlet-mapping>
		<servlet-name>appServlet</servlet-name>
		<url-pattern>/</url-pattern>   <!-- 이부분 눈여겨 보기 -->
	</servlet-mapping>

</web-app>

```

### servlet-context.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans:beans xmlns="http://www.springframework.org/schema/mvc"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:beans="http://www.springframework.org/schema/beans"
	xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="http://www.springframework.org/schema/mvc https://www.springframework.org/schema/mvc/spring-mvc.xsd
		http://www.springframework.org/schema/beans https://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/context https://www.springframework.org/schema/context/spring-context.xsd">

	<!-- DispatcherServlet Context: defines this servlet's request-processing infrastructure -->
	
	<!-- Enables the Spring MVC @Controller programming model -->
	<annotation-driven />

	<!-- Handles HTTP GET requests for /resources/** by efficiently serving up static resources in the ${webappRoot}/resources directory -->
	<resources mapping="/resources/**" location="/resources/" />

	<!-- Resolves views selected for rendering by @Controllers to .jsp resources in the /WEB-INF/views directory -->
	<beans:bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
		<beans:property name="prefix" value="/WEB-INF/views/" />   <!-- 이부분 눈여겨 보기 -->
		<beans:property name="suffix" value=".jsp" />   <!-- 이부분 눈여겨 보기 -->
	</beans:bean>
	
	<context:component-scan base-package="org.zeroc.controller" />
	
	
	
</beans:beans>

```

---

# jsp get, post 연습

* p.125
* HttpServletRequest, HttpServletResponse를 거의 사용할 필요 없이 필요한 기능 구현
* 다양한 타입의 파라미터 처리, 다양한 타입의 리턴 타입 사용 가능
* GET방식, POST방식 등 전송 방식에 대한 처리를 어노테이션으로 처리 가능
* 상속/인터페이스 방식 대신에 어노테이션만으로도 필요한 설정 가능

---

### server

서버 Modules에서 Path 지우고 / 만 남기기

---

### SampleCntroller.java

```java
package org.zeroc.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.SampleDTO;
import org.zerock.domain.SampleDTOList;
import org.zerock.domain.TodoDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {
	
	
	//기본방식? --------------------------------------------------------------------------------------	
	@RequestMapping("")
	public void basic() {
		log.info("basic..............");
	}
	
	@RequestMapping("/sample/ok")
	public String basic1() {
		log.info("basic 1..............");
		return "/sample/ok";  //해당 위치에 ok.jsp 파일 있어야 함.
	}
	
	
	
	
	
	//@RequestMapping의 변화--------------------------------------------------------------------------------------	
	@RequestMapping(value="/basic", method = {RequestMethod.GET, RequestMethod.POST})  //이전방식. 옛날 스타일
	public void basicGet() {
		log.info("basic get..............");		
	}
	
	@GetMapping("/basicOnlyGet") //위 @RequestMapping의 축약형의 표현 @GetMapping, @PostMapping이 있다
	public void basicGet2() {
		log.info("basic get only get..............");
	}
	
	
	
	
	
	//Controller의 파라미터 수집. 매번 request.getParameter()이용 대신 SampleDTO 클래스 만들어서 작성--------------------------------------------------------------------------------------	
	@GetMapping("/ex01")
	public String ex01(SampleDTO dto) {
		log.info(" " + dto);
		return "ex01";
	}  //필요에 따라 http://localhost:8090/sample/ex01?name=AAA&age=29와 같은 형태로 추가해서 호출 가능. 페이지는 안보이고 스프링에서 console 나오는지 봐야함
	//결과 : INFO : org.zeroc.controller.SampleController -  SampleDTO(name=AAA, age=29)
	//SampleDTO 객체 안에 name과 age 속성이 제대로 수집됐다. 특히 주목할 점은 자동으로 타입을 변환해서 처리. int타입으로 선언된 age가 자동으로 숫자로 변환
	
	
	//기본 자료형이나 문자열 등을 이용한다면 파라미터의 타입만을 맞게 선언해주는 방식 사용 가능하다
	@GetMapping("/ex02")
	public String ex02(@RequestParam("name") String name, @RequestParam("age") int age) {  //위랑 같으나 다른 방식. 파라미터로 사용된 변수의 이름과 전달되는 파라미터의 이름이 다른 경우 유용
		log.info("name : " + name);
		log.info("age : " + age);
		return "ex02";
	}  //http://localhost:8090/sample/ex02?name=ABAB&age=21와 같은 형태로 추가해서 호출 가능. 페이지는 안보이고 스프링에서 console 나오는지 봐야함
	// 결과 : INFO : org.zeroc.controller.SampleController - name : ABAB
	// 결과 : INFO : org.zeroc.controller.SampleController - age : 21
	
	
	
	
	
	//리스트, 배열. 동일한 이름의 파라미터가 여러 개 전달되는 경우--------------------------------------------------------------------------------------	
	//스프링은 파라미터의 타입을 보고 객체를 생성. 파라미터의 타입은 List<>와 같이 인터페이스 타입이 아닌 실제적인 클래스 타입으로 지정.
	@GetMapping("/ex02List")
	public String ex02List(@RequestParam("ids")ArrayList<String> ids) {
		log.info("ids : " + ids);
		return "ex02List";
	}  //http://localhost:8090/sample/ex02List?ids=111&ids=222&ids=333 호출. console 확인
	//결과 : INFO : org.zeroc.controller.SampleController - ids : [111, 222, 333]
	
	@GetMapping("/ex02Array")  //배열도 동일하게 처리 가능.
	public String ex02Array(@RequestParam("ids") String[] ids) {
		log.info("array ids : " + Arrays.toString(ids));
		return "ex02Array";
	}  //http://localhost:8090/sample/ex02Array?ids=111&ids=222&ids=333
	//결과 : INFO : org.zeroc.controller.SampleController - array ids : [111, 222, 333]
	
	
	
	
	
	//객체 리스트. Bean사용--------------------------------------------------------------------------------------
	//예를들어 SampleDTO를 여러 개 전달받아서 처리하고 싶다면 SampleDTO의 리스트를 포함하는 SampleDTOList 클래스 설계.
	//파라미터는 [인덱스]와 같은 형식으로 전달해서 처리할 수 있음
	@GetMapping("/ex02Bean")
	public String ex02Bean(SampleDTOList list) {
		log.info("list dtos : " + list);
		return "ex02Bean";
	}  //http://localhost:8090/sample/ex02Bean?list[0].name=aaa&list[1].name=bbb
	//톰캣은 []를 특수문자로 허용하지 않을 수 있음. 그럴때는 아래걸로
	//http://localhost:8090/sample/ex02Bean?list%5B0%5D.name=aaa&list%5B1%5D.name=bbb
	//결과 : INFO : org.zeroc.controller.SampleController - list dtos : SampleDTOList(list=[SampleDTO(name=aaa, age=0), SampleDTO(name=bbb, age=0)])
	
	
	
	
	
	//파라미터를 변환해서 처리해야 하는 경우--------------------------------------------------------------------------------------
	//변환이 가능한 데이터는 자동으로 변환되지만 경우에 따라서는 파라미터를 변환해서 처리해야 하는 경우도 존재. ex) 2018-01-01과 같이 문자열로 전달된 데이터를 java.util.Date타입으로 변환
	//TodoDTO 클래스 작성
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, false));
	}
	
	@GetMapping("/ex03")
	public String ex03(TodoDTO todo) {
		log.info("todo : " + todo);
		return "ex03";
	}
	//http://localhost:8090/sample/ex03?title=test&dueDate=2018-01-01 호출. 콘솔 확인
	//결과 : 오류,,,
	
	
	
	
	
	//Model 객체는 jsp에 컨트롤러에서 생성된 데이터를 담아서 전달하는 역할--------------------------------------------------------------------------------------
	//servlet에서 request.setAttribute()와 유사한 역할.
	//request.setAttribute("serverTime", new java.util.Date());
	//RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/hone.jsp");
	//dispatcher.forward(request, response);
	
	//결과 데이터를 전달하려면 Model에 담아서 전달. @ModelAttribute 사용. ex04.jsp 작성	
//	@GetMapping("/ex04") 
//	public String ex04(SampleDTO dto, @ModelAttribute("page") int page) { 
//		log.info("dto : " + dto);
//		log.info("page : " + page); 
//		return "/sample/ex04"; 
//	}
	
	//http://localhost:8090/sample/ex04?name=aaa&age=11&page=9 호출
	// 결과 : 화면과 console 동시에 나옴.
	
	
	@GetMapping("/ex04") //위에꺼 void로 변경, return제거해도 된다. 
	public void	ex04(SampleDTO dto, @ModelAttribute("page") int page) { 
		log.info("dto : " +	dto); 
		log.info("page : " + page); 
	}  //확인시 http://localhost:8090/sample/ex04?name=aaa&age=35&page=15 
	
	
	
	
	
	//Model 타입과 더블어 자동으로 전달해주는 타입인 Redirect Attributes. 일회성으로 데이터 전달--------------------------------------------------------------------------------------
	//req01.jsp, req02.jsp 만들어야함
	@GetMapping("req01")
	public String req01() {
		log.info("### req01 ");
		return "redirect:/sample/req02";
	}
	//http://localhost:8090/sample/req01 호출
	
}

```

---

### SampleDTO.java

```java
package org.zerock.domain;

import lombok.Data;

@Data  //getter/setter, equals(), toString()를 어노테이션을 사용해서 lombok이 대신 해줌. 자동생성
public class SampleDTO {
	private String name;
	private int age;
}

```

---

### SampleDTOList.java

```java
package org.zerock.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class SampleDTOList {
	private List<SampleDTO> list;
	
	public SampleDTOList() {
		list = new ArrayList<>();
	}
}

```

---

### TodoDTO.java

```java
package org.zerock.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TodoDTO {
	private String title;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Data dueDate;
}

```

---

### ex04.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>SAMPLEDTO ${sampleDTO} </h2>
<h2>PAGE ${page}</h2> 

</body>
</html>
```

---

### req01.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
req01
</body>
</html>
```

### req02.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
req02
</body>
</html>
```