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
	.main-content{
		position: relative;
		
	}
	#loginFrm{
		text-align : center;
		position:absolute;
		display: inline-block;
		width : 600px;
		transform: translate(100%, 75%);
		
	}
</style>
</head>
<body>
<form 
		id="loginFrm"
		action="<%= request.getContextPath() %>/member/memberLogin"
		method="POST">
		<table class="table">
		<h1>로그인</h1>
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
			</tr>
		</table>
	</form>
</body>
</html>