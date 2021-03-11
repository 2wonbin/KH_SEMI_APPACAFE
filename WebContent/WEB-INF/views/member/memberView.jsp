<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<%
	
	
	String birthDay = (memberLoggedIn.getSsn()).substring(0, 6);
	
	String gender = (memberLoggedIn.getSsn()).substring(6, 7);
	
	int firstNum = Integer.parseInt(gender);
	
	if((firstNum == 1) || (firstNum == 3)){
		gender = "남자";
	} else {
		gender = "여자";
	}
	
	String memberRole = "A".equals((memberLoggedIn.getMemberRole())) ? "관리자" : "일반" ;
	
	 msg = (String)session.getAttribute("msg");
	if(msg != null) session.removeAttribute("msg");
	
	String memberId = member.getMemberId();
	
%>
<style>
	th{
		width: 200px;
	}
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.main-content{
		justify-content: center;
    display: block;
    text-align: -webkit-center;
    }
	form{
	width: 1000px;
	
	}
	input:read-only{
		background-color : rgba(0,0,0,0.1);

	}	
	

</style>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.5.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
		location.href = "<%= request.getContextPath() %>/member/passwordChange?memberId=<%= memberLoggedIn.getMemberId() %>";
	}
	
	function deleteMember(){
	    var bool = confirm("정말로 탈퇴하시겠습니까?");
	    if(bool)
	        location.href = "<%=request.getContextPath() %>/member/memberDelete?memberId=<%=memberLoggedIn.getMemberId()%>";
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
	
	function addressFind(){
		new daum.Postcode({

	        oncomplete: function(data) {

	            $("#zoneCode").val(data.zonecode); //data.zoncode 우편번호
	            $("#roadAddress").val(data.roadAddress); //data.roadAddress 도로명주소
	            
	            $("#detail").focus();

	        }

	    }).open();
		
	}
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
					<input type="text" name="memberId" id="memberId_" value="<%= memberLoggedIn.getMemberId() %>" readonly>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>	
				<input type="text"  name="memberName" id="memberName" value="<%= memberLoggedIn.getMemberName() %>" readonly><br>
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
				<input type="text" name="nickName" id="nickName" value="<%= memberLoggedIn.getNickName() %>"  required><br>
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
					<input type="email" name="email" id="email" value="<%= memberLoggedIn.getEmail() != null ? member.getEmail() : "" %>"><br>
				</td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td>	
					<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" value="<%= memberLoggedIn.getPhone() %>" required><br>
				</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>	
					<input type="text" name="zoneCode" id="zoneCode" value="<%= memberLoggedIn.getZoneCode() != null ?  memberLoggedIn.getZoneCode() : "" %>"><br>
				</td>
				<th>도로명주소</th>
				<td>	
					<input type="text" name="roadAddress" id="roadAddress" value="<%= memberLoggedIn.getRoadAddress() != null ?  memberLoggedIn.getRoadAddress() : "" %>"><br>
				</td>
				<th>상세주소</th>
				<td>	
					<input type="text" name="detail" id="detail" value="<%= memberLoggedIn.getDetail() != null ?  memberLoggedIn.getDetail() : "" %>"><br>
				</td>
				<td>
					<input type="button" id="addressBtn" value="주소찾기" onclick="addressFind();" /><br>
				</td>
			</tr>
			<tr>
				<th>회원권한</th>
				<td>	
				<input type="text"  name="memberGrade" id="memberGrade" value="<%= memberRole %>"  readonly><br>
				</td>
			</tr>
		</table>
		
		</form>
		<% if(checkKakao == null){ %>
		<a id="custom-login-btn" href="javascript:loginWithKakao()">
		  <img
		    src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
		    width="222"
		  />
		</a>
		<% } else { %>
		<a id="custom-delete-btn" href="javascript:unlinkApp()">
		  <img
		    src="<%=request.getContextPath()%>/img/kakaoDelete.png"
		    width="222"
		  />
		</a>
		<% } %>
		<div id="btn-util-menu" style="text-align:center;">
        <input type="button" onclick="updateMember();" value="정보수정" class="btn btn-primary"/>
        <input type="button" onclick="updatePassword();" value="비밀번호수정" class="btn btn-primary"/>
        <% if (!"A".equals(memberLoggedIn.getMemberRole())) {%>
        <input type="button" onclick="deleteMember();" value="탈퇴" class="btn btn-danger"/>
        <% } %>
		</div>
		
		
		<script type="text/javascript">
		  function loginWithKakao() {
			
		    Kakao.Auth.login({
		      success: function(authObj) {
		    	  Kakao.API.request({
		    	        url: '/v2/user/me',
		    	        success: function(res) {
	   					  var kakaoJsonString = JSON.stringify(res)
	    	              var jsonInfo = JSON.parse(kakaoJsonString); 
	   					  location.href = '<%= request.getContextPath() %>/member/kaKaoEnroll' + '?kakaoID=' + jsonInfo.id + '&memberID=<%=memberId %>';
	   					 
		    	          alert("계정이 연동되었습니다.")
		    	        },
		    	        fail: function(error) {
		    	          alert(
		    	            'login success, but failed to request user information: ' +
		    	              JSON.stringify(error)
		    	          )
		    	        },
		    	      })
		      },
		      fail: function(err) {
		        alert("계정연동에 실패하였습니다.")
		      },
		    })
		  }
		  
		  function unlinkApp() {
			    Kakao.API.request({
			      url: '/v1/user/unlink',
			      success: function(res) {
		    	  var kakaoJsonString = JSON.stringify(res)
   	              var jsonInfo = JSON.parse(kakaoJsonString); 
				  location.href = '<%= request.getContextPath() %>/member/kakaoDelete' + '?kakaoID=' + jsonInfo.id + '&memberID=<%=memberId %>';
			        alert('연동이 해제되었습니다.')
			      },
			      fail: function(err) {
			        alert('연동해제 실패')
			      },
			    })
			  }
		</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>