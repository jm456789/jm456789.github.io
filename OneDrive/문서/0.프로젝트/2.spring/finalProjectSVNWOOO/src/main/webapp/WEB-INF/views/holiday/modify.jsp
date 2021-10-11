<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>




<!--title 1-->
<h2 class="tit1">업무 등록</h2>
<!--title 1-->

<!--title 2-->
<h3 class="tit2">기본 설정</h3>
<!--title 2-->

<form role="form" action="/holiday/modify" method="post">
	
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
                    <th>구분</th>
                    <td>
                    	<label for="ra_holiday">
                            <input type="radio" id="ra_holiday" name="h_division" value="업무" checked>
                            <span>업무</span>
                        </label>
                        <label for="ra_business">
                            <input type="radio" id="ra_business" name="h_division" value="출장">
                            <span>출장</span>
                        </label>
                    </td>
                    <th>결재자</th>
                    <td>
                    	<%-- <input type="text" name="h_eid1" value='<c:out value="${board.h_eid1 }" />' /> --%>
                    	<select name="h_eid1">
                    		<c:forEach items="${sList }" var="list">
                    			<option value="${list.e_name }"><c:out value="${list.e_name }" /></option>
                    		</c:forEach>                    		
                    	</select>
                    </td>
                </tr>
                <tr>
                    <th>시작일자</th>
                    <td>
                        <span class="search_col2">
                            <input type="text" class="icon_date datepicker" title="시작일" name="h_start" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.h_start }" />' autocomplete=off />
                        </span>
                    </td>
                    <th>종료일자</th>
                    <td>
                        <span class="search_col2">
                            <input type="text" class="icon_date datepicker" title="종료일" name="h_end" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.h_end }" />' autocomplete=off />
                        </span>
                    </td>
                </tr>	                
            </tbody>
        </table>
    </div>
    <!-- input_table 2단 -->
    
    <!--title 2-->
    <h3 class="tit2">상세 사유</h3>
    <!--title 2-->
       
    <!-- 상세보기 -->
    <div class="board_warp">
        <section class="board_view board_input">
        
            <!-- 상세보기 상단 -->
            <div class="board_header">
                <div class="board_title">
                    <input type="text" class="w100" name="h_title" maxlength="200" value='<c:out value="${board.h_title }" />' />
                </div>
            </div>
            <!-- //상세보기 상단 -->
            <!-- 상세내용 -->
            <div class="board_cont board_img_view_cont ck_register">
                <textarea class="w100" name="h_reason" id="editorContents"><c:out value="${board.h_reason }" /></textarea>
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
            
        </section>
    </div>
    <!-- //상세보기 -->
       
       
    <!-- 버튼영역 -->
    <div class="brd_btn_control right mt30">
        <button type="submit" class="btn_sz_md btn_bg1">수정</button>
        <a href='/holiday/list?e_id=<sec:authentication property="principal.member.e_name"/>' class="btn_sz_md btn_bg3">목록</a>
    </div>    
    <!-- //버튼영역 -->
    
    
    <input type="hidden" name="h_id" value="<c:out value='${board.h_id }' />" />
    <input type="hidden" name="h_eid2" value="<sec:authentication property='principal.member.e_name'/>" /> <!-- 신청자 이름 -->

</form>




<%@include file="../includes/footer.jsp" %>

