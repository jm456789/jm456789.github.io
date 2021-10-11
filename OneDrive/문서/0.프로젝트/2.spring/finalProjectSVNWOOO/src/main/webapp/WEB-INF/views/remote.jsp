<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="includes/header.jsp"%>
<!DOCTYPE html>

<style>
.sdk-select {
	height: 34px;
	border-radius: 4px;
}

.websdktest button {
	float: right;
	margin-left: 5px;
}

#nav-tool {
	margin-bottom: 0px;
}

#show-test-tool {
	position: absolute;
	top: 100px;
	left: 0;
	display: block;
	z-index: 99999;
}

#display_name {
	width: 250px;
}

#websdk-iframe {
	width: 700px;
	height: 500px;
	border: 1px;
	border-color: red;
	border-style: dashed;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	left: 50%;
	margin: 0;
}
</style>
<form action="http://192.168.0.37:5000" method="post">
	<nav id="nav-tool" class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">원격</a>
			</div>
			<div id="navbar" class="websdktest">
				<table>
					<tr>
						<th colspan="2">RemoteProtocol　</th>
						<td><input style="margin-bottom:7px;" type="text" name="remoteProtocol"
							readonly="readonly" value="RDP" /></td>
					</tr>
					<!-- <input type="text" name="remoteIP" value="192.168.0.3" /> -->
					<tr>
						<th colspan="2">RemoteIP</th>
						<td><input style="margin-bottom:7px;" type="text" readonly="readonly" name="remoteIP"
							value="<c:out value='${remote.remoteIP}' />" /></td>
					</tr>
					<tr>
						<th colspan="2">RemotePort</th>
						<td><input style="margin-bottom:7px;" type="text" name="remotePort" value="3389" /></td>
					</tr>
					<tr>
						<th colspan="2">UserId</th>
						<td><input style="margin-bottom:7px;" type="text" readonly="readonly" name="userId"
							value="<c:out value='${remote.userId}' />" /></td>
					</tr>
					<tr>
						<th colspan="2">Pwd</th>
						<td><input style="margin-bottom:7px;" type="password" readonly="readonly" name="pwd"
							value="<c:out value='${remote.pwd}' />" /></td>
					</tr>
				</table>
				<button type="submit" class="btn_sz_md btn_bg1">제출</button>
			</div>
			<!--/.navbar-collapse -->
		</div>
	</nav>
</form>

<%@include file="includes/footer.jsp"%>