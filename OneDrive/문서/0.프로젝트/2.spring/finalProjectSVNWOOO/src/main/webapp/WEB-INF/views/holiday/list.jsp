<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<%@include file="../includes/header.jsp" %>






<!--title 1-->
                <h2 class="tit1">업무 승인 리스트</h2>
                <!--title 1-->



                <!-- search_box -->            
                <form method="post" action="/holiday/list">
                   <div class="search_box mb30">
                       <div class="search_inner">
                           <select name="holidaySelect">
                               <option>구분 선택</option>
                               <option value="hHuman">결재자</option>
                               <option value="hWork">구분</option>
                               <option value="hIng">진행상태</option>
                           </select>
                           <input type="text" name="keyword" value="${map.keyword}" />
                           <button type="submit" class="btn_search"><span class="icon_search">조회</span></button>
                         
                         <%-- <input type="hidden" name="e_id" value='<c:out value="${list[0].h_eid1 }" />' /> --%>
                         <input type="hidden" name="e_id" value='<sec:authentication property="principal.member.e_name"/>' />
                         
                       </div>
                   </div>
                </form>
                <!-- search_box -->
                

                <!-- list_table -->
                <div class="list_table_wrap">
                    <div class="mb30 list_table">
                        <table>
                            <colgroup>
                                <col style="width:5%" />
                                <col style="width:15%" />
                                <col style="width:15%" />
                                <col style="width:15%" />
                                <col style="width:auto" />
                                <col style="width:10%" />
                                <col style="width:10%" />
                                <col style="width:10%" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>순번</th>
                                    <th>신청일자</th>
                                    <th>시작일자</th>
                                    <th>종료일자</th>
                                    <th>사유</th>
                                    <th>결재자</th>
                                    <th>구분</th>
                                    <th>진행상태</th>
                                </tr>                        
                            </thead>
                            <tbody>
                               <c:forEach items="${list}" var="board">
                                  <tr>
                                     <td data-cell-header="순번">
                                        <c:out value="${board.h_id }" />
                                     </td>
                                       <td data-cell-header="신청일자">
                                          <fmt:formatDate pattern="yyyy-MM-dd" value="${board.h_date }" />
                                       </td>
                                       <td data-cell-header="시작일자">
                                          <fmt:formatDate pattern="yyyy-MM-dd" value="${board.h_start }" />
                                       </td>
                                       <td data-cell-header="종료일자">
                                          <fmt:formatDate pattern="yyyy-MM-dd" value="${board.h_end }" />
                                       </td>
                                       <td data-cell-header="사유">
                                          <a href="/holiday/get?h_id=<c:out value="${board.h_id }" />" class="txt_ellipsis">
                                             <c:out value="${board.h_title }" />
                                          </a>
                                       </td>
                                       <td data-cell-header="결재자">
                                          <c:out value="${board.h_eid1 }" />
                                       </td>
                                       <td data-cell-header="구분">
                                          <c:out value="${board.h_division }" />
                                       </td>
                                       <td data-cell-header="상태">
                                          <%-- <c:if test="${board.h_sledding eq '신청' }">
                                             <span class="status_cr1"><c:out value="${board.h_sledding }" /></span>
                                          </c:if> --%>
                                          <c:choose>
                                             <c:when test="${board.h_sledding eq '신청' }">
                                                <span class="status_cr2"><c:out value="${board.h_sledding }" /></span>
                                             </c:when>
                                             <c:when test="${board.h_sledding eq '승인' }">
                                                <span class="status_cr3"><c:out value="${board.h_sledding }" /></span>
                                             </c:when>
                                             <c:when test="${board.h_sledding eq '반려' }">
                                                <span class="status_cr1"><c:out value="${board.h_sledding }" /></span>
                                             </c:when>
                                          </c:choose>
                                       </td>
                                  </tr>
                               </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>    
                <!-- list_table -->

            
            
            

                <!-- 버튼영역 -->
                <div class="brd_btn_control right mt30">
                    <button type="button" id="regBtn" class="btn_sz_md btn_bg1">업무 등록</button>         
                </div>    
                <!-- //버튼영역 -->
                
                <!-- paging
                <div class="paging_wrap mb30">
                    <p class="paging_box">
                        <a href="#" class="page_prev">이전</a>
                        <span>1</span>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#">6</a>
                        <a href="#">7</a>
                        <a href="#">8</a>
                        <a href="#">9</a>
                        <a href="#">10</a>
                        <a href="#" class="page_next">다음</a>
                    </p>
                </div>
                paging -->







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
                <button type="button" class="btn btn-default btn_sz_sm btn_ln1" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- modal -->

<!-- 모달창 보여주는 쿼리 -->
<script type="text/javascript">
   $(document).ready(function(){
      
      //list에서 Register New Board버튼 클릭(register.jsp로 페이지 이동) 할 때 작동
      $("#regBtn").on("click", function(){
          self.location = "/holiday/register";
      });

      
      var result = '<c:out value="${result}" />';
      
      checkModal(result);
      
      history.replaceState({}, null, null);  //뒤로가기 문제때문에 스택 구조상 history객체 조작
      
      function checkModal(result){
         if(result === '' || history.state){  //뒤로가기 문제때문에 스택 구조상 history객체 조작 =>  || history.state 추가
            return;
         }
         
         if(parseInt(result) > 0){
            //$(".modal-body").html("연차 및 출장 " + parseInt(result) + " 번이 등록되었습니다.");  
            $(".modal-body").html("처리가 완료되었습니다.");  
            //새로운 게시글이 작성되는 경우 Redirect Attributes로 게시물의 번호가 전송되므로, 이를 이용해서 모달 내용 수정
         }
         
         $("#myModal").modal("show");
      }
      
   });
   
   
</script>








<%@include file="../includes/footer.jsp" %>







