<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
<h2 class="tit1">인사관리</h2>
  <form role="form" action="/mg/mgModify" method="post">
      
        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
        <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
	    <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>

	<!-- <form name="form1" method="post"> -->
	<!-- input_table 1단 -->
	<div class="input_table mb30">
		<table>
			<colgroup>
				<col style="width: 8%;">
				<col style="width: auto;">
			</colgroup>
			<tbody>

				<tr>
					<th colspan="2">사원 번호</th>
					<td><input type="text" readonly="readonly" name="e_id"
						value="<c:out value='${mg.e_id}' />" /></td>
				</tr>
				<tr>
					<th colspan="2">이름</th>
					<td><input type="text" readonly="readonly" name="e_name"
						value="<c:out value='${mg.e_name}' />" /></td>
				</tr>
				<tr>
					<th colspan="2">직급</th>
					<td>
					<%-- <input type="text" name="e_pid" value="<c:out value='${mg.e_pid}' />" /> --%>
						<select name='e_pid'>
							<option value="<c:out value='${mg.e_pid}' />"><c:out value='${mg.e_pid}' /></option>
							<option value="사원">사원</option>
							<option value="주임">주임</option>
							<option value="대리">대리</option>
							<option value="과장">과장</option>
							<option value="차장">차장</option>
							<option value="부장">부장</option>
							<option value="대표이사">대표이사</option>
							</select>
						
						</td>
				</tr>
				<tr>
					<th colspan="2">부서</th>
					<td>
					<%-- <input type="text" name="e_did"
						value="<c:out value='${mg.e_did}' />" /> --%>
						<select name='e_did'>
							<option value="<c:out value='${mg.e_did}' />"><c:out value='${mg.e_did}' /></option>
							<option value="인사팀">인사팀</option>
							<option value="회계팀">회계팀</option>
							<option value="기획팀">기획팀</option>
							<option value="디자인팀">디자인팀</option>
							<option value="개발팀">개발팀</option>
					</select>
						</td>
				</tr>
				<tr>
					<th colspan="2">이메일</th>
					<td><input type="text"  name="e_email"
						value="<c:out value='${mg.e_email}' />" /></td>
				</tr>
					<tr>
					<th colspan="2">접근 권한</th>
					<!-- 텍스트 입력방식 
					<td><input type="text"  name="auth" id="auth"
						value="<c:out value='${auth.auth}' />" /></td>
						 -->
					 <td>
					 	<select name="auth">
							<option value="">선택</option>
							<option value="ROLE_MEMBER">권한 계정</option>
							<option value="ROLE_USER">일반</option>
						</select>
					</td>
				</tr>
				<tr>
					<th colspan="2">사내 번호</th>
					<td><input type="number" name="e_tell"
						value="<c:out value='${mg.e_tell}' />"> - <input
						type="number" name="e_tell2"
						value="<c:out value='${mg.e_tell2}' />"> - <input
						type="number"  name="e_tell3"
						value="<c:out value='${mg.e_tell3}' />"></td>
				</tr>
				<tr>
					<th colspan="2">개인 번호</th>
					<td><input type="number" name="e_cell"
						value="<c:out value='${mg.e_cell}' />"> - <input
						type="number"  name="e_cell2"
						value="<c:out value='${mg.e_cell2}' />"> - <input
						type="number"  name="e_cell3"
						value="<c:out value='${mg.e_cell3}' />"></td>
				</tr> 
				<tr>
					<th colspan="2">주소</th>
					<td><input name="e_address"  type="text"
						readonly="readonly" value=" <c:out value='${mg.e_address }'/>" />
						<button type="button" class="btn_sz_sm btn_ln1"
							onclick="execPostCode();">주소검색</button> <br />
						<div class="area_w7_3 mt7">
							<input type="text" readonly="readonly" name="e_address2"
								 value=" <c:out value='${mg.e_address2 }'/>" />
							<input type="text" name="e_address3"
								value=" <c:out value='${mg.e_address3 }'/>" />
						</div></td>
				</tr>
				<tr>
					<th colspan="2">생년월일</th>
					<td><input type="text" name="e_birth"
						value="<c:out value='${mg.e_birth}' />" /></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="brd_btn_control right mt30">
	<button type="submit" data-oper='mgModify' class="btn_sz_md btn_bg1">저장</button>
	<button type="submit" data-oper='mgRemove' class="btn_sz_md btn_bg2">삭제</button>
	<button type="button" data-oper='mgList' class="btn_sz_md btn_bg3" onclick="location.href='/mg/mgList'">목록</button>
	</div>
</form>



<!-- </form> -->
</form>

<script>
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[name=e_address]").val(data.zonecode);
				$("[name=e_address2]").val(fullRoadAddr);

				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
			}
		}).open();
	}
</script>
<!-- <script type="text/javascript">
	$(document).ready(function(){
		
		var formObj = $("form");
		
		$('button').on("click", function(e){
			e.preventDefault();  //submit 기본 동작 막기
			
			//data-oper로 submit 직접 수행
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation === 'mgRemove'){
				formObj.attr("action", "/mg/mgRemove");
				
			}
			formObj.submit();  //modify일 때 그냥 submit
			
		});		
	});
</script> -->
 <script>
$(document).ready(function(){	
	var formObj = $("form");	
	$("button[data-oper='mgModify']").on("click", function(e){
		if(confirm("수정하시겠습니까?")){//수정멘트
			var operation = $(this).data("oper");
			console.log(operation);	
			formObj.submit();  //modify일 때 그냥 submit
		}
	});		
});
</script> 

<script>
$(document).ready(function(){	
	var formObj = $("form");	
	$("button[data-oper='mgRemove']").on("click", function(e){
		e.preventDefault();  //submit 기본 동작 막기
		
		var operation = $(this).data("oper");
		
		console.log(operation);		
		
	    if(operation === 'mgRemove'){
		      formObj.attr("action", "/mg/mgRemove");
		      
		    }else if(operation === 'mgList'){
		      //move to list
		      formObj.attr("action", "/mg/mgList").attr("method","get");
		      
		      var pageNumTag = $("input[name='pageNum']").clone();
		      var amountTag = $("input[name='amount']").clone();
		      var keywordTag = $("input[name='keyword']").clone();
		      var typeTag = $("input[name='type']").clone();      
		      
		      formObj.empty();
		      
		      formObj.append(pageNumTag);
		      formObj.append(amountTag)
		      formObj.append(keywordTag);
		      formObj.append(typeTag);	       
		    }
		    
		    formObj.submit();  //modify일 때 그냥 submit		
	});		
}); 
</script>


<%@include file="../includes/footer.jsp"%>




