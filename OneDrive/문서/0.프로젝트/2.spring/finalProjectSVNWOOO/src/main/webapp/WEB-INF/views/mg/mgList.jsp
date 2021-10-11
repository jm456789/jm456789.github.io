<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.zerock.domain.AuthVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.chat_start {
   background-color: #4ea3e0;
   color: #fff;
}
</style>
<%@include file="../includes/header.jsp"%>


<!--title 1-->
<h2 class="tit1">인사관리</h2>
<!--title 1-->


<!--title 2-->
<h3 class="tit2">검색영역</h3>
<!--title 2-->

<!-- search_box -->
<div class="search_box mb30">
	<div class="search_inner">
			<form id ='searchForm' method="get" action="/mg/mgList">
				<select name='type'>
					<option value=""<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>구분</option>
					<option value="I"<c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>사원 번호</option>
					<option value="N"<c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>이름</option>
					<option value="D"<c:out value="${pageMaker.cri.type eq 'D'?'selected':''}"/>>부서</option>
					<option value="P"<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>직급</option>
				</select> 
				<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
				<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
				<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />

					<button class="btn_search">
						<span class="icon_search">조회</span>
						</button>

			</form>
		</div>
	</div>


<!-- search_box -->
<!-- search_box -->


<!-- list_table -->
<div class="list_table_wrap">
   <div class="mb30 list_table">
   
<%--  <form method="post" action="/mg/mgMessage?e_id=${mg.e_id}" id="messageSendForm"> --%>
      <table>
         <thead>
            <tr>
               <th>사원번호</th>
               <th>부서</th>
               <th>이름</th>
               <th>직급</th>
               <th>사내번호</th>
               <th>메일</th>
               <th>메신저</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach items="${mgList}" var="mg">
               <tr>
                  <td><a class='move' href='<c:out value="${mg.e_id}"/>'>
                        <c:out value="${mg.e_id}" />
                  </a></td>
                  <td><a class='move'href='<c:out value="${mg.e_id}"/>'>
                        <c:out value="${mg.e_did}" />
                  </a></td>
                  <td><a class='move' href='<c:out value="${mg.e_id}"/>'>
                        <c:out value="${mg.e_name}" />
                  </a></td>
                  <td><a class='move' href='<c:out value="${mg.e_id}"/>'>
                        <c:out value="${mg.e_pid}" />
                  </a></td>
                  <td><a class='move' href='<c:out value="${mg.e_id}"/>'>
                        <c:out value="${mg.e_tell}" />-<c:out value="${mg.e_tell2}" />-<c:out value="${mg.e_tell3}" />
                  </a></td>
                  <td><a class='move' href='<c:out value="${mg.e_id}"/>'>
                        <c:out value="${mg.e_email}" />
                  </a></td>
                  <td data-cell-header="메신저">
                     <button type="submit" class="chat_start" onclick="location.href='/message/messageRegister?e_name=<c:out value="${mg.e_name }"/>'">쪽지 보내기</button>
					<input type='hidden' name='e_name' value='${mg.e_name}'>
                  </td>
               </tr>
            </c:forEach>
            
         </tbody>
      </table>
   </form>
      
      
      
      
      <!-- paging -->
      <!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal"
                     aria-hidden="true">&times;</button>
                  <h4 class="modal-title" id="myModalLabel">Modal title</h4>
               </div>
               <div class="modal-body">처리가 완료되었습니다.</div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary">Save
                     changes</button>
               </div>
            </div>
            <!-- /.modal-content -->
         </div>
         <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
   </div>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
   		<div class="brd_btn_control right mt30">
   			<button id="writeE_id" class="btn_sz_md btn_bg1" type=button>사원 등록</button>
   		</div>
   </sec:authorize>

</div>

<!-- paging
<div class="paging_wrap mb30">
   <p class="paging_box">
      <a href="#" class="page_prev">이전</a> <span>1</span> <a href="#">2</a>
      <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
      <a href="#">7</a> <a href="#">8</a> <a href="#">9</a> <a href="#">10</a>
      <a href="#" class="page_next">다음</a>
   </p>
</div>-->
<div class="paging_wrap mb30">
	<ul class="paging_box">

		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous"><a
				href="${pageMaker.startPage -1}">Previous</a></li>
		</c:if>

		<c:forEach var="num" begin="${pageMaker.startPage}"
			end="${pageMaker.endPage}">
			<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
				<a href="${num}">${num}</a>
			</li>
		</c:forEach>

		<c:if test="${pageMaker.next}">
			<li class="paginate_button next"><a
				href="${pageMaker.endPage +1 }">다음</a></li>
		</c:if>
	</ul>
</div>
<form id='actionForm' action="/mg/mgList" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
	<input type='hidden' name='keyword'value='<c:out value="${ pageMaker.cri.keyword }"/>'>
	
</form>

<%-- <form id='Form' action="/message/messageRegister" method='get'>
	<input type='hidden' name='e_id' value='${mg.e_id}'>
</form>  --%>

<script>
   $(document).ready(function()
         {
      var result=a;
         })
</script>

<script type="text/javascript">
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
            $(".modal-body").html("사원번호" + parseInt(result) + " 번이 등록되었습니다.");  
            //새로운 게시글이 작성되는 경우 Redirect Attributes로 게시물의 번호가 전송되므로, 이를 이용해서 모달 내용 수정
         }
            $("#myModal").modal("show");
         }
         $("#writeE_id").on("click", function() {
            self.location="/mg/mgRegister"
         });
         var actionForm = $("#actionForm");
     	
			$(".paginate_button a").on(
					"click",
					function(e) {

						e.preventDefault();

						console.log('click');

						actionForm.find("input[name='pageNum']").val(
								$(this).attr("href"));
						actionForm.submit();
					});
			 // pageNum, amount 파라미터 추가 전달
			$(".move").on("click",function(e) {

			e.preventDefault();
			actionForm.append("<input type='hidden' name='e_id' value='" + $(this).attr("href")+ "'>");
			actionForm.attr("action","/mg/mgGet");
			actionForm.submit();

			});
/* 			 var actionForm = $("#Form");
		     	
				$(".chat_start").on(
						"click",
						function(e) {

							e.preventDefault();

							console.log('click');

							Form.submit();
						});
				 // pageNum, amount 파라미터 추가 전달 */	 
			 
      });
</script>

<script>
   $(document).ready(function()
         {
    var searchForm=$("#searchForm");
    
    $(".icon_search").on("click", function(e){
    	if(!searchForm.find("option:selected").val()){
    		alert("검색 종류를 선택하세요.");
    		return false;
    	}
    	if(!searchForm.find("input[name='keyword']").val()){
    		alert("키워드를 입력하세요.");
    		return false;
    	}
    	if(!searchForm.find("input[name='keyword']").val()){
    		alert("키워드를 입력하세요.");
    		return false;
    	}
    	searchForm.find("input[name='pageNum']").val("1");
    	e.preventDefault();
    	
    	serchForm.submit();
    	});
         })
</script>

<script language="javascript">  
function openWin(){  
    window.open("../chat?e_name=${mg.e_name}", "채팅", "width=600, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
}  
</script>  


<%@include file="../includes/footer.jsp"%>



