<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member"%>
<%
	Member member = (Member)request.getAttribute("member");
	
	String birthDay = (member.getSsn()).substring(0, 6);
	
	String gender = (member.getSsn()).substring(6, 7);
	
	int firstNum = Integer.parseInt(gender);
	
	if((firstNum == 1) || (firstNum == 3)){
		gender = "남자";
	} else {
		gender = "여자";
	}
%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#enroll-container{
	text-align: center;
	justify-content:center;

}
	form{
	width: 600px;
	}
</style>
</head>
<body>
<section id=enroll-container>
	<h2 style="margin : 24px 0;">회원 정보</h2>
	<div id="memberInfo" style="display: inline-block">
	<form id="memberUpdateFrm" method="post">
		<table class="table table-hover">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="memberId" id="memberId_" value="<%= member.getMemberId() %>" readonly>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>	
				<input type="text"  name="memberName" id="memberName" value="<%= member.getMemberName() %>"  required><br>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>	
				<input type="text"  name="gender" id="gender" value="<%= gender %>"  required><br>
				</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>	
				<input type="text"  name="nickName" id="nickName" value="<%= member.getNickName() %>"  required><br>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>	
				<input type="text"  name="birthDay" id="birthDay" value="<%= birthDay %>"  required><br>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>	
					<input type="email" name="email" id="email" value="<%= member.getEmail() != null ? member.getEmail() : "" %>"><br>
				</td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td>	
					<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" value="<%= member.getPhone() %>" required><br>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>	
					<input type="text" placeholder="" name="address" id="address" value="<%= member.getAddress() != null ?  member.getAddress() : "" %>"><br>
				</td>
			</tr>
			<tr>
				<th>회원등급</th>
				<td>	
				<input type="text"  name="memberGrade" id="memberGrade" value="<%= member.getGrade() %>"  required><br>
				</td>
			</tr>
		</table>
	</div>
	<div>
        <input type="button" class="btn btn-primary" onclick="updateMember();" value="정보수정"/>
        <input type="button" class="btn btn-primary" onclick="updatePassword();" value="비밀번호수정"/>
        <input type="button" class="btn btn-danger" onclick="deleteMember();" value="탈퇴"/>
	</div>
	</form>
</section>
</body>
</html>