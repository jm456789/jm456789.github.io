<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<!-- 수정확인창 -->
<!--  
<script>
	$(document).ready(function() {
		$("#btnUpdate").click(function() {
			if (confirm("수정하시겠습니까?")) {
				document.form1.action = "${path}/member/modify";
				document.form1.submit();
			}
		});
	});
</script>
 -->


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<!--title 1-->
<h2 class="tit1">내 정보 수정</h2>
<!--title 1-->

<%-- action='/member/modify?e_id=<sec:authentication property="principal.username"/>' --%>
<form role="form" method="post">
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
						<th colspan="2">이름</th>
						<td>
							<input type="text" readonly="readonly" value="<c:out value='${member.e_name}' />" />
						</td>
					</tr>
					<tr>
						<th colspan="2">사원 번호</th>
						<td>
							<input type="text" readonly="readonly" value=" <c:out value='${member.e_id}' />" />
						</td>
					</tr>
					<tr>
						<th rowspan="3">비밀번호 변경</th>
						<th>기존 비밀번호</th>
						<td>
							<input type="password" readonly="readonly" value=" <c:out value='${member.e_pass }'/>"/>
						</td>
					</tr>
					<tr>
						<th>새로운 비밀번호</th>
						<td>
							<input type="password"  id="e_pass" name="e_pass">
						</td>
					</tr>
					<tr>
						<th>새로운 비밀번호 재확인</th>
						<td>
							<input type="password" id="e_pass1" name="e_pass1">
							<button type="button" onclick="test()" class="btn_sz_sm btn_ln1">확인</button>
						</td>
					</tr>
						<tr>
						<th colspan="2">이메일</th>
						<td>
							<input type="text"  id="e_email" name="e_email" value=" <c:out value='${member.e_email}' />" />
						</td>
					</tr>
					<tr>
						<th colspan="2">주소</th>
						<td>
							<input name="e_address" id="e_address" type="text" readonly="readonly" value=" <c:out value='${member.e_address }'/>"/>
							<button type="button" class="btn_sz_sm btn_ln1" onclick="execPostCode();">주소검색</button> <br />
							<div class="area_w7_3 mt7">
								<input type="text" readonly="readonly" name="e_address2" id="e_address2" value=" <c:out value='${member.e_address2 }'/>"/>
								<input type="text" name="e_address3" id="e_address3" value=" <c:out value='${member.e_address3 }'/>"/>
							</div>
						</td>
					</tr>
					<tr>
						<th colspan="2">개인번호</th>
						<td><input type="number" id="e_cell" name="e_cell" value="<c:out value='${member.e_cell}' />"> - <input type="number" id="e_cell2" name="e_cell2" value="<c:out value='${member.e_cell2}' />">
							- <input type="number" id="e_cell3" name="e_cell3" value="<c:out value='${member.e_cell3}' />"></td>
					</tr>
					<tr>
						<th colspan="2">사내 번호</th>
						<td><input type="number" id="e_tell" name="e_tell" value="<c:out value='${member.e_tell}' />"> - <input type="number" id="e_tell2" name="e_tell2" value="<c:out value='${member.e_tell2}' />">
							- <input type="number" id="e_tell3" name="e_tell3" value="<c:out value='${member.e_tell3}' />"></td>
					</tr>
					<tr>
						<th colspan="2">직위</th>
						<td><input type="text" readonly="readonly" id="e_pid" name="e_pid"
							value="<c:out value='${member.e_pid}' />" /></td>
					</tr>
					<tr>
						<th colspan="2">부서</th>
						<td><input type="text" readonly="readonly" id="e_did" name="e_did"
							value="<c:out value='${member.e_did}' />" /></td>
					</tr>


				</tbody>
			</table>
		</div>
		<!-- input_table 1단 -->


		<!-- 버튼영역 -->
		<div class="brd_btn_control right">
			<!-- 수정하시겠습니까 확인창 -->
			<!-- <button type="button" id="btnUpdate"  class="btn_sz_md btn_bg1">수정하기</button> -->
			<!-- 기존 modify -->
			<!-- <button type="submit" data-oper='modify' class="btn btn-default">Modify</button> -->

	 	<button type="submit" data-oper='modify' class="btn_sz_md btn_bg1">수정하기</button> 
			
		</div>
		<!-- //버튼영역 -->



	<!-- </form> -->
</form>


<%@include file="../includes/footer.jsp"%>
<script type="text/javascript">
	function test() {
		var p1 = document.getElementById('e_pass').value;
		var p2 = document.getElementById('e_pass1').value;

		if (p1.length < 6) {
			alert('입력한 글자가 6글자 이상이어야 합니다.');
			return false;
		}

		if (p1 != p2) {
			alert("비밀번호불일치");
			return false;
		} else {
			alert("비밀번호가 일치합니다");
			return true;
		}
	}
</script>

<script type="text/javascript">
	$(document).ready(function(){	
		var formObj = $("form");	
		$("button[data-oper='modify']").on("click", function(e){
			if(confirm("수정하시겠습니까?")){//수정멘트
			var operation = $(this).data("oper");
			console.log(operation);		
			formObj.submit();  //modify일 때 그냥 submit
			}
			});		
	});
</script>
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

