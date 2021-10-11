<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>


	<!--title 1-->
                <h2 class="tit1">업무 승인</h2>
                <!--title 1-->


				<form role="form" method="post" id="formDelete">

	                <!-- input_table 2단 -->
	                <div class="input_table mb30">
	                    <table>
	                        <colgroup>
	                            <col style="width:12%;">
	                            <col style="width:38%;">
	                            <col style="width:12%;">
	                            <col style="width:auto;">
	                        </colgroup>
	                        <tbody>
	                            <tr>
	                                <th>결재자</th>
	                                <td>
	                                	<c:out value="${board.h_did }" />
	                                	<c:out value="${board.h_eid1 }" />
	                                </td>
	                                <th>상태</th>
	                                <td>
	                                    <c:choose>
                                    		<c:when test="${board.h_sledding eq '신청' }">
                                    			<span class="status_cr4"><c:out value="${board.h_sledding }" /></span>
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
	                            <tr>
	                                <th>시작일자</th>
	                                <td>
	                                	<fmt:formatDate pattern="yyyy-MM-dd" value="${board.h_start }" />
	                                </td>
	                                <th>종료일자</th>
	                                <td>
	                                	<fmt:formatDate pattern="yyyy-MM-dd" value="${board.h_end }" />
	                                </td>
	                            </tr>
	                            
	                        </tbody>
	                    </table>
	                </div>
	                <!-- input_table 2단 -->
	                
	                <!-- 상세보기 -->
				    <div class="board_warp">
				        <section class="board_view">
				            <!-- 상세보기 상단 -->
				            <div class="board_header">
				                <div class="board_title">                                
				                    <div class="board_subject">
				                        <span class="brd_notice">
				                        	<!-- 구분 -->
				                        	<c:out value="${board.h_division }" />
				                        </span>
				                        <h1>
				                        	<c:out value="${board.h_title }" />
				                        </h1>
				                        <p>
				                        	<span>
				                        		<!-- 신청일자 -->
				                        		<fmt:formatDate pattern="yyyy-MM-dd" value="${board.h_date }" />
				                        	</span> 
				                        	<%-- <span><c:out value="${board.writer }" /></span>  --%>
				                        </p>
				                    </div>
				                </div>
				            </div>
				            <!-- //상세보기 상단 -->
				            
				            <!-- 상세내용 -->
				            <div class="board_cont board_img_view_cont ck_view">
				               <textarea class="w100" name="content" id="editorContents"><c:out value="${board.h_reason }" /></textarea>
				                <script>
						         ClassicEditor
							         .create( document.querySelector( '#editorContents' ),{
							        	 toolbar: []
							         } )
							         .then( editor => {
								        editor.ui.view.editable.element.style.height = '200px';
								        editor.isReadOnly = true;
								    } )
							         .catch( error => {
							             console.error( error );
							         } );
						        </script>
				            </div>
				            <!-- //상세내용 -->
				            
									
				        </section>
				    </div>
				    <!-- //상세보기 -->
	
	
	                <!-- 버튼영역 -->
	                <c:choose>
                   		<c:when test="${board.h_sledding eq '승인' || board.h_sledding eq '반려'}">
	                		<div class="brd_btn_control right mt30">
                       			<a href='/holiday/list?e_id=<sec:authentication property="principal.member.e_name"/>' class="btn_sz_md btn_bg3">목록</a>
                       		</div>    
                       	</c:when>
                  		<c:otherwise>
                  			<div class="brd_btn_control right mt30">   
	                  			<button data-oper='remove' type="button" class="btn_sz_md btn_bg2">삭제</button>
	                  			<button data-oper='modify' type="button" class="btn_sz_md btn_bg1">수정</button>
	                  			<a href='/holiday/list?e_id=<sec:authentication property="principal.member.e_name"/>' class="btn_sz_md btn_bg3">목록</a>
                  			</div>    
                  		</c:otherwise>
                    </c:choose>
	                <!-- //버튼영역 -->
	                
	                <!-- 삭제할 때 필요 -->
	                <input type='hidden' id='h_id' name='h_id' value='<c:out value="${board.h_id }"/>' >  
	                <input type="hidden" name="h_eid2" value="<sec:authentication property='principal.member.e_name'/>" /> <!-- 신청자 이름 -->
                
                </form>
                
                <!-- 수정버튼 -->
                <form id='formModify' action="/holiday/modify" method="get">
					<input type='hidden' id='h_id' name='h_id' value='<c:out value="${board.h_id }"/>' >
				</form>
	
	
	
	
<!-- 버튼에 따라서 동작하는 쿼리 -->
<script type="text/javascript">
	$(document).ready(function(){
		
		//삭제
		$("button[data-oper='remove']").on("click", function(e){
			var formObj = $("#formDelete");
			
			e.preventDefault();  //submit 기본 동작 막기
			
			formObj.attr("action", "/holiday/remove");
			formObj.submit();
			
		});	
		
		//수정
		$("button[data-oper='modify']").on("click", function(e){	
			var formObj = $("#formModify");
			
			e.preventDefault();  //submit 기본 동작 막기
			
			formObj.submit();			
		});
		
	});
</script>
	
	
	
	
	

<%@include file="../includes/footer.jsp" %>

