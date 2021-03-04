<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | 아빠카페</title>
</head>
<body>
	<form id="memberLogin" action ="<%= request.getContextPath()%>/member/memberLogin" method="POST">
	<table>
	<tr>
	<th>아이디</th>
	<td>
	<input type="text" name="memberId" id="memberId_" placeholder="아이디를 입력하세요." />
	</td>
	</tr>
	<tr>
	<th>비밀번호</th>
	<td>
	<input type="password" name="password" id="password_" placeholder="비밀번호를 입력하세요." />
	</td>
	</tr>
	<tr>
	<td colspan="2">
	<input type="submit" value="로그인" />
	</td>
	</tr>
	</table>
	</form>
</body>
</html>