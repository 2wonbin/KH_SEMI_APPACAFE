<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#passwordFrm{
		position: relative;
		
		height: 100%;
		display:block;
	}
	form {
		position:absolute;
		width: 400px;
		top:25%;
		left:32.5%;
		
	}

</style>
<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<script>
$(function(){
	//폼제출 유효성검사
	$("[name=updatePwdFrm]").submit(passwordValidate);
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
</head>
<body>
<div id="passwordFrm">
	<h2 style="text-align: center; margin-top: 24px;" >비밀번호 변경</h2>
		<form 
			name="updatePwdFrm" 
			action="<%=request.getContextPath()%>/member/passwordChange" 
			method="POST" >
			<table class="table table-light" >
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" name="password" id="password" required></td>
				</tr>
				<tr>
					<th>변경할 비밀번호</th>
					<td>
						<input type="password" name="newPassword" id="newPassword" required>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>	
						<input type="password" id="newPasswordCheck" required><br>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit"  value="변경" class="btn btn-primary"/>
					</td>
				</tr>
			</table>
			<input type="hidden" name="memberId" value="<%= request.getParameter("memberId") %>"/>
		</form>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>