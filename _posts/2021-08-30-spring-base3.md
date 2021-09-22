---
layout: post    

title: "Spring 스프링 MVC 프로젝트의 기본 구성 / 4. 부트스트랩 사용해서 게시판 만들기" 
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

---

# 부트스트랩 사용법

**Servers - Tomcat 더블클릭 후 - Modules 탭에 가서 해당 프로젝트 Path /로만 설정**

1. startbootstrap-sb-admin-2-gh-pages.zip 파일 다운로드 - pages폴더 안에 - tables.html을 갖다 쓸것임   
2. servlet-context.xml 파일 보면 <resources mapping="/resources/**" location="/resources/" />이란게 있음. 그러므로 js 및 css 파일들을 src-main-webapp-resources안에 넣기   
3. views 폴더 - board 폴더 생성 - list.jsp 생성 후 tables.html소스 통째로 복붙하나 header와 footer는 include처리 (header, footer include => <%@include file="../includes/header.jsp" %>)      
4. views 폴더 - includes 폴더 생성 - header.jsp, footer.jsp 오려 넣고 약간 수정 p.233~

### header.jsp 

```jsp
...생략...
<div id="page-wrapper">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
```

### footer.jsp

```jsp
...생략...
<script>
  $(document).ready(function() {
    $('#dataTables-example').DataTable({
      responsive: true
    });
    $(".sidebar-nav")
      .attr("class","sidebar-nav navbar-collapse collapse")
      .attr("aria-expanded",'false')
      .attr("style","height:1px");
  });
</script>

</body>

</html>
```

---

### list.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<%@include file="../includes/header.jsp" %>



            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board List Page
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>#번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>
                                </thead>
                                
                                <tbody>
                                    <c:forEach items="${list}" var="board">
	                                	<tr>
	                                		<td><c:out value="${board.bno }" /></td>
	                                		<td><c:out value="${board.title }" /></td>
	                                		<td><c:out value="${board.writer }" /></td>
	                                		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }" /></td>
	                                		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }" /></td>
	                                	</tr>
	                                </c:forEach>
                                </tbody>
                                
                            </table>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
        </div>
        <!-- /#page-wrapper -->


<%@include file="../includes/footer.jsp" %>



```

---

# 등록 입력 페이지와 등록 처리

> 등록 입력 페이지와 등록 처리. 게시물 등록 작업은 POST 방식으로 처리하지만, GET 방식으로 입력 페이지를 볼 수 있도록 BoardController.java에 메서드 추가   
> 등록 시 BoardController에 전달될 때 한글 깨진상태로 전달된다. => web.xml에 필터 추가

##### BoardController.java

```java
@GetMapping("/register")
	public void register() {
		
	}//register()는 입력 페이지를 보여주는 역할만 하기 때문에 별도의 처리가 필요하지 않음.
```

### register.jsp

> views 폴더 - board 폴더 - register.jsp 생성

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Register</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board Register
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
	                        <form role="form" action="/board/register" method="post">
	                        	<div class="form-group">
	                                <label>title</label>
	                                <input class="form-control" name="title">
	                            </div>
	                            
	                            <div class="form-group">
	                                <label>Text area</label>
	                                <textarea class="form-control" rows="3" name="content"></textarea>
	                            </div>
	                            
	                            <div class="form-group">
	                                <label>Writer</label>
	                                <input class="form-control" name="writer">
	                            </div>
	                            
	                            <button type="submit" class="btn btn-default">Submit Button</button>
	                            <button type="reset" class="btn btn-default">Reset Button</button>
	                            
	                        </form>
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
        </div>
        <!-- /#page-wrapper -->

<%@include file="../includes/footer.jsp" %>


```

### web.xml

```jsp
<!-- 리스트 등록 시 한글 깨짐 문제 해결 -->
	<filter>
		<filter-name>encoding</filter-name>
		<filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
		<init-param>
			<param-name>encoding</param-name>
			<param-value>UTF-8</param-value>
		</init-param>
	</filter>
	
	<filter-mapping>
		<filter-name>encoding</filter-name>
		<servlet-name>appServlet</servlet-name>
	</filter-mapping>
```

---

# 재전송(redirect) 처리

> BoardController에서 register() 메서드는 'redirect:/board/list'를 전송하고, 브라우저는 이를 통보받은 후 '/board/list'로 이동한다.   
> 만일 이와같이 재전송을 하지 않는다면 브라우저의 새로고침을 통해서 동일한 내용을 계속 서버에 등록하는 문제 발생(도배)   
> 브라우저에서는 이런 경우 경고창을 보여주긴 하지만 근본적으로 차단하지는 않음.   
> 따라서 등록, 수정, 삭제 작업은 처리가 완료된 후 URL을 이동하는 방식 사용한다. 여기서 결과를 알 수 있도록 피드백을 줘야 하는데 경고창이나 모달창을 이용한다.
> 
> BoardController에서 redirect 처리할 때 RedirectAttributes라는 객체를 사용. addFlashAttribute의 경우 이러한 처리에 적합하다 => 일회성으로만 데이터를 전달하기 때문.
> addFlashAttribute로 보관된 데이터는 단 한번만 사용할 수 있게 보관된다.

##### 모달 창 보여주기

pages 폴더 내 notifications.html 참고하여 list.jsp 내에 table 태그의 아래쪽에 모달 div 추가 및 모달창 보여주는 쿼리 추가


### list.jsp

```jsp
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
               	처리가 완료되었습니다.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- 모달창 보여주는 쿼리 -->
<script type="text/javascript">
	$(document).ready(function(){
		
		var result = '<c:out value="${result}" />';
		
		checkModal(result);
		
		function checkModal(result){
			if(result === ''){
				return;
			}
			
			if(parseInt(result) > 0){
				$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");  //새로운 게시글이 작성되는 경우 Redirect Attributes로 게시물의 번호가 전송되므로, 이를 이용해서 모달 내용 수정
			}
			
			$("#myModal").modal("show");
		}
	});
</script>
```

---

# 목록(list.jsp)에서 게시글 등록(register.jsp)로 이동

### list.jsp

```jsp

...생략...

<div class="panel-heading">
    Board List Page
    <button id="regBtn" type="button" class="btn btn-xs pull-right">Register New Board</button>
</div>

...생략...
...생략...
...생략...

<!-- 하단 스크립트 $(document).ready(function(){에 추가 -->
//list에서 Register New Board버튼 클릭(register.jsp로 페이지 이동) 할 때 작동
$("#regBtn").on("click", function(){
    self.location = "/board/register";
});


```

---

# 목록(list.jsp)에서 특정 번호의 게시물 조회 기능

> views 폴더 - board 폴더 - register.jsp 복사해서 get.jsp 생성

### get.jsp

버튼에 onclick으로 직접 링크 처리한 경우와,   
다양한 상황을 처리하기 위해 form태그를 이용해서 수정한 2가지 방법이 있음.

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>

	<div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">Board Read</h1>
	    </div>
	    <!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	
	
	<div class="row">
	    <div class="col-lg-12">
	        <div class="panel panel-default">
	            <div class="panel-heading">
	                Board Read Page
	            </div>
	            <!-- /.panel-heading -->
	            <div class="panel-body">
	            
	            	<div class="form-group">
	                    <label>Bno</label>
	                    <input class="form-control" name="bno" value='<c:out value="${board.bno }" />' readonly="readonly">
	                </div>
	                
	            	<div class="form-group">
	                    <label>title</label>
	                    <input class="form-control" name="title" value='<c:out value="${board.title }" />' readonly="readonly">
	                </div>
	                
	                <div class="form-group">
	                    <label>Text area</label>
	                    <textarea class="form-control" rows="3" name="content" readonly="readonly"><c:out value="${board.content }" /></textarea>
	                </div>
	                
	                <div class="form-group">
	                    <label>Writer</label>
	                    <input class="form-control" name="writer" value='<c:out value="${board.writer }" />' readonly="readonly">
	                </div>
	                
	                <button data-oper='modify' class="btn btn-default" onclick="location.href='/board/modify?bno=<c:out value="${board.bno }"/>'">Modify</button>
	                <button data-oper='list' class="btn btn-info" onclick="location.href='/board/list'">List</button>
	                 
	                
	            </div>
	            <!-- /.panel-body -->
	        </div>
	        <!-- /.panel -->
	    </div>
	    <!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	    
	</div>
	<!-- /#page-wrapper -->

<%@include file="../includes/footer.jsp" %>

```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>

	<div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">Board Read</h1>
	    </div>
	    <!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	
	
	<div class="row">
	    <div class="col-lg-12">
	        <div class="panel panel-default">
	            <div class="panel-heading">
	                Board Read Page
	            </div>
	            <!-- /.panel-heading -->
	            <div class="panel-body">
	            
	            	<div class="form-group">
	                    <label>Bno</label>
	                    <input class="form-control" name="bno" value='<c:out value="${board.bno }" />' readonly="readonly">
	                </div>
	                
	            	<div class="form-group">
	                    <label>title</label>
	                    <input class="form-control" name="title" value='<c:out value="${board.title }" />' readonly="readonly">
	                </div>
	                
	                <div class="form-group">
	                    <label>Text area</label>
	                    <textarea class="form-control" rows="3" name="content" readonly="readonly"><c:out value="${board.content }" /></textarea>
	                </div>
	                
	                <div class="form-group">
	                    <label>Writer</label>
	                    <input class="form-control" name="writer" value='<c:out value="${board.writer }" />' readonly="readonly">
	                </div>
	                
	                <button data-oper='modify' class="btn btn-default">Modify</button>
	                <button data-oper='list' class="btn btn-info">List</button>
	                 
					<form id='operForm' action="/board/modify" method="get">
						<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno }"/>' >
					</form>
	                
	            </div>
	            <!-- /.panel-body -->
	        </div>
	        <!-- /.panel -->
	    </div>
	    <!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	    
	</div>
	<!-- /#page-wrapper -->
	
	
	
	
<!-- 버튼에 따라서 동작하는 쿼리 -->
<script type="text/javascript">
	$(document).ready(function(){
		
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e){			
			operForm.attr("action", "/board/modify").submit();			
		});
		
		$("button[data-oper='list']").on("click", function(e){			
			operForm.find("#bno").remove();			
			operForm.attr("action", "/board/list");			
			operForm.submit();			
		});
		
	});
</script>
	
	
	

<%@include file="../includes/footer.jsp" %>


```

---

# 목록 페이지와 뒤로가기 문제

### list.jsp

```jsp

...생략...

<td><c:out value="${board.bno }" /></td>
<td><a href='/board/get?bno=<c:out value="${board.bno }" />'><c:out value="${board.title }" /></a></td>
<td><c:out value="${board.writer }" /></td>

...생략...

```

##### 뒤로가기의 문제

> 목록 -> 등록 -> 모달 -> 목록 -> 조회 후 뒤로가기 버튼 클릭 시 -> 모달(문제발생)!   
> window의 history 객체는 스택 구조로 동작하기 때문에 history객체를 조작하여 모달창을 띄울 필요가 없다는 것을 해줌
> 기존 스크립트에서 history.replaceState({}, null, null);, || history.state 추가.. 먼소린지 모르겠음~

### list.jsp

```jsp
...생략...
...javascript부분...
$(document).ready(function(){
		
		//게시글 등록(register) 할 때 list.jsp로 오면서 모달 팝업창 띄우기
		var result = '<c:out value="${result}" />';
		
		checkModal(result);
		
		history.replaceState({}, null, null);  //뒤로가기 문제때문에 스택 구조상 history객체 조작
		
		function checkModal(result){
			if(result === '' || history.state){  //뒤로가기 문제때문에 스택 구조상 history객체 조작 =>  || history.state 추가
				return;
			}
			
			if(parseInt(result) > 0){
				$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");  
				//새로운 게시글이 작성되는 경우 Redirect Attributes로 게시물의 번호가 전송되므로, 이를 이용해서 모달 내용 수정
			}
			
			$("#myModal").modal("show");
		}

        ...생략...

```

---

# 게시물의 수정/삭제 처리

**조회 페이지**에는 <u>GET 방식</u>으로 처리되는 URL을 통해서 <u>수정/삭제 버튼이 존재하는 화면</u>을 볼 수 있게 제작.   
**수정/삭제 작업**은 <u>POST 방식</u>으로 처리되고, 결과는 다시 <u>목록화면</u>에서 확인할 수 있는 형태로 제작.

##### 수정/삭제 페이지로 이동

### BoardController.java 일부 수정

```java
//	//조회
//	@GetMapping("/get")
//	public void get(@RequestParam("bno") Long bno, Model model) {
//		log.info("/get");
//		model.addAttribute("board", service.get(bno));
//	}
//	
//	//수정
//	@PostMapping("/modify")
//	public String modify(BoardVO board, RedirectAttributes rttr) {
//		log.info("#################modify" + board);
//		
//		if(service.modify(board)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		return "redirect:/board/list";  //목록(list)으로 보냄
//	}
	
	//조회랑 수정 묶어버리기~ @GetMapping이나 @PostMapping 등에는 URL을 배열로 처리할 수 있으므로, 하나의 메서드로 여러 URL 처리
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, Model model) {
		log.info("/get or modify");
		model.addAttribute("board", service.get(bno));
	}
```

### modify.jsp

> views 폴더 - board 폴더 - get.jsp 복사해서 modify.jsp 생성

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>

	<div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">Board Read</h1>
	    </div>
	    <!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	
	
	<div class="row">
	    <div class="col-lg-12">
	        <div class="panel panel-default">
	            <div class="panel-heading">
	                Board Read Page
	            </div>
	            <!-- /.panel-heading -->
	            <div class="panel-body">
	            
		            <form role="form" action="/board/modify" method="post">
		            
		            	<div class="form-group">
		                    <label>Bno</label>
		                    <input class="form-control" name="bno" value='<c:out value="${board.bno }" />' readonly="readonly">
		                </div>
		                
		            	<div class="form-group">
		                    <label>title</label>
		                    <input class="form-control" name="title" value='<c:out value="${board.title }" />'>
		                </div>
		                
		                <div class="form-group">
		                    <label>Text area</label>
		                    <textarea class="form-control" rows="3" name="content"><c:out value="${board.content }" /></textarea>
		                </div>
		                
		                <div class="form-group">
		                    <label>Writer</label>
		                    <input class="form-control" name="writer" value='<c:out value="${board.writer }" />' readonly="readonly">
		                </div>
		                
		                <div class="form-group">
		                    <label>RegDate</label>
		                    <input class="form-control" name="regDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate }" />' readonly="readonly">
		                </div>
		                
		                <div class="form-group">
		                    <label>Update Date</label>
		                    <input class="form-control" name="updateDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updateDate }" />' readonly="readonly">
		                </div>
		                
		                <button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
                        <button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
                        <button type="submit" data-oper='list' class="btn btn-info">List</button>
		                 
		             </form>
	                
	            </div>
	            <!-- /.panel-body -->
	        </div>
	        <!-- /.panel -->
	    </div>
	    <!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	    
	</div>
	<!-- /#page-wrapper -->
	
	
	
	
	
<!-- 버튼에 따라서 동작하는 쿼리 -->
<script type="text/javascript">
	$(document).ready(function(){
		
		var formObj = $("form");
		
		$('button').on("click", function(e){
			e.preventDefault();  //submit 기본 동작 막기
			
			//data-oper로 submit 직접 수행
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation === 'remove'){
				formObj.attr("action", "/board/remove");
			}else if(operation ==='list'){	
				
				//move to list
				//self.location = "/board/list";
				//return;
				
				formObj.attr("action", "/board/list").attr("method", "get");
				formObj.empty();
			}
			
			formObj.submit();  //modify일 때 그냥 submit
			
		});		
	});
</script>

	
	
	

<%@include file="../includes/footer.jsp" %>


```
