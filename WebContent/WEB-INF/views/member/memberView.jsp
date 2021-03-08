<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
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
	
	 msg = (String)session.getAttribute("msg");
	if(msg != null) session.removeAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.main-content{
		justify-content: center;
    	display: grid;
    	text-align:center;
	}
	form{
	width: 600px;
	
	}
	input:read-only{
		background-color : rgba(0,0,0,0.1);

	}	
	

</style>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.5.1.js"></script>
<script>
	<% if(msg != null) { %> alert("<%= msg %>"); <% } %>
</script>
</head>
<script>
	function updateMember(){
		var url = "<%=request.getContextPath() %>/member/memberUpdate";
		$("#memberUpdateFrm")
			.attr('action',url)
			.submit();
	}
	
	function updatePassword(){
		location.href = "<%= request.getContextPath() %>/member/passwordChange?memberId=<%= member.getMemberId() %>";
	}
	
	function deleteMember(){
	    var bool = confirm("정말로 탈퇴하시겠습니까?");
	    if(bool)
	        location.href = "<%=request.getContextPath() %>/member/memberDelete?memberId=<%=member.getMemberId()%>";
	}
	
	function checkNickNameDuplicate(){
		
		var $nickName = $(nickName);
		
		var title = "checkNickNameDuplicatePopup";
		var spec = "left=500px, top=300px, width=300px, height=200px";
		open("", title, spec);

		var $frm = $(document.checkNickNameDuplicateFrm);
		
		$frm.find("[name=nickName]")
			.val($nickName.val());
		$frm.attr("action", "<%= request.getContextPath() %>/member/checkNickNameDuplicate")
			.attr("method", "POST")
			.attr("target", title) 
			.submit();
	}
	
	$(function(){
		
		$("#memberUpdateFrm").submit(function(){
		
	        //memberName
	        var $memberName = $("#memberName");
	        if(/^[가-힣]{2,}$/.test($memberName.val()) == false){
	        	alert("이름은 한글 2글자 이상이어야 합니다.");
	        	$memberName.select();
	        	return false;
	        }
	        
	        //nickName
	        var $nickName = $("#nickName");
	        if(/^[a-zA-Z0-9가-힣_]{2,}$/.test($nickName.val()) == false){
	        	alert("닉네임은 2글자 이상이어야 합니다.");
	        	$nickName.select();
	        	return false;
	        }
	        
	        //phone
	        var $phone = $("#phone");
	        //-제거하기
	        $phone.val($phone.val().replace(/[^0-9]/g, ""));//숫자아닌 문자(복수개)제거하기
	        
	        if(/^010[0-9]{8}$/.test($phone.val()) == false){
	        	alert("유효한 전화번호가 아닙니다.");
	        	$phone.select();
	        	return false;
	        }
	        
	        
	        return true;
		});
		
	});
</script>
<body>
	<form name="checkNickNameDuplicateFrm">
		<input type="hidden" name="nickName" />
	</form>
	
	<h2 style="text-align:center;">회원 정보</h2>
	<form id="memberUpdateFrm" method="POST" style="text-align:center;">
		<table class="table table-light">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="memberId" id="memberId_" value="<%= member.getMemberId() %>" readonly>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>	
				<input type="text"  name="memberName" id="memberName" value="<%= member.getMemberName() %>" readonly><br>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>	
				<input type="text"  name="gender" id="gender" value="<%= gender %>"  readonly><br>
				</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>	
					<input type="text" name="nickName" id="nickName" value="<%= member.getNickName() %>"  required><br>
					<input type="button" value="중복검사" onclick="checkNickNameDuplicate();"/>
					<input type="hidden" id="nickNameValid" value="0" />
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>	
				<input type="text"  name="birthDay" id="birthDay" value="<%= birthDay %>"  readonly><br>
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
					<input type="text" placeholder="정확한 주소를 입력해주세요." name="address" id="address" value="<%= member.getAddress() != null ?  member.getAddress() : "" %>"><br>
				</td>
			</tr>
			<tr>
				<th>회원등급</th>
				<td>	
				<input type="text"  name="memberGrade" id="memberGrade" value="<%= member.getGrade() %>"  readonly><br>
				</td>
			</tr>
		</table>
		
		</form>
		<div id="btn-util-menu" style="text-align:center;">
        <input type="button" onclick="updateMember();" value="정보수정" class="btn btn-primary"/>
        <input type="button" onclick="updatePassword();" value="비밀번호수정" class="btn btn-primary"/>
        <% if (!"A".equals(memberLoggedIn.getMemberRole())) {%>
        <input type="button" onclick="deleteMember();" value="탈퇴" class="btn btn-danger"/>
        <% } %>
		</div>
		

<%@ include file="/WEB-INF/views/common/footer.jsp" %>