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
	.main-content{
		justify-content: center;
    	display: grid;
	}
	form{
	width: 600px;
	} 	
	
	sup{
		color : red;
	}
	
	.duplicateFrm{
		display : none;
	}
</style>
<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<script>

	$(function(){
		
		 $("#password2").blur(function(){
		        var $p1 = $("#password_");
		        var $p2 = $("#password2");
		        
		        if($p1.val() != $p2.val()){
		            alert("패스워드가 일치하지 않습니다.");
		            $p1.select();
		        }
		    });
		 
		 $("[name=memberEnrollFrm]").submit(function(e){
		    	
		    	var $memberId = $("#memberId_");
		    	//아이디는 영문자/숫자  4글자이상만 허용 
		        if(/^[a-zA-Z0-9]{4,}$/.test($memberId.val()) == false){
		            alert("아이디는 최소 4자리이상이어야 합니다.");
		            $memberId.select();
		            return false;
		        }
		    	//아이디 중복검사
		    	var $idValid = $("#idValid");
		    	if($idValid.val() != 1){
		    		alert("아이디 중복 검사해주세요.");
		    		$idValid.focus();
		    		return false;
		    	}
		    	
		        //password
		        var $p1 = $("#password_");
		        var $p2 = $("#password2");
		        if(/^[a-zA-Z0-9!@#$$%^&*()]{4,}/.test($p1.val()) == false){
		        	alert("유효한 패스워드를 입력하세요.");
		        	$p1.select();
		            return false;
		        }
		        
		        if($p1.val() != $p2.val()){
		            alert("패스워드가 일치하지 않습니다.");
		            $p1.select();
		            return false;
		        }
		        
		        //memberName
		        var $memberName = $("#memberName");
		        if(/^[가-힣]{2,}$/.test($memberName.val()) == false){
		        	alert("이름은 한글 2글자 이상이어야 합니다.");
		        	$memberName.select();
		        	return false;
		        }
		        
		        //phone
		        var $phone = $("#phone");
		        
		        $phone.val($phone.val().replace(/[^0-9]/g, ""));
		        
		        if(/^010[0-9]{8}$/.test($phone.val()) == false){
		        	alert("유효한 전화번호가 아닙니다.");
		        	$phone.select();
		        	return false;
		        }
		        
		        return true;
		    });
		 
		 $("#memberId_").change(function(){
				$("#idValid").val(0);
			});
		 
	});
	
	function checkIdDuplicate(){
		
		var $memberId = $(memberId_);
		if(/^[a-zA-Z0-9_]{4,}$/.test($memberId.val()) == false){
			alert("유효한 아이디를 입력해주세요.");
			$memberId.select();
			return;
		}
		
		var title = "checkIdDuplicatePopup";
		var spec = "left=500px, top=300px, width=300px, height=200px";
		open("", title, spec);

		var $frm = $(document.checkIdDuplicateFrm);
		
		$frm.find("[name=memberId]")
			.val($memberId.val());
		$frm.attr("action", "<%= request.getContextPath() %>/member/checkIdDuplicate")
			.attr("method", "POST")
			.attr("target", title) 
			.submit();
	}
	
	function checkNickNameDuplicate(){
			
			var $nickName = $(nickName_);
			if(/^[a-zA-Z0-9가-힣_]{2,}$/.test($nickName.val()) == false){
				alert("유효한 닉네임을 입력해주세요.");
				$nickName.select();
				return;
			}
			
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
		
</script>
</head>
<body>
	<!-- 아이디 중복검사 폼 -->
	<form name="checkIdDuplicateFrm" class="duplicateFrm">
		<input type="hidden" name="memberId" />
	</form>
	<!-- 닉네임 중복검사 폼 -->
	<form name="checkNickNameDuplicateFrm" class="duplicateFrm">
		<input type="hidden" name="nickName" />
	</form>
	
	<h1 style="text-align:center; margin-top: 24px;" >회원가입</h1>
	<form
		name="memberEnrollFrm" 
		action=""
		method="POST">
		<table class="table table-light">
			<tr>
				<th>
					아이디<sup>*</sup>
				</th>
				<td>
					<input type="text" placeholder="4글자이상" name="memberId" id="memberId_" required>
					<input type="button" value="중복검사" onclick="checkIdDuplicate();"/>
					<input type="hidden" id="idValid" value="0" />
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
					<input type="text" placeholder="2글자이상(특수기호사용불가)" name="nickName" id="nickName_" required>
					<input type="button" value="중복검사" onclick="checkNickNameDuplicate();"/>
					<input type="hidden" id="nickNameValid" value="0" />
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
		
		<div id="btn-enroll-menu" style="text-align:center;">
			<input type="submit" class="btn btn-primary" value="가입" >
			<input type="reset" class="btn btn-danger" value="취소">
		</div>
	
	</form>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>