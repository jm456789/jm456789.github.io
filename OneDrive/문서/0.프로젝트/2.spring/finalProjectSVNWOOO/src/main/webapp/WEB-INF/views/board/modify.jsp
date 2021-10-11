<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>


<!--title 1-->
<h2 class="tit1">공지사항</h2>
<!--title 1-->


<!-- 상세보기 -->
<div class="board_warp">
    <section class="board_view board_input">
    
    	<form role="form" action="/board/modify" method="post">
    		
         <!-- 상세보기 상단 -->
         <div class="board_header">
             <div class="board_title">
                 <h1><input type="text" class="w100" name="title" value='<c:out value="${board.title }" />'></h1>
             </div>
         </div>
         <!-- //상세보기 상단 -->
         <!-- 상세내용 -->
         <div class="board_cont board_img_view_cont">
             <textarea class="w100" name="content" id="editorContents"><c:out value="${board.content }" /></textarea>
             <script type="text/javascript">
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
             <button type="submit" class="btn_sz_md btn_bg1" data-oper='modify'>수정</button>
             <button type="submit" class="btn_sz_md btn_bg3" data-oper='list'>목록</button>
         </div>    
         <!-- //버튼영역 -->
         
         
         <!-- hidden -->
         <!-- where절, bno가 있어야 한다! -->
         <input type="hidden" name="bno" value="<c:out value='${board.bno }' />" />
         <input type="hidden" name="updateDate" value="<fmt:formatDate pattern='yyyy/MM/dd' value='${board.updateDate }' />" />
         <input type="hidden" name="writer" value="<sec:authentication property='principal.member.e_name'/>" />
         <!-- 페이징처리 -->
        	<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum }' />" />
           	<input type="hidden" name="amount" value="<c:out value='${cri.amount }' />" />
                	
        </form>
        
    </section>
</div>
<!-- //상세보기 -->
                
                
	
	
	
<!-- 버튼에 따라서 동작하는 쿼리 -->
<script type="text/javascript">
	$(document).ready(function(){
		
		var formObj = $("form");		
		
		$("button[data-oper='list']").on("click", function(e){
			e.preventDefault();  //submit 기본 동작 막기
			
			formObj.attr("action", "/board/list").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();  //페이징 기능
            var amountTag = $("input[name='amount']").clone();  //페이징 기능
			formObj.empty();
			formObj.append(pageNumTag);  //페이징 기능
            formObj.append(amountTag);  //페이징 기능
			
			formObj.submit();  //modify일 때 그냥 submit
			
		});		
	});
	
	
</script>

	
	
	

<%@include file="../includes/footer.jsp" %>

