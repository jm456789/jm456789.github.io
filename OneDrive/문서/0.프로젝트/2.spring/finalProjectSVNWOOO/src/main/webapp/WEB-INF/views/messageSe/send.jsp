<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<style>
.sendM {
	margin: 8px;
}
</style>

<%@include file="../includes/header.jsp"%>
<%    
    request.setCharacterEncoding("UTF-8");
    String e_name = request.getParameter("e_name");
    String e_id = request.getParameter("e_id");
%>

<!--title 1-->
<h2 class="tit1">쪽지 보내기</h2>
<!--title 1-->

<!-- 상세보기 -->
<div class="board_warp">
	<section class="board_view board_input">

		<form role="form" action="/message/messageRegister" method="post">

			<!-- 상세보기 상단 -->
			<div class="board_header">
				<div class="board_title">
					<input type="text" class="w100" name="m_title"
						placeholder="제목을 입력해 주세요." style="margin-bottom: 6px;"/>
					<p>
<!-- 							<label class="sendM">받는 사람</label><input type="text"
							name="m_eid1" value="" />  -->
							
							<label class="sendM">받는 사람</label>
							<select name='m_eid1'>
							<option value="">선택</option>
							<option value="김알로에">김알로에</option>
							<option value="최사원">최사원</option>
							<option value="최차장">최차장</option>
							<option value="고구마">고구마</option>
							<option value="홍길동">홍길동</option>
							<option value="김자두">김자두</option>
							<option value="정다혜">정다혜</option>
							<option value="최수박">최수박</option>
							<option value="이춘희">이춘희</option>
							<option value="유나">유나</option>
							<option value="바나나">바나나</option>
							<option value="보안관">보안관</option>
							<option value="간호사">간호사</option>
							<option value="복숭아">복숭아</option>
							<option value="홈런볼">홈런볼</option>
							<option value="김차장">김차장</option>
							</select>
							
							
							

							<label class="sendM">보내는 사람</label> <input type="text" class="" name="m_eid2"
							value="<sec:authentication property='principal.member.e_name'/>"
							readonly="readonly">
					</p>
				</div>
			</div>
			<!-- //상세보기 상단 -->
			<!-- 상세내용 -->
			<div class="board_cont board_img_view_cont ck_register">
				<!-- <textarea class="w100" name="content" placeholder="내용을 입력해 주세요."></textarea> -->
				<textarea class="w100" name="m_content" id="editorContents"></textarea>
				<script>
                  ClassicEditor
                     .create( document.querySelector( '#editorContents' ),{
                        
                     } )
                     .then( editor => {
                       editor.ui.view.editable.element.style.height = '200px';
                   } )
                     .catch( error => {
                         console.error( error );
                     } );
                 </script>
			</div>
			<!-- //상세내용 -->


			<!-- 버튼영역 -->
			<div class="brd_btn_control right">
				<button type="submit" class="btn_sz_md btn_bg1">등록</button>
 <!--  --><button type="button" class="btn_sz_md btn_bg3" onclick="location.href='/messageSe/messageSendList?m_eid2=<sec:authentication property='principal.member.e_name'/>'">목록</button>
			
			</div>
		</form>

	</section>
</div>





<%@include file="../includes/footer.jsp"%>
