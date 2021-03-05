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

#enroll-container{
	display:inline-block;
}
	form{
	width: 600px;
	}
</style>
</head>
<body>
	<div id="enroll-container">
	<h1>회원가입</h1>
	<form
		name="memberEnrollFrm" 
		action=""
		method="POST">
		<table class="table">
			<tr>
				<th>
					아이디<sup>*</sup>
				</th>
				<td>
					<input type="text" placeholder="4글자이상" name="memberId" id="memberId_" required>
					<input type="button" class="btn-secondary" value="중복검사" onclick="checkIdDuplicate();"/>
<!-- 					<input type="hidden" id="idValid" value="0" /> -->
					<%-- 중복검사 통과인경우 1 / 통과하지 못한 경우 0 --%>
				</td>
			</tr>
			<tr>
				<th>
					비밀번호<sup>*</sup>
				</th>
				<td>
					<input type="password" name="password" id="password_" required><br>
				</td>
			</tr>
			<tr>
				<th>
					비밀번호 재확인<sup>*</sup>
				</th>
				<td>	
					<input type="password" id="password2" required><br>
				</td>
			</tr>
			<tr>
				<th>
					이름<sup>*</sup>
				</th>
				<td>	
				<input type="text"  name="memberName" id="memberName" required><br>
				</td>
			</tr>
			<tr>
				<th>
					닉네임<sup>*</sup>
				</th>
				<td>
					<input type="text" placeholder="2글자이상" name="nickName" id="nickName_" required>
					<input type="button" class="btn-secondary" value="중복검사" onclick="checkIdDuplicate();"/>
					<input type="hidden" id="idValid" value="0" />
					<%-- 중복검사 통과인경우 1 / 통과하지 못한 경우 0 --%>
				</td>
			</tr>   
			<tr>
				<th>
					주민번호<sup>*</sup>
				</th>
				<td>	
				<input type="text"  name="ssn" id="ssn" placeholder="-제외하고 입력해주세요" required><br>
				</td>
			</tr>
			<tr>
				<th>
					Email
				</th>
				<td>	
					<input type="email" placeholder="이메일 형식으로 입력해주세요." name="email" id="email"><br>
				</td>
			</tr>
			<tr>
				<th>
					휴대전화<sup>*</sup>
				</th>
				<td>	
					<input type="tel" placeholder="-없이 입력해주세요." name="phone" id="phone" maxlength="11" required><br>
				</td>
			</tr>
			<tr>
				<th>
					주소
				</th>
				<td>	
					<input type="text" placeholder="" name="address" id="address"><br>
				</td>
			</tr>
		</table>
	</div>
	<div>
		<input type="submit" class="btn-primary" value="가입" >
		<input type="reset" class="btn-danger" value="취소">
	</div>
	
	</form>
</body>
</html>