<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<%@include file="includes/header.jsp" %>






<!--title 1-->
                <h2 class="tit1">타이틀 1</h2>
                <!--title 1-->

                <!--title 2-->
                <h3 class="tit2">타이틀 2</h3>
                <!--title 2-->

                <!--title 2-->
                <div class="tit_btn">
                    <h3 class="tit2">타이틀 2 + 버튼</h3>
                    <div class="btn_group">
                        <a href="" class="btn_sz_sm btn_ln1">비밀번호 초기화</a>
                        <a href="" class="btn_sz_sm btn_bg1">저장</a>
                    </div>
                </div>
                <!--title 2-->

                <!--title 2-->
                <h3 class="tit2">버튼</h3>
                <!--title 2-->

                <!-- btn -->
                <div class="mb10">
                    <a href="" class="btn_sz_sm btn_ln1">추가</a>
                    <button type="button" class="btn_sz_sm btn_ln2">삭제</button>

                    <a href="" class="btn_sz_sm btn_bg1">저장</a>
                    <button type="button" class="btn_sz_sm btn_bg2">삭제</button>
                    <button type="button" class="btn_sz_sm btn_bg3">초기화</button>
                </div>

                <div class="mb30">
                    <a href="" class="btn_sz_md btn_ln1">추가</a>
                    <button type="button" class="btn_sz_md btn_ln2">삭제</button>

                    <a href="" class="btn_sz_md btn_bg1">저장</a>
                    <button type="button" class="btn_sz_md btn_bg2">삭제</button>
                    <button type="button" class="btn_sz_md btn_bg3">초기화</button>
                </div>
                <!-- btn -->

                <!--title 2-->
                <h3 class="tit2">상태</h3>
                <!--title 2-->

                <!-- state -->
                <div class="mb30">
                    <span class="status_cr1">반려</span>
                    <span class="status_cr2">승인</span>
                    <span class="status_cr3">신청</span>
                    <span class="status_cr4">보류</span>
                </div>
                <!-- state -->

                <!--title 2-->
                <h3 class="tit2">검색영역</h3>
                <!--title 2-->

                <!-- search_box -->                        
                <div class="search_box mb30">
                    <div class="search_inner">
                        <div>
                            <span class="input_tit">달력</span>
                            <span class="search_col2">
                                <input type="text" class="icon_date datepicker" title="시작일" readonly="readonly"/>
                                <input type="text" class="icon_date datepicker" title="종료일" readonly="readonly"/>
                            </span>
                        </div>
                        <div>
                            <span class="input_tit">input</span>
                            <span class="input_button"> 
                                <input type="text" />
                            </span>
                        </div>
                        <p class="search_btn">
                            <button type="button" class="btn_search"><span class="icon_search">조회</span></button>
                        </p>
                    </div>
                </div>
                <!-- search_box -->
                
                <!--title 2-->
                <h3 class="tit2">list_table</h3>
                <!--title 2-->

                <!-- list_table -->
                <div class="list_table_wrap">
                    <div class="mb30 list_table scrollY10">
                        <table>
                            <thead>
                                <tr>
                                    <th>순번</th>
                                    <th>이름</th>
                                    <th>근속연수</th>
                                    <th>연차</th>
                                </tr>                        
                            </thead>
                            <tbody>
                                <tr>
                                    <td data-cell-header="순번">1</td>
                                    <td data-cell-header="이름">홍길동</td>
                                    <td data-cell-header="근속연수">n년 n개월</td>
                                    <td data-cell-header="연차">15</td>
                                </tr>
                                <tr>
                                    <td data-cell-header="순번">1</td>
                                    <td data-cell-header="이름">홍길동</td>
                                    <td data-cell-header="근속연수">n년 n개월</td>
                                    <td data-cell-header="연차">15</td>
                                </tr>
                                <tr>
                                    <td data-cell-header="순번">1</td>
                                    <td data-cell-header="이름">홍길동</td>
                                    <td data-cell-header="근속연수">n년 n개월</td>
                                    <td data-cell-header="연차">15</td>
                                </tr>
                                <tr>
                                    <td data-cell-header="순번">1</td>
                                    <td data-cell-header="이름">홍길동</td>
                                    <td data-cell-header="근속연수">n년 n개월</td>
                                    <td data-cell-header="연차">15</td>
                                </tr>
                                <tr>
                                    <td data-cell-header="순번">1</td>
                                    <td data-cell-header="이름">홍길동</td>
                                    <td data-cell-header="근속연수">n년 n개월</td>
                                    <td data-cell-header="연차">15</td>
                                </tr>
                                <tr>
                                    <td data-cell-header="순번">1</td>
                                    <td data-cell-header="이름">홍길동</td>
                                    <td data-cell-header="근속연수">n년 n개월</td>
                                    <td data-cell-header="연차">15</td>
                                </tr>
                                <tr>
                                    <td data-cell-header="순번">1</td>
                                    <td data-cell-header="이름">홍길동</td>
                                    <td data-cell-header="근속연수">n년 n개월</td>
                                    <td data-cell-header="연차">15</td>
                                </tr>
                                <tr>
                                    <td data-cell-header="순번">1</td>
                                    <td data-cell-header="이름">홍길동</td>
                                    <td data-cell-header="근속연수">n년 n개월</td>
                                    <td data-cell-header="연차">15</td>
                                </tr>
                                <tr>
                                    <td data-cell-header="순번">1</td>
                                    <td data-cell-header="이름">홍길동</td>
                                    <td data-cell-header="근속연수">n년 n개월</td>
                                    <td data-cell-header="연차">15</td>
                                </tr>
                                <tr>
                                    <td data-cell-header="순번">1</td>
                                    <td data-cell-header="이름">홍길동</td>
                                    <td data-cell-header="근속연수">n년 n개월</td>
                                    <td data-cell-header="연차">15</td>
                                </tr>
                                <tr>
                                    <td data-cell-header="순번">1</td>
                                    <td data-cell-header="이름">홍길동</td>
                                    <td data-cell-header="근속연수">n년 n개월</td>
                                    <td data-cell-header="연차">15</td>
                                </tr>
                                <tr>
                                    <td data-cell-header="순번">1</td>
                                    <td data-cell-header="이름">홍길동</td>
                                    <td data-cell-header="근속연수">n년 n개월</td>
                                    <td data-cell-header="연차">15</td>
                                </tr>
                                <tr>
                                    <td data-cell-header="순번">1</td>
                                    <td data-cell-header="이름">홍길동</td>
                                    <td data-cell-header="근속연수">n년 n개월</td>
                                    <td data-cell-header="연차">15</td>
                                </tr>
                                <tr>
                                    <td data-cell-header="순번">1</td>
                                    <td data-cell-header="이름">홍길동</td>
                                    <td data-cell-header="근속연수">n년 n개월</td>
                                    <td data-cell-header="연차">15</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>    
                <!-- list_table -->

                <!--title 2-->
                <h3 class="tit2">paging</h3>
                <!--title 2-->

                <!-- paging -->
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
                <!-- paging -->

                <!--title 2-->
                <h3 class="tit2">input_table 1단</h3>
                <!--title 2-->

                <!-- input_table 1단 -->
                <div class="input_table mb30">
                    <table>
                        <colgroup>
                            <col style="width:12%;">
                            <col style="width:auto;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>체크박스 버튼</th>
                                <td>
                                    <label for="ch1"> <!-- for, id 일치 -->
                                        <input type="checkbox" id="ch1"> <!-- for, id 일치 -->
                                        <span>체크박스 1</span>
                                    </label>
                                    <label for="ch2"> <!-- for, id 일치 -->
                                        <input type="checkbox" id="ch2"> <!-- for, id 일치 -->
                                        <span>체크박스 2</span>
                                    </label> 
                                </td>
                            </tr>
                            <tr>
                                <th>라디오 버튼</th>
                                <td>
                                    <label for="ra1"> <!-- for, id 일치 -->
                                        <input type="radio" name="radio" id="ra1"> <!-- for, id 일치 -->
                                        <span>라디오 1</span>
                                    </label>
                                    <label for="ra2"> <!-- for, id 일치 -->
                                        <input type="radio" name="radio" id="ra2"> <!-- for, id 일치 -->
                                        <span>라디오 2</span>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <th>input text</th>
                                <td><input type="text"></td>
                            </tr>                            
                            <tr>
                                <th>select</th>
                                <td>
                                    <select>
                                        <option value="">test1</option>
                                        <option value="">test2</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>너비 100%</th>
                                <td><input type="text" class="w100"></td>
                            </tr>
                            <tr>
                                <th>textarea</th>
                                <td><textarea></textarea></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- input_table 1단 -->

                <!--title 2-->
                <h3 class="tit2">input_table 2단</h3>
                <!--title 2-->

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
                                <th>코드명</th>
                                <td><input type="text"></td>
                                <th>사용여부</th>
                                <td>
                                    <select>
                                        <option value="">예</option>
                                        <option value="">아니요</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>비고1</th>
                                <td><textarea></textarea></td>
                                <th>비고2</th>
                                <td><textarea></textarea></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- input_table 2단 -->

                <!--title 2-->
                <h3 class="tit2">view_table</h3>
                <!--title 2-->

                <!-- view_table -->
                <div class="view_table mb30">
                    <table>
                        <colgroup>
                            <col style="width:12%;">
                            <col style="width:auto;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>한줄</th>
                                <td>한줄~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td>
                            </tr>
                            <tr>
                                <th>여러줄</th>
                                <td>그들의 우리 끝에 이 피고 피가 더운지라 있다. 우리의 뛰노는 방지하는 아니더면, 청춘이 군영과 어디 이는 무엇이 보라. 눈에 주는 이성은 같으며, 인간의 행복스럽고 긴지라 그들은 때문이다. 품에 피어나기 피가 찾아다녀도, 하는 이것이다. 위하여, 사랑의 없는 쓸쓸한 그들의 불러 황금시대의 운다. 용감하고 안고, 사랑의 우리의 심장의 바로 위하여, 동력은 그들은 것이다. 같이, 유소년에게서 얼음이 길을 발휘하기 그들의 찾아 보는 그들의 것이다. 청춘이 불러 이는 피어나는 같이, 생명을 힘있다. 되려니와, 광야에서 동산에는 튼튼하며, 얼음과 무한한 철환하였는가? 싶이 새 안고, 수 되는 이상을 청춘의 있으며, 칼이다.</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- view_table -->









<%@include file="includes/footer.jsp" %>








