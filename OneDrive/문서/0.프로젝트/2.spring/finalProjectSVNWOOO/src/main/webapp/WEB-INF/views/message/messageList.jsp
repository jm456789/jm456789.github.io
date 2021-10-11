<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page
   import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page import="org.zerock.domain.MemberVO"%>
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
<h2 class="tit1">받은 쪽지함</h2>
<!--title 1-->
<!-- <button id="writeE_id" class="btn_sz_md btn_bg1" type=button>답장하기</button> -->

<!-- list_table -->
<div class="list_table_wrap">
   <div class="mb30 list_table">
      <table class="messageRead">
         <thead>
            <tr>

               <th>번호</th>
               <th>쪽지 제목</th>
               <th>시간</th>
               <th>보낸사람</th>
               <th>수신 상태</th>

            </tr>
         </thead>
         <tbody>
            <c:forEach items="${messageList}" var="message">
               <tr>
                  <td>
                     <c:out value="${message.m_id}" />
                  </td>
                  <td>
                     <a class='move' href='<c:out value="${message.m_id}"/>'>
                        <c:out value="${message.m_title}" />
                     </a>
                     <%-- <button type="button" class='move' href='<c:out value="${message.m_id}"/>'>
                        <c:out value="${message.m_title}" />
                     </button> --%>
                  </td>
                  <td data-cell-header="신청일자">
                     <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${message.m_time}" />
                  </td>
                  <td>
                     <c:out value="${message.m_eid2}" />
                  </td>
                  <td>
                     <c:out value="${message.m_sc}" />
                  </td>
               </tr>
            </c:forEach>
         </tbody>
      </table>
      
      
      
      
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

</div>
         <div class="brd_btn_control right mt30">
            <button class="btn_sz_md btn_bg1" type=button onclick="location.href='/message/send'">쪽지 보내기</button>
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
<form id='actionForm' action="/message/messageList" method='get'>
   <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
   <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
   <input type="hidden" name="e_id" value='<sec:authentication property="principal.username"/>' />
   <input type="hidden" name="e_name" value='<sec:authentication property="principal.member.e_name"/>' />
   <input type="hidden" name="m_eid1" value='<sec:authentication property="principal.member.e_name"/>' />
</form>




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
            $(".modal-body").html(" 전송되었습니다.");  
            //새로운 게시글이 작성되는 경우 Redirect Attributes로 게시물의 번호가 전송되므로, 이를 이용해서 모달 내용 수정
         }
            $("#myModal").modal("show");
         }
         $("#writeM_eid").on("click", function() {
            self.location="/message/messageRegister"
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
            actionForm.append("<input type='hidden' name='m_id' value='" + $(this).attr("href")+ "'>");
            actionForm.append("<input type='hidden' name='m_sc' value='읽음' />"); 
            actionForm.attr("action","/message/messageGet");
            actionForm.submit();

         });
      });
</script>


<script language="javascript">  
function openWin(){  
    window.open("../chat?e_name=${mg.e_name}", "채팅", "width=600, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
}  
</script>



<%@include file="../includes/footer.jsp"%>
