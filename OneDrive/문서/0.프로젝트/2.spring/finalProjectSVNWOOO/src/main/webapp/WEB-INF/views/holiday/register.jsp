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

<form action="/holiday/register" method="post">

    
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
                    	<!-- <input type="text" name="h_eid1" id="h_eid1" /> -->
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
                            <input type="text" class="icon_date datepicker" title="시작일" name="h_start" autocomplete=off />
                        </span>
                    </td>
                    <th>종료일자</th>
                    <td>
                        <span class="search_col2">
                            <input type="text" class="icon_date datepicker" title="종료일" name="h_end" autocomplete=off />
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
                    <input type="text" class="w100" name="h_title" placeholder="제목을 입력해 주세요." maxlength="200" />
                </div>
            </div>
            <!-- //상세보기 상단 -->
            <!-- 상세내용 -->
            <div class="board_cont board_img_view_cont ck_register">
                <textarea class="w100" name="h_reason" id="editorContents"></textarea>
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
        <button type="submit" id="btn_reg" class="btn_sz_md btn_bg1">신청</button>
        <input type="hidden" name="from" value="01055649947"/>
	<input type="hidden" name="text" value="[알림] 전자결재  알림">
        <a href='/holiday/list?e_id=<sec:authentication property="principal.member.e_name"/>' class="btn_sz_md btn_bg3">목록</a>
    </div>    
    <!-- //버튼영역 -->
    
    <input type="hidden" name="h_sledding" value="신청" />
    <input type="hidden" name="h_sledding2" value="대기" />
    <input type="hidden" name="h_eid2" value="<sec:authentication property='principal.member.e_name'/>" /> <!-- 신청자 이름 -->
    <%-- <input type="hidden" name="e_id" value="<sec:authentication property='principal.member.e_id'/>" /> --%>
    <input type="hidden" name="h_did" value="<sec:authentication property='principal.member.e_did'/>" /> <!-- 신청자 부서 -->

</form>







<script type="text/javascript">
	$(document).ready(function(){
		
		//datepicker 오늘날짜 자동입력 기본 셋팅
		$(".datepicker").datepicker({
		}).datepicker("setDate", new Date());
		
	});
</script>



<!-- Modal null 검사
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">결재자 입력 오류</h4>
            </div>
            <div class="modal-body">
               	결재자를 입력 해 주세요.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn_sz_sm btn_ln1" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
//modal -->

<!-- 
<script type="text/javascript">
	$(document).ready(function(){
		
		//null 검사
		$("#btn_reg").on("click", function(e){
			e.preventDefault();
			
			var h_eid1 = document.getElementById("h_eid1").value;			
			if(h_eid1 == '' || h_eid1 == null){
				$("#myModal").modal("show");	
				return;
			}
			
			var formObj = $("form");
			formObj.submit();
		});
		
	});
</script>

 -->



<%@include file="../includes/footer.jsp" %>

