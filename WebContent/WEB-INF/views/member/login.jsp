<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
	<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | 아빠카페</title>
</head>
<body>
<form 
		id="loginFrm"
		action="<%= request.getContextPath() %>/member/memberLogin"
		method="POST">
		<table>
			<tr>
				<td>	
					<input 
						type="text" 
						name="memberId" 
						id="memberId" 
						placeholder="아이디">
				</td>
				<td><input type="submit" value="로그인" tabindex="3"></td>
			</tr>
			<tr>
				<td><input type="password" name="password" id="password" placeholder="비밀번호" tabindex="2"></td>
				<td></td>
			</tr>
		</table>
	</form>
</body>
</html>