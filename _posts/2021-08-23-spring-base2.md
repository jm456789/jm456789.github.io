---
layout: post  

title: "Spring 스프링 MVC 프로젝트의 기본 구성 / 2. 비즈니스 계층의 CRUD 구현 / 3. 프레젠테이션(웹) 계층의 CRUD 구현"
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

# 비즈니스 계층

비즈니스계층은 고객의 요구사항을 반영하는 계층으로, 프레젠테이션 계층과 영속 계층의 중간 다리 역할을 한다.   
영속 계층은 데이터베이스를 기준으로 설계를 나눠 구현,   
비즈니스 계층은 로직을 기준으로 해서 처리한다.   

일반적으로 비즈니스 영역에 있는 객체들은 서비스(Service) 라는 용어를 많이 사용.

### BoardService 인터페이스

```java
package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardService {

	//용어가 영속계층에 비해 일상적인 용어.. insert대신 register, update대신 modify 등...
	public void register(BoardVO board);
	public BoardVO get(Long bno);
	public boolean modify(BoardVO board);
	public boolean remove(Long bno);
	public List<BoardVO> getList();

}

```

### root-context.xml

**Namespaces 탭에서 context 체크!**   
<!-- 추가. 스프링의 서비스 객체 설정 --> 이부분 추가.

```jsp
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:mybatis-spring="http://mybatis.org/schema/mybatis-spring"
	xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="http://mybatis.org/schema/mybatis-spring http://mybatis.org/schema/mybatis-spring-1.2.xsd
		http://www.springframework.org/schema/beans https://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.3.xsd">
	
	<!-- Root Context: defines shared resources visible to all other web components -->
	
	
	
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
	
	
	
	
	<!-- 추가. 스프링의 서비스 객체 설정 -->
	<context:component-scan base-package="org.zerock.service"></context:component-scan>
	
	
		
</beans>

```

### BoardServiceImpl.java

```java
package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service  //service는 비즈니스 영역 담당하는 객체 표시
@AllArgsConstructor  //모든 파라미터를 이용하는 생성자를 만듬

//implements BoardService 해줘야 함. 
public class BoardServiceImpl implements BoardService {

	//lombok 이용하여 BoardMapper 객체 생성
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	
	//등록
	@Override
	public void register(BoardVO board) {		
		log.info("register.........." + board);
		mapper.insertSelectKey(board);  //persistence 영역에서 쓰던걸 Business에서 씀!! persistence와 DB 먼저 연결이 1번임.
	}
	
	
	//목록(리스트)
	@Override
	public List<BoardVO> getList(){		
		log.info("getList.............");
		return mapper.getList();
	}
	
	
	//조회
	@Override
	public BoardVO get(Long bno) {
		log.info("get................." + bno);
		return mapper.read(bno);
	}
	
	
	//삭제, 수정
	@Override
	public boolean modify(BoardVO board) {
		log.info("modify............." + board);
		return mapper.update(board) == 1;
	}
	
	@Override
	public boolean remove(Long bno) {
		log.info("remove..............." + bno);
		return mapper.delete(bno) == 1;
	}
	
}

```

### BoardServiceTests.java

```java
package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapperTest;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
	@Test
	public void testExist() {		
		log.info(service);
		assertNotNull(service);		
	}
	
	@Test
	public void testRegister() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");
		
		service.register(board);
		
		log.info("생성된 게시물의 번호 : " + board.getBno());
	}
	
	@Test
	public void testGetList() {
		service.getList().forEach(board -> log.info(board));
	}
	
	@Test
	public void testGet() {
		log.info(service.get(1L));
	}
	
	@Test
	public void testDelete() {
		//게시물 번호의 존재 여부를 확인하고 테스트 할 것
		log.info("REMOVE RESULT : " + service.remove(2L));
	}
	
	@Test
	public void testUpdate() {
		BoardVO board = service.get(1L);
		
		if(board == null) {
			return;
		}
		
		board.setTitle("제목 수정합니다.");
		log.info("MODIFY RESULT : " + service.modify(board));
	}
}

```

---

# 프레젠테이션(웹) 계층의 CRUD 구현

### BoardController.java

```java
package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	
	//목록
	@GetMapping("/list")
	public void list(Model model) {
		log.info("#################list");
		model.addAttribute("list", service.getList());
		
	}
	
	//등록
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("#################register : " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";  //목록(list)으로 보냄
	}
	
	//조회
	@GetMapping("/get")
	public void get(@RequestParam("bno") Long bno, Model model) {
		log.info("/get");
		model.addAttribute("board", service.get(bno));
	}
	
	//수정
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		log.info("#################modify" + board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";  //목록(list)으로 보냄
	}
	
	//삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("#################remove" + bno);
		
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";  //목록(list)으로 보냄
	}
	
}

```

### BoardControllerTests.java

```java
package org.zerock.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)

@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
						"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class BoardControllerTests {

	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	//목록
	@Test
	public void testList() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
		
	}
	
	//등록
	@Test
	public void testRegister() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
																	.param("title", "테스트 새글 제목")
																	.param("content", "테스트 새글 내용")
																	.param("writer", "user00")
											).andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	//조회
	@Test
	public void testGet() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get")
				.param("bno", "2"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
	
	//수정
	@Test
	public void testModify() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
															.param("bno", "1")
															.param("title", "수정된 테스트 새글 제목")
															.param("content", "수정된 테스트 새글 내용")
															.param("writer", "user00")
											).andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	//삭제
	@Test
	public void testRemove() throws Exception{
		//삭제 전 데이터베이스에 게시물 번호 확인할 것
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
															.param("bno", "25")
											).andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
}

```


