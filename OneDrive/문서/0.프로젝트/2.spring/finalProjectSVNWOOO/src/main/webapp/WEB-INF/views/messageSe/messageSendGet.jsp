<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page import="org.zerock.domain.AuthVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<!--title 1-->
<h2 class="tit1">보낸 쪽지</h2>
<!--title 1-->


<form role="form" method="post" id="formDelete">
	<!-- 상세보기 -->
	<div class="board_warp">
		<section class="board_view">
			<!-- 상세보기 상단 -->
			<div class="board_header">
				<div class="board_title">
					<div class="board_subject">
						<span class="brd_notice"><c:out value="${message.m_id}" /></span>
						<h1>
							<c:out value="${message.m_title }" />
						</h1>
						<p>
							<span><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${message.m_time }" /></span> <span><c:out
									value="${message.m_eid2}" /></span>

						</p>
					</div>
				</div>
			</div>
			<!-- //상세보기 상단 -->

			<!-- 상세내용 -->
			<div class="board_cont board_img_view_cont ck_view">
				<textarea class="w100" name="content" id="editorContents"><c:out
						value="${message.m_content }" /></textarea>
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
				<!-- //상세내용 -->
			</div>

		</section>
	</div>
	<!-- //상세보기 -->


	<!-- 버튼영역 data-oper='messageList' -->
	<div class="brd_btn_control right mt30">
		<button type="button" data-oper='messageRemove'
			class="btn_sz_md btn_bg2">삭제</button>
		<button type="button" class="btn_sz_md btn_bg3"
			onclick="location.href='messageSendList?m_eid2=<c:out value="${message.m_eid2}" />'">목록</button>
	</div>
	<!-- //버튼영역 -->

	<!-- 삭제할 때 필요 -->
	<input type='hidden' name='m_id'
		value='<c:out value="${message.m_id}"/>'>
	<input type='hidden' name='m_eid2' value="<sec:authentication property='principal.member.e_name'/>" />
</form>


<form id='operForm' action="/mg/mgRegister" method="get">
	<input type='hidden' id='m_id' name='m_id'
		value='<c:out value="${message.m_id}"/>'> <input type='hidden'
		name='pageNum' value='<c:out value="${cri.pageNum}"/>'> <input
		type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
</form>

<!-- 버튼에 따라서 동작하는 쿼리 -->
<script type="text/javascript">
	$(document).ready(function(){
		
		//삭제
		$("button[data-oper='messageRemove']").on("click", function(e){
			var formObj = $("#formDelete");
			
			e.preventDefault();  //submit 기본 동작 막기
			
			formObj.attr("action", "/messageSe/messageSeRemove");
			formObj.submit();
			
		});	
		
		var operForm = $("#operForm");
		
		$("button[data-oper='messageRegister']").on("click", function(e){			
			operForm.attr("action", "/message/messageRegister").submit();			
		});
		
		$("button[data-oper='messageList']").on("click", function(e){			
			operForm.find("#m_id").remove();			
			operForm.attr("action", "/message/messageList");			
			operForm.submit();			
		});
		
		
	});
</script>




<%@include file="../includes/footer.jsp"%>

