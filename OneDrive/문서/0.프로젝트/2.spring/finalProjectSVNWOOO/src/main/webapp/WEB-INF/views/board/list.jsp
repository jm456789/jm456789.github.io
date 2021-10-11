<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.zerock.domain.AuthVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>



<%@include file="../includes/header.jsp" %>



            <!--title 1-->
            <h2 class="tit1">공지사항</h2>
            <!--title 1-->
            
            
            <ul class="board_img_list board_img_list2">
            	<c:forEach items="${list}" var="board">
					<li>
						<a class="move" href='<c:out value="${board.bno }" />'>
							<div class="txt_group">
								<span class="board_state point_bg21"><c:out value="${board.bno }" /></span>
								
								<p class="tit"><c:out value="${board.title }" /></p> 
								<div class="list">
									<span> <fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }" /></span>
									<%-- <span><c:out value="${board.writer }" /></span> --%>
								</div>
							</div>
						</a>
					</li>	
				</c:forEach>
			</ul>
            
            
            <!-- 버튼영역 -->
            <div class="brd_btn_control right mt30">
            <sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')">
                <button id="regBtn" type="button" class="btn_sz_md btn_bg1">글쓰기</button>
                </sec:authorize>         
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
            
            <!-- paging -->
            <div class="paging_wrap mb30">
                <ul class="paging_box">
                
                	<c:if test="${pageMaker.prev }">
                	<li class="paginate_button previous">
			        	<a href="${pageMaker.startPage-1 }" class="page_prev">이전</a>
			        </li>
			        </c:if>			        
                    
                    <c:forEach var="num" begin="${pageMaker.startPage }"
			        end="${pageMaker.endPage }">
			        <li class="paginate_button ${pageMaker.cri.pageNum==num ? "active":"" } ">
			            <a href="${num }">${num }</a>
			        </li>
			        </c:forEach>
                    
                    <c:if test="${pageMaker.next }">
                    <li class="paginate_button next">
			        	<a href="${pageMaker.endPage+1 }" class="page_next">Next</a>
			        </li>
			        </c:if>
                    
                </ul>
            </div>
            <!-- paging -->
            
            
            
            <%-- <div class='pull-right'>
			    <ul class="pagination">
			        <c:if test="${pageMaker.prev }">
			        <li class="paginate_button previous"><a
			            href="${pageMaker.startPage-1 }">Previous</a></li>
			        </c:if>
			 
			        <c:forEach var="num" begin="${pageMaker.startPage }"
			        end="${pageMaker.endPage }">
			        <li class="paginate_button ${pageMaker.cri.pageNum==num ? "active":"" } ">
			            <a href="${num }">${num }</a>
			        </li>
			        </c:forEach>
			 
			        <c:if test="${pageMaker.next }">
			        <li class="paginate_button next"><a
			            href="${pageMaker.endPage+1 }">Next</a></li>
			        </c:if>
			    </ul>
			</div> --%>
			
			
			<form id='actionForm' action="/board/list" method='get'>
			       <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
			       <input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
			</form>
                
                


<!-- Modal
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
    </div>
</div>
modal -->




<!-- Modal -->
<div class="layer_popup modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="layer_wrap modal-dialog">
        <div class="modal-content">
            <div class="popup_title modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">처리 완료</h4>
            </div>
            <div class="layer_cont center modal-body">
               	처리가 완료되었습니다.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn_sz_sm btn_ln1" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary btn_sz_sm btn_bg1">Save changes</button>
            </div>
        </div>
    </div>
</div>
<!-- modal -->




<!-- popup
<div class="layer_popup layer_test modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="layer_wrap">
        <div class="layer_inner">
            <div class="popup_title">
                <h1>처리 완료</h1>
                <p class="btn_layer_close"><a href="#" class="layer_close">닫기</a></p>
            </div>
            <div class="layer_cont center">                        
                <p class="layer_p">처리가 완료되었습니다.</p>
            </div>
        </div>
    </div>
</div>
popup -->




<!-- 모달창 보여주는 쿼리 -->
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
				$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");  
				//새로운 게시글이 작성되는 경우 Redirect Attributes로 게시물의 번호가 전송되므로, 이를 이용해서 모달 내용 수정
			}
			
			$("#myModal").modal("show");
		}
		
		//list에서 Register New Board버튼 클릭(register.jsp로 페이지 이동) 할 때 작동
		$("#regBtn").on("click", function(){
			self.location = "/board/register";
		});
		
		
		//!페이징처리
		var actionForm = $("#actionForm");        
        $(".paginate_button a").on("click", function(e) {
            e.preventDefault();
            console.log('click');
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.submit();
        });
        $(".move").on("click", function(e) {
            e.preventDefault();
            actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
            actionForm.attr("action", "/board/get");
            actionForm.submit();
        });
		
	});
</script>


<%@include file="../includes/footer.jsp" %>


