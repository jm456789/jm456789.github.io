<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->    
	<title>마이 페이지</title>
	<link rel="stylesheet" type="text/css" href="css/import.css" />
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.js"></script>
	<script type="text/javascript" src="js/common.js"></script>    
    
</head>
<body>
	<div id="wrap">
        

        
        <!-- contents -->
      <form role="form" action="/member/mypage" method="post">
            
            <!-- cont_wrap -->
            <div class="cont_wrap">

                <!--title 1-->
                <h2 class="tit1">내 정보 수정</h2>
                <!--title 1-->


                <!-- input_table 1단 -->
                <div class="input_table mb30">
                    <table>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:auto;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th colspan="2">이름</th>
                                <td><input type="text" readonly="readonly" value="홍길동"></td>
                            </tr>   
                            <tr>
                                <th colspan="2">사원 번호</th>
                                <td><input type="text" readonly="readonly" value="210909001"></td>
                            </tr>   
                            <tr>
                                <th rowspan="3">비밀번호 변경</th>
                                <th>기존 비밀번호</th>
                                <td><input type="password"></td>
                            </tr>   
                            <tr>
                                <th>새로운 비밀번호</th>
                                <td><input type="password"></td>
                            </tr>  
                            <tr>
                                <th>새로운 비밀번호 재확인</th>
                                <td>
                                    <input type="password">
                                    <button type="button" class="btn_sz_sm btn_ln1">확인</button>
                                </td>
                            </tr>  
                            <tr>
                                <th colspan="2">주소</th>
                                <td>
                                    <input type="text" readonly="readonly"><button type="button" class="btn_sz_sm btn_ln1">주소검색</button> <br />
                                    <div class="area_w7_3 mt7">
                                        <input type="text" readonly="readonly">
                                        <input type="text">
                                    </div>
                                </td>
                            </tr>   
                            <tr>
                                <th colspan="2">개인번호</th>
                                <td><input type="text"> - <input type="text"> - <input type="text"></td>
                            </tr>   
                            <tr>
                                <th colspan="2">사내 번호</th>
                                <td><input type="text"> - <input type="text"> - <input type="text"></td>
                            </tr>  
                            <tr>
                                <th colspan="2">직급</th>
                                <td><input type="text" readonly="readonly" value="대리" ></td>
                            </tr>   
                            <tr>
                                <th colspan="2">부서</th>
                                <td><input type="text" readonly="readonly" value="개발팀" ></td>
                            </tr> 

                         
                        </tbody>
                    </table>
                </div>
                <!-- input_table 1단 -->


                <!-- 버튼영역 -->
                <div class="brd_btn_control right">                    
                    <button type="submit" data-oper='modify' class="btn_sz_md btn_bg1">수정하기</button>
                    <!-- <button type="submit" data-oper='modify' class="btn btn-default">Modify</button> -->
                    
                </div>    
                <!-- //버튼영역 -->
                
    
                  

              
                
            </div>
            <!-- cont_wrap -->
            
            <!-- footer -->
            <div class="footer">               
               <p>copyright(c) 2020 KFIA&amp;coupang rights reserved.</p>
            </div>
            <!-- footer -->
            </form>
        </div>
        <!-- contents -->
        
	
</body>
</html>
