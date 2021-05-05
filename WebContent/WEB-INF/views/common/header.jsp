<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)session.getAttribute("msg");
    Boolean kakaoLogout = (Boolean)request.getAttribute("kakaoLogout");
	if(msg != null) session.removeAttribute("msg");
	
	
	String rqmsg = (String)request.getAttribute("msg");
	if(rqmsg != null) request.removeAttribute("msg");
	String loc = (String)request.getAttribute("loc");


	Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
	Member checkKakao = (Member)session.getAttribute("checkKakao");
	
	String saveId = null;
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie c : cookies){
			if("saveId".equals(c.getName())){
				saveId = c.getValue();
				break;
			}
		}
	}
%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<title>AppaCafe</title>
</head>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap.css">
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/header.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/bootstrap.js"></script>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('b3a2af0dab238f5e4c5b32c1e9ac0017');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized())   
        
       
</script>

<script>
	<% if(rqmsg != null) { %> alert("<%= rqmsg %>"); <% } %>
	<% if(msg != null) { %> alert("<%= msg %>"); <% } %>
	<% if(loc != null) { %> location.href = "<%= loc %>"; <% } %>
	<% if(loc != null) { %> location.href = "<%= loc %>"; <% } %>
	
	<% if(kakaoLogout != null) { %>
	unlinkApp();
	
    function unlinkApp() {
   
    	Kakao.API.request({
          url: '/v1/user/unlink',
          success: function(res) {
            alert('연동을 먼저해주세요')
          },
          fail: function(err) {
            alert('fail: ' + JSON.stringify(err))
          },
        })
   	 }
    <% } %>
    
    <% if(memberLoggedIn != null) { %>
    function checkMemo() {
	    $.ajax({
	    	url:"<%=request.getContextPath()%>/memo/CountUnreadMemo",
			method : "POST",
			dataType : "json",
			data : {
				'receiver': <%= memberLoggedIn.getMemberNo() %>,
			},
			success: function(data){
				if(data.unreadMemo > 0) {
					document.getElementById("memoBtn").classList.add("blingbling");
				}
				else  {
					document.getElementById("memoBtn").classList.remove("blingbling");
				}
			},
			error : function(xhr, status, err){
				console.log(xhr, status, err);
			}
	    });
		
    }
    checkMemo();
    
    setInterval(() => {
    	checkMemo();    	
    }, 5000);
    <% } %>
    
    
    
    
</script>

<body class="d-flex flex-column h-100">
	<nav class="navbar navbar-dark bg-dark border-bottom fixed-top nav-height">
	    <a href="<%= request.getContextPath()%>">
	    <span class="navbar-brand mb-0 h1 text-white main-logo ">AppaCafe</span>
	    </a>
	    <% if(memberLoggedIn == null) { %>
	    <div id="connect-link-btn">
	    <table style="text-align:center;">
	    <tr>
	    <td>
	    <form style="display: inline;" class="form-inline" action="<%= request.getContextPath()%>/member/login" method="GET">
		    <button class="btn btn-primary my-2 my-sm-0 login-btn btn-group btn-group-lg" value="login" style="width: 108px; text-align:center;">로그인</button>
		</form>
	    <input 
		type="button" 
		value="회원가입"
		class="btn btn-success my-2 my-sm-0 btn-group btn-group-lg"
		style="width: 108px; text-align:center"
		onclick="location.href='<%= request.getContextPath() %>/member/memberEnroll';">
		</div>
	    </td>
	    
	    </tr>
	    <td>
	    <div>
		    <a id="custom-login-btn" href="javascript:loginWithKakao()">
			<img
			  src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
			  width="222"
			/>
			</a>
	    </div>
	    </td>
	    <tr></tr>

	    <tr>
	    <td>
		<input 
								type="button" 
								class="btn btn-info btn-header"
								value="아이디찾기"
								onclick="location.href='<%= request.getContextPath() %>/member/findId';">
							
							<input 
								type="button" 
								class="btn btn-info btn-header"
								value="비밀번호찾기"
								onclick="location.href='<%= request.getContextPath() %>/member/findPassword';">
	    </td>
	    </tr>
<script type="text/javascript">
		  function loginWithKakao() {
		    Kakao.Auth.login({
		      success: function(authObj) {
		    	  Kakao.API.request({
		    	        url: '/v2/user/me',
		    	        success: function(res) {
	   					  	var kakaoJsonString = JSON.stringify(res)
	    	             	var jsonInfo = JSON.parse(kakaoJsonString); 
	   					 	location.href = '<%= request.getContextPath() %>/member/kakaoCheck' + '?kakaoID=' + jsonInfo.id;    
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
		</script>
	    </table>
		<% } else { %>
			<div class="user-info" style="text-align: center;">
			<h3 class="text-white"><%= memberLoggedIn.getNickName() %>님. 안녕하세요.</h1>
			<div>
							<input 	
								type="button" 
								class="btn btn-primary"
								value="내 정보보기" 
								onclick="location.href='<%= request.getContextPath() %>/member/memberView?memberId=<%= memberLoggedIn.getMemberId() %>';"/>
								
							<input 
								type="button" 
								class="btn btn-danger"
								value="로그아웃" 
								onclick="location.href='<%= request.getContextPath() %>/member/logout'; "/>
							
							 <input 
							 	id="memoBtn"
								type="button" 
								class="btn btn-info"
								value="✉" 
								onclick="popupMemoList(this)"/>
							 
							 
							
			</div>
			
							
			
			
			<script>
				function popupMemoList(target) {
					target.classList.remove("blingbling");
					window.open('<%= request.getContextPath() %>/memo/memoList?receiver=<%=memberLoggedIn.getMemberNo() %> ', 'memoPopup', 'width=800px, height=480px'); 
				}
				function popupMemoWriter(memberId) {
					window.open('<%= request.getContextPath() %>/memo/memoWrite?receiverid=' + memberId, 'memoPopup', 'width=800px, height=480px');					
				}

				function showMemoPopup(target, memberId) {
					event.stopPropagation();
					document.querySelectorAll(".memo_popup").forEach((a,b) => {
						a.remove();
					});
					
					var popup = document.createElement('div');
					popup.className = "memo_popup";
					popup.innerHTML = "✉ 쪽지 보내기";
					
					$(popup).on('click', function(){
						popupMemoWriter(memberId);
					});
					
					target.append(popup);
				}
			</script>
		<% } %>
	</nav>
	<div class="container-fluid">
    <div class="row">
        <div class="col-12">
	
