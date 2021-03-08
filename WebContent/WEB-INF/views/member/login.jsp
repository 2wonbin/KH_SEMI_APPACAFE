<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
	<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | 아빠카페</title>
<style>
section{
	text-align: center;
}
.tb-login{
		width: 600px;
	}
	form{
		display: inline-block;
	}
</style>
</head>
<body>
<section>
<h1 style="margin-top: 24px;">로그인</h1>

<form 
		id="loginFrm"
		action="<%= request.getContextPath() %>/member/login"
		method="POST">
		<table class="table table-light tb-login">
		<tr>
				<td>	
					<input 
						type="text" 
						name="memberId" 
						id="memberId" 
						placeholder="아이디"
						class="form-control-lg">
						
				</td>
				</tr>
			<tr>
				<td><input type="password" name="password" id="password" placeholder="비밀번호" class="form-control-lg"></td>
				<tr>
				<td><input type="submit" value="로그인" class="btn bg-primary text-white col-6 btn-lg"></td>
			</tr>
		<tr>
			<td></td>
		</tr>
		</table>
	</form>

</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>