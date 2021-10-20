---
layout: post  

title: "이승호교수님 스프링 수업 대충 정리~" 
excerpt: ""

categories:
  - Spring
tags:
  - [Spring]
  
toc: true
toc_sticky: true
 
date: 2021-10-20
last_modified_at: 2021-10-20
---

---

> db 채번->나중에 유지보수를 위해 사용(시퀀스 넘버보다). 통으로 백업떠서 통으로 사용
> 동시성
> 
> 동시성 synchronized 키워드 붙이면 된다
> 
> return dto, 잭슨바인드? 머 추가 해줘야함
> 
> reset controller
> 
> insert는 레코드 rock을 걸 수 없음. -> 미리 값을 만듬(초기값 0)
> 
> cms -> wordpress, gnu보드(그누보드), 제로보드(XpressEngine)
> 
> URL은 주소같은거
> URL는 하나의 기능 같은거
> 
> [] 각괄호는 배열이다.
> [{},
> {}
> ]
> 
> 자바스크립트는 매개변수에 변수나 함수 담기 가능
> 
> 
> 
> 과제~
> 제로보드, 그누보드, 워드프레스 중 하나 설치해서 작동시켜보기.
> 어떻게 사용하는지 구조만 보라고
> 
> 인서트, 업데이트, 머 하는거?
> 이름, 전화번호 등록
> 레스트 컨트롤러 호출해서 데이터 등록하고, 결과 받아다가 밑에다가 등록된 사람들 명부 출> > 력하는 형태
> 등록하고 갱신, 필요할 때 등록버튼 누르면 다시 갱신?
> 
> 등록, 수정, 삭제 후에 댓글 목록 갱신
> 
> 
> #day2
> @RestController
> rest는 html 태그같은 군더더기 없이 데이터만 돌려줌.
> 그래서 앱에서 제이슨 형태로 받아 분할해서 처리를 해줌.
> 
> ***잭슨바인드*** 설치 해야지만 맵으로 리턴시 xml이나 json방식으로 > 표현해줌!!!!!!!!!!!!!!!!
> 
> 트랜잭션은 하나의 작업 단위(insert와 update 동시에 ex 포인트 충전시 충전하고 업데이트)
> 트랜잭션은 두 개 다 되야 할 수 있음. 하나만 성공하면 다시 원래대로 돌려놔야 함
> 트랜잭션의 원칙 ACID
> pom.xml에 추가해주고, 트랜잭셔널 어노테이션 추가해서 사용
> 
> 기록하는데 집중하는 상황은 정규화 사용! 불필요한 중첩 제거, 디스크 공간 확보
> 그러나 갖다 써야 하는 테이블은 정규화 가급적 깨뜨리고 역정규화(반정규화)로 사용
> 
> 반정규화 할 때 트리거 사용한다. 특정 테이블에 트리거를 걸면(ex 업데이트 트리거 걸었을 대 > 변동이 발생되면 해당 테이블에 가서 똑같이 변경해줌(다른데 부수적으로, 연쇄적으로 변경 들어갈 때 트리거 사용. 또는 프로시저를 이용하여 관리
> 
> 파일 업로드 라이브러리들
> 유효 아이디를 발행하여 사용(파일명, 확장자를 데이터베이스에 저장함)
> Hash(사람 지문같은거)코드 사용해서 동일한 해시코드를 가진 사람이 있냐없냐, 있다면 역으로 > 넣어줌? -> 동일한 파일을 계속 업로드하면 계속 새로운거 저장하는걸 해결
> 
> 썸네일 이미지 따로 만드는거 필수!
> 
> 불필요한 파일들 어떻게 제거할 것인가?
> 관리자가 명시적으로 직접 처리, 뭐가 자동으로 처리. 두가지 방법 있음.
> 
> Quartz 배치처리해서 뭐...(삭제인 듯)
> 쿼츠 주기 셋팅.
> 
> 파일 테이블
> id, hash, uuid, filename, exit(확장자)
> 
> 게시판 테이블과 파일 테이블을 연결하는 매핑테이블을 따로 만들어야함(한 아이디가 여러개의 > 파일을 업로드 할 수 있게)
> 
> 게시물과 매핑되지 않은 파일들을 삭제.
> 파일테이블에 등록되어있지 않은 데이터를 삭제해줘야함.

---

# @RestController 사용, db 채번 형식으로 번호 매겨주기

### index.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>EX</title>
    
	<script type="text/javascript" src="/resources/js/common.js"></script>
	<script type="text/javascript" src="/resources/js/jquery-3.1.1.min.js"></script>
	
    <style>
    	form{border:1px solid black; height:100px; margin-bottom:30px;} 
    </style>
    
    <script>
    	
    		function add(){
    			console.log("add reply...");
    			
    			$.ajax({
    				type:'get',
    				url:'/',
    				data:{name:'test....'},
    				//contentType:"application/json; charset=utf-8",  
    				contentType:"text/plain; charset=utf-8",  
    				success:function(result, status, xhr){
   						alert(result);
    				},
    				error:function(xhr, status, er){
    					alert(er);
    				}
    			})
    		}
    		
    </script>
    
    
</head>
<body>



<!-- 
<form method="post" action="/user">
	<input type="text" name="name" />
	<input type="submit" value="user 내거" />	
</form>
  

<form method="post" action="/test">
	<input type="text" name="name" />	
	<input type="submit" value="user 교수님거" />
</form>

<br /><br /><br /><br /><br />

<p>---------------------------------------------------------------------------------------------------------------------------------------------------</p>

<br /><br /><br /><br /><br />

<h1>과제</h1>
<h2>restcontroller 이용해서 insert, update, modify</h2>

<form method="post" action="/ex"> 
	<input type="text" name="name" placeholder="이름 입력" />	<br /> 
	<input type="text" name="name" placeholder="전화번호 입력" />	<br /> 
	<input type="submit" value="insert" /> 
</form> -->


<button type="button" onclick="add()">버튼</button>
<input type="button" onclick="add()" value="버튼"/>


  
</body>
</html>


```

---

### HomeController.java

```java
package com.org.zerock;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.controller.BoardController;
import org.zerock.domain.BoardVO;
import org.zerock.domain.TBoardVO;
import org.zerock.domain.TSystemVO;
import org.zerock.domain.TUserVO;
import org.zerock.domain.TWorkVO;
import org.zerock.service.BoardService;
import org.zerock.service.ExService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
@AllArgsConstructor
public class HomeController {
	
	private ExService service;
	
	
//	@RequestMapping(value = "/", method = RequestMethod.POST)
//	public String index() {
//		return "index";
//	}
	
	@GetMapping("/")
	public String index() {
		return "index"; 
	}
	
	//user - 내꺼
	@PostMapping("/user")
	public String user() {
		service.regUser();
		return "index";
	}
	
	//교수님거
	@RequestMapping(value="/test", method = RequestMethod.GET)
	public String testInsert()
	{
		service.registUserData();
		return "index";
	}
	

	
	@RequestMapping(value="/chtting", method=RequestMethod.GET)
	public String msgView(HttpServletRequest request, HttpServletResponse resp, Model model) throws Exception{
		return "chtting";
	}
	
	
	
	
	
	
	
	
		
}

```

---

### ExRestController.java

```java
package com.org.zerock;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.controller.BoardController;
import org.zerock.domain.BoardVO;
import org.zerock.domain.TBoardVO;
import org.zerock.domain.TSystemVO;
import org.zerock.domain.TUserVO;
import org.zerock.domain.TWorkVO;
import org.zerock.service.BoardService;
import org.zerock.service.ExService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@RestController
@Log4j
@AllArgsConstructor
public class ExRestController {
	
	
	@GetMapping(value = "/", produces = "text/plain; charset=UTF-8", params= {"name"})
	public String getText(String name) {
				
		return name + "님 안녕하세요";
	}
	
		
}

```

### ExService.java

```java
package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.TBoardVO;
import org.zerock.domain.TSystemVO;
import org.zerock.domain.TUserVO;
import org.zerock.domain.TWorkVO;

public interface ExService {
	
	public void regUser();  //내거
	
	public void registUserData();  //교수님거
	
	
}

```

### ExServiceImpl.java

```java
package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.TBoardVO;
import org.zerock.domain.TSystemVO;
import org.zerock.domain.TUserVO;
import org.zerock.domain.TWorkVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ExMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service  //service는 비즈니스 영역 담당하는 객체 표시
@AllArgsConstructor  //모든 파라미터를 이용하는 생성자를 만듬

//implements BoardService 해줘야 함. 
public class ExServiceImpl implements ExService {

	//lombok 이용하여 BoardMapper 객체 생성
	@Setter(onMethod_ = @Autowired)
	private ExMapper mapper;
	
	
	//내거
	@Override
	public void regUser() {		
		mapper.updateUser();
		String k = mapper.getUserSeq().toString();
		mapper.insertUser(k);
	}
	
	//교수님거
	@Override
	public void registUserData() {
		// TODO Auto-generated method stub
		mapper.updateUserSeq();
		String k = mapper.getUserSeq().toString();
		System.out.println(k);
		mapper.registUserData(k);
	}

	
	
	
	
	
}

```

### ExMapper.java

```java
package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.TBoardVO;
import org.zerock.domain.TSystemVO;
import org.zerock.domain.TUserVO;
import org.zerock.domain.TWorkVO;

public interface ExMapper {

	public void updateUser();
	public String getUserSeq();
	public void insertUser(String k);
	
	
	//교수님거
	public void registUserData(String pk);
	public void updateUserSeq();
	public String getUserSeqT();

	
}

```

### ExMapper.xml

```java
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
	PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="org.zerock.mapper.ExMapper"> <!-- namespace은 Mapper 인터페이스와 동일한 이름 -->


<!-- 데이터 삽입 -->
<update id="updateUser">
	update t_pk
	set value2 = value2 + 1
	where code = 'USR'
</update>

<select id="getUserSeq" resultType="String">
	select CONCAT('USR_', value2) 
	from t_pk
	where code = 'USR'
</select>

<insert id="insertUser">
	insert into t_user(no, name)
	values (#{k}, '...') 
</insert>





<!-- 교수님거 -->
<insert id="registUserData">
	insert into t_user(TAB_PK, DATA) values(#{pk}, '...')
</insert>

<update id="updateUserSeq">
	update t_pk set value = value + 1 where code = 'USR'
</update>
  
<select id="getUserSeqT" resultType="String">
	select concat(concat(code,'_'),value) as pk from t_pk where code='USR'
</select>













</mapper>
	
```

---
---
---

# 웹소켓 이용해서 채팅해보기

### pom.xml

```java

		<!-- Websocket 추가 -->
		<dependency>
		    <groupId>org.springframework</groupId>
		    <artifactId>spring-websocket</artifactId>
		    <version>4.3.22.RELEASE</version>
		</dependency>
		
		<!-- JacksonBind 추가 -->
		<dependency>
		    <groupId>com.fasterxml.jackson.core</groupId>
		    <artifactId>jackson-databind</artifactId>
		    <version>2.9.6</version>
		</dependency>
		
```

### websocket-config.xml

```java
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:websocket="http://www.springframework.org/schema/websocket"
	xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/websocket http://www.springframework.org/schema/websocket/spring-websocket-4.3.xsd">

	<websocket:handlers allowed-origins="*" >
        <websocket:mapping handler="handlerWs" path="/msg" />
        <websocket:sockjs websocket-enabled="true" />
    </websocket:handlers>
    
    <bean id="handlerWs" class="org.zerock.handler.HandlerWs" />
    
</beans>
```

### HandlerWs.java

```java
package org.zerock.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class HandlerWs extends TextWebSocketHandler {

	private List<WebSocketSession> lstSession = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		
		//세션 리스트에 접속한 사용자 세션 추가
		lstSession.add(session);
		try {
			broadcastMsg("hello");
		}catch(IOException ioe) {
			System.out.println("[10000] init message broadcast Error...");
		}
		
	}
	
	//사용자가 전송한 메시지 처리
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage msg) {
		//수신한 메시지... 전체 사용자들에게 전송
		try {
			broadcastMsg(session.getId() + " : " + msg.getPayload());
		}catch(IOException ioe) {
			System.out.println("[10000] init message broadcast Error...");
		}
	}
	
	//클라이언트 접속 종료...
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus stat) {
		lstSession.remove(session);
	}
	
	private void broadcastMsg(String msg) throws IOException{
		for(WebSocketSession s: lstSession) {
			s.sendMessage(new TextMessage(msg));
		}
		
		System.out.println("[OK] " + msg);
	}
	
}

```

### web.xml

```java
<param-value>
				/WEB-INF/spring/appServlet/servlet-context.xml
				/WEB-INF/spring/appServlet/websocket-config.xml
			</param-value>
```

### chtting.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>EX</title>
    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
    
    <script type= text/javascript>    	
   		var strSession="";
   		var ws = {
			init:function(arg){
				this._url=arg.url;
				this._initSocket();
			},
			sendMsg:function(){
				this._sendMessage($("#message").val());
				$("#message").val("");
			},
			receiveMessage:function(msg){
				if(strSession == ""){
					strSession = this._socket._transport.url;
					serSession = strSession.split("/");
					strSession = strSession[strSession.length-2];
					$("#divChatData").append('<div>' + strSession + '</div>');
				}
				
				$("#divChatData").append('<div> 세션 ID : ' + msg + '</div');
			},
			disconnect:function(){
				this._socket.close();
			},
			_initSocket:function(){
				this._socket = new SockJS(this._url);
				
				this._socket.onmessage = function(evt){
					ws.receiveMessage(evt.data);
				};
				this._socket.onclose = function(evt){
					alert(evt.data);
				}
			},
			_sendMessage:function(str){
				this._socket.send(str);
			}
   		}    		
    </script>
    <script type= text/javascript>
    	$(document).ready(function(){
    		ws.init({ url:'<c:url value="/msg" />' });
    	});
    </script>
    
    
</head>
<body>





<div style="width:800px; height:700px; padding:10px; border:1px solid red;">
	<div id="divChatData"></div>
</div>

<div style="width:100%; height:10%; padding:10px;">
	<input type="text" id="message" onkeypress="if(event.keyCode==13){ws.sendMsg();}" />
	<input type="button" id="btnSend" value="전송 " onclick="ws.sendMsg()" />
</div>
  
  
  
  
  
  
</body>
</html>


```
