<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberID = String.valueOf(request.getAttribute("memberId"));
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<script>
$(function(){
	//폼제출 유효성검사
	$("[name=newPasswordFrm]").submit(passwordValidate);
	//신규비밀번호 일치 검사
	$("#newPasswordCheck").blur(passwordValidate); //blur : 포커스아웃될때 발생
});

function passwordValidate(){
	var $newPassword = $("#newPassword");
	var $newPasswordCheck = $("#newPasswordCheck");
	
	if($newPassword.val() != $newPasswordCheck.val()){
		alert("입력한 비밀번호가 일치하지 않습니다.");
		$newPassword.select();
		return false;
	}
	
	return true;	
}
</script>
<style>
	span.pwcheck{
		font-size: 1.5em;
	}
</style>
</head>
<body>
<h1 style="text-align:center;">비밀번호변경</h1>
	<form 
	name="newPasswordFrm"
	action="<%=request.getContextPath()%>/member/findPassword2"
	method="POST"
	style="text-align:center;">
		<table class="table table-borderless">
			<input type="hidden" name="memberId" value="<%= memberID %>" />
			<tr>
				<th>
					<span class="pwcheck">변경할 비밀번호를 입력하세요.</span>
				</th>
				<td>
					<input type="password" name="newPassword" id="newPassword" required/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="pwcheck">비밀번호 확인</span>
				</th>
				<td>
					<input type="password" name="newPasswordCheck" id="newPasswordCheck" required/>
				</td>
			</tr>
		</table>
		<input type="submit" value="비밀번호 변경" class="btn btn-primary btn-lg"/>
	</form>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>