<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>


<!--title 1-->
<h2 class="tit1">업무 승인 결재</h2>
<!--title 1-->


				

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
                <th>신청자</th>
                <td>	          
                	<c:out value="${holiday.h_did }" />                      	
                	<c:out value="${holiday.h_eid2 }" />
                </td>
                <th>상태</th>
                <td>
                    <c:choose>
                   		<c:when test="${holiday.h_sledding2 eq '반려' }">
                   			<span class="status_cr4"><c:out value="${holiday.h_sledding2 }" /></span>
                   		</c:when>
                   		<c:when test="${holiday.h_sledding2 eq '승인' }">
                   			<span class="status_cr4"><c:out value="${holiday.h_sledding2 }" /></span>
                   		</c:when>
                   		<c:when test="${holiday.h_sledding2 eq '대기' }">
                   			<span class="status_cr3"><c:out value="${holiday.h_sledding2 }" /></span> 
                   		</c:when>
                   	</c:choose>
                </td>
            </tr>
            <tr>
                <th>시작일자</th>
                <td>
                	<fmt:formatDate pattern="yyyy-MM-dd" value="${holiday.h_date }" />
                </td>
                <th>종료일자</th>
                <td>
                	<fmt:formatDate pattern="yyyy-MM-dd" value="${holiday.h_date }" />
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
		            	<c:out value="${holiday.h_division }" />
		            </span>
		            <h1>
		            	<c:out value="${holiday.h_title }" />
		            </h1>
		            <p>
		            	<span>
		            		<!-- 신청일자 -->
		            		<fmt:formatDate pattern="yyyy-MM-dd" value="${holiday.h_date }" />
		            	</span> 
		            </p>
		        </div>
		    </div>
		</div>
		<!-- //상세보기 상단 -->

		<!-- 상세내용 -->
		<div class="board_cont board_img_view_cont ck_view">
		   <textarea class="w100" name="content" id="editorContents"><c:out value="${holiday.h_reason }" /></textarea>
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
	<c:when test="${holiday.h_sledding2 eq '승인' || holiday.h_sledding2 eq '반려'}"> 
		<div class="brd_btn_control right mt30">
			<a href="/holidayOK/list?e_id=<sec:authentication property='principal.member.e_name'/>" class="btn_sz_md btn_bg3">목록</a>
		</div>
	</c:when>
	<c:otherwise>
		<div class="brd_btn_control right mt30">                    
			<button data-oper='holOK' type="button" class="btn_sz_md btn_bg1">승인</button>
			<button data-oper='holReject' type="button" class="btn_sz_md btn_bg2">반려</button>
			<a href="/holidayOK/list?e_id=<sec:authentication property='principal.member.e_name'/>" class="btn_sz_md btn_bg3">목록</a>
		</div>
	</c:otherwise>
</c:choose>
<!-- //버튼영역 -->		
	 
	 
<form role="form" method="post" id="holOK">
	<input type="hidden" name="h_sledding2" value="승인" /> <!-- 결재자 승인 -->
	<input type="hidden" name="h_sledding" value="승인" /> <!-- 신청자에게 승인 표출 -->
	<input type="hidden" name="from" value="01055649947"/>
	<input type="hidden" name="text" value="[알림] 전자결재  알림">
	<input type="hidden" name="h_id" value="<c:out value='${holiday.h_id }' />" /> <!-- updateOK시 필요 -->
	<input type="hidden" name="e_id" value="<c:out value='${holiday.h_eid1 }' />" />
</form>

<form role="form" method="post" id="holRej">
	<input type="hidden" name="h_sledding2" value="반려" /> <!-- 결재자 승인 -->
	<input type="hidden" name="h_sledding" value="반려" /> <!-- 신청자에게 승인 표출 -->
	<input type="hidden" name="from" value="01055649947"/>
	<input type="hidden" name="text" value="[알림] 전자결재  알림">
	<input type="hidden" name="h_id" value="<c:out value='${holiday.h_id }' />" /> <!-- updateOK시 필요 -->
	<input type="hidden" name="e_id" value="<sec:authentication property='principal.member.e_name'/>" />
</form>
                
	
	
	
	
<!-- 버튼에 따라서 동작하는 쿼리 -->
<script type="text/javascript">
	$(document).ready(function(){
		
		//승인
		$("button[data-oper='holOK']").on("click", function(e){
			var formObj = $("#holOK");
			
			e.preventDefault();  //submit 기본 동작 막기
			
			formObj.attr("action", "/holidayOK/holOK");
			formObj.submit();
		});
		
		//반려
		$("button[data-oper='holReject']").on("click", function(e){
			var formObj = $("#holRej");
			
			e.preventDefault();  //submit 기본 동작 막기
			
			formObj.attr("action", "/holidayOK/holOK");
			formObj.submit();
		});	
		
	});
</script>
	
	
	
	
	

<%@include file="../includes/footer.jsp" %>

