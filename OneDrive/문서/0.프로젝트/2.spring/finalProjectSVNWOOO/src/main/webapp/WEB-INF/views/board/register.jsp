<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp" %>


    <!--title 1-->
    <h2 class="tit1">공지사항</h2>
    <!--title 1-->
            
    <!-- 상세보기 -->
    <div class="board_warp">
        <section class="board_view board_input">
        
        	<form role="form" action="/board/register" method="post">
        
	            <!-- 상세보기 상단 -->
	            <div class="board_header">
	                <div class="board_title">
	                    <input type="text" class="w100" name="title" placeholder="제목을 입력해 주세요." />
	                    <!-- <p>
                        	<span><input type="text" class="" name="writer"></span> 
                        </p> --> 
	                </div>
	            </div>
	            <!-- //상세보기 상단 -->
	            <!-- 상세내용 -->
	            <div class="board_cont board_img_view_cont ck_register">
	                <!-- <textarea class="w100" name="content" placeholder="내용을 입력해 주세요."></textarea> -->
	                <textarea class="w100" name="content" id="editorContents"></textarea>
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
	                <button type="button" class="btn_sz_md btn_bg3" data-oper='list'>목록</button>
	            </div>    
	            <!-- //버튼영역 --> 
	            
	            <input type="hidden" name="writer" value="<sec:authentication property='principal.member.e_name'/>" />
            
            </form>
            
        </section>
    </div>
    <!-- //상세보기 -->
    
    
<!-- 
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board Register
                        </div>
                        /.panel-heading
                        <div class="panel-body">
	                        <form role="form" action="/board/register" method="post">
	                        	<div class="form-group">
	                                <label>title</label>
	                                <input class="form-control" name="title">
	                            </div>
	                            
	                            <div class="form-group">
	                                <label>Text area</label>
	                                <textarea class="form-control" rows="3" name="content"></textarea>
	                            </div>
	                            
	                            <div class="form-group">
	                                <label>Writer</label>
	                                <input class="form-control" name="writer">
	                            </div>
	                            
	                            <button type="submit" class="btn btn-default">Submit Button</button>
	                            <button type="reset" class="btn btn-default">Reset Button</button>
	                            
	                        </form>
                            
                        </div>

                    </div>

                </div>

            </div>

            
        </div>
 -->




<!-- 버튼에 따라서 동작하는 쿼리 -->
<script type="text/javascript">
	$(document).ready(function(){
		
		var formObj = $("form");
		
		$("button[data-oper='list']").on("click", function(e){		
			formObj.attr("action", "/board/list");			
			formObj.attr("method", "get");			
			formObj.submit();			
		});
		
	});
</script>





<%@include file="../includes/footer.jsp" %>

