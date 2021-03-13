<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String nickName = request.getParameter("nickName");
	boolean available = (boolean)request.getAttribute("available");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<style>
div#checkNickName-container{text-align:center; padding-top:50px;}
span#duplicated{color:red; font-weight:bold;}
</style>
<script>

	function checkNickNameDuplicate(){
		
		var $nickName = $(nickName_);
		if(/^[a-zA-Z0-9가-힣_]{2,}$/.test($nickName.val()) == false){
			alert("유효한 닉네일을 입력해주세요.");
			$memberId.select();
			return;
		}
		
		
		var $frm = $(document.checkIdDuplicateFrm);
		//아이디값 세팅
		$frm.find("[name=nickName]")
			.val($nickName.val());
		$frm.submit();
	}
	
	function confirmNickName(){
		//opener : 팝업을 연 부모창의 window객체
		var $frm = $(opener.document.memberEnrollFrm);
		$frm.find("#nickName_").val("<%= nickName %>");
		$frm.find("#nickNameValid").val(1);
		
		close();
	}
	
</script>
</head>
<body>

	<div id="checkNickName-container">
		<% if(available) { %>
			
			[ <%= nickName %> ]는 사용 가능합니다.
			<br /><br />
			<input type="button" value="사용하기" onclick="confirmNickName();" />
			
				
		<% } else { %>
			[ <span id="duplicated"><%= nickName %></span> ]는 이미 사용중입니다.
			<br /><br />
			<form 
				action="<%= request.getContextPath() %>/member/checkNickNameDuplicate"
				method="POST"
				name="checkIdDuplicateFrm">
				<input type="text" name="nickName" id="nickName_" placeholder="닉네임"/>
				<input type="button" value="중복검사" onclick="checkNickNameDuplicate();" />
			</form>
		<% } %>
	</div>

</body>
</html>