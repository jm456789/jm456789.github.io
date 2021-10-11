<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page import="org.zerock.domain.AuthVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.chat_start {
	background-color: #4ea3e0;
	color: #fff;
}
</style>

<%@include file="../includes/header.jsp"%>

<script type="text/javascript">
	var Display = true;
	function doDisplay() {
		var con = document.getElementById("myDIV");
		if (con.style.display == 'none') {
			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}
	}
</script>

<!--title 1-->
<h2 class="tit1">사원조회</h2>

<!-- input_table 2단 -->
<div class="input_table mb30">
	<table>
		<colgroup>
			<col style="width: 8%;">
			<col style="width: auto;">
		</colgroup>
		<tbody>

			<tr>
				<th colspan="2">사원 번호</th>
				<td><input type="text" readonly="readonly"
					value=" <c:out value='${mg.e_id}' />" /></td>
			</tr>
			<tr>
				<th colspan="2">이름</th>
				<td><input type="text" readonly="readonly"
					value="<c:out value='${mg.e_name}' />" /></td>
			</tr>
			<tr>
				<th colspan="2">직급</th>
				<td><input type="text" readonly="readonly" id="e_pid"
					name="e_pid" value="<c:out value='${mg.e_pid}' />" /></td>
			</tr>
			<tr>
				<th colspan="2">부서</th>
				<td><input type="text" readonly="readonly" id="e_did"
					name="e_did" value="<c:out value='${mg.e_did}' />" /></td>
			</tr>
			<tr>
				<th colspan="2">이메일</th>
				<td><input type="text" readonly="readonly" id="e_email"
					name="e_email" value="<c:out value='${mg.e_email}' />" /></td>
			</tr>
			<tr>
				<th colspan="2">사내 번호</th>
				<td><input type="number" readonly="readonly" id="e_tell"
					name="e_tell" value="<c:out value='${mg.e_tell}' />"> - <input
					type="number" id="e_tell2" readonly="readonly" name="e_tell2"
					value="<c:out value='${mg.e_tell2}' />"> - <input
					type="number" id="e_tell3" readonly="readonly" name="e_tell3"
					value="<c:out value='${mg.e_tell3}' />"></td>
			</tr>
		</tbody>
	</table>
</div>
<sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')">
	<a href="javascript:doDisplay();" class="btn_sz_md btn_ln1 w100"> 상세보기</a>
</sec:authorize>
<div class="input_table mt10" id="myDIV"
	style="display: none; margin-bottom: 20px;">
	<table>
		<colgroup>
		<colgroup>
			<col style="width: 8%;">
			<col style="width: auto;">
		</colgroup>
		</colgroup>
		<tbody>
			<tr>
				<th colspan="2">사원권한</th>
				<td><input type="text" readonly="readonly" id="auth" name="auth"
					value="<c:out value='${auth.auth}' />" /></td>
			</tr>
			<tr>
				<th colspan="2">개인 번호</th>
				<td><input type="number" id="e_cell" readonly="readonly"
					name="e_cell" value="<c:out value='${mg.e_cell}' />"> - <input
					type="number" id="e_cell2" readonly="readonly" name="e_cell2"
					value="<c:out value='${mg.e_cell2}' />"> - <input
					type="number" id="e_cell3" readonly="readonly" name="e_cell3"
					value="<c:out value='${mg.e_cell3}' />"></td>
			</tr>
			<tr>
				<th colspan="2">주소</th>
				<td><input name="e_address" id="e_address" type="text"
					readonly="readonly" value=" <c:out value='${mg.e_address }'/>" />
					<!-- 					<button type="button" class="btn_sz_sm btn_ln1"
						onclick="execPostCode();">주소검색</button> <br /> -->
					<div class="area_w7_3 mt7">
						<input type="text" readonly="readonly" name="e_address2"
							id="e_address2" value=" <c:out value='${mg.e_address2 }'/>" /> <input
							type="text" name="e_address3" readonly="readonly" id="e_address3"
							value=" <c:out value='${mg.e_address3 }'/>" />
					</div></td>
			</tr>
			<tr>
				<th colspan="2">생년월일</th>
				<td><input type="text" readonly="readonly" id="e_birth"
					name="e_birth" value="<c:out value='${mg.e_birth}' />" /></td>
			</tr>
		</tbody>
	</table>
</div>
<div class="brd_btn_control right mt30">
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<button class="btn_sz_md btn_bg1" type=button
			onclick="location.href='/mg/mgModify?e_id=<c:out value="${mg.e_id }"/>'">
			수정</button>
	</sec:authorize>
	<sec:authorize access="permitAll">
	</sec:authorize>
	<!-- <button class="btn_sz_md btn_bg1" type=button
	onclick="location.href='/mg/mgList'">목록</button> -->
	<button data-oper='mgList' class="btn_sz_md btn_bg1">목록</button>
</div>
<form id='operForm' action="/mg/mgModify" method="get">
	<input type='hidden' id='e_id' name='e_id'
		value='<c:out value="${mg.e_id}"/>'> <input type='hidden'
		name='pageNum' value='<c:out value="${cri.pageNum}"/>'> <input
		type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	<input type='hidden' name='keyword'
		value='<c:out value="${cri.keyword}"/>'> <input type='hidden'
		name='type' value='<c:out value="${cri.type}"/>'>

</form>


<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		/*   $("button[data-oper='mgModify']").on("click", function(e){
		
		 operForm.attr("action","/mg/mgModify").submit();
		
		 }); */

		$("button[data-oper='mgList']").on("click", function(e) {

			operForm.find("#e_id").remove();
			operForm.attr("action", "/mg/mgList")
			operForm.submit();

		});
	});
</script>

<%@include file="../includes/footer.jsp"%>




