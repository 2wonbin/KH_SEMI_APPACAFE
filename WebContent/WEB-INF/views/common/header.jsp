<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)session.getAttribute("msg");
	if(msg != null) session.removeAttribute("msg");
	
	
	String rqmsg = (String)request.getAttribute("msg");
	if(rqmsg != null) request.removeAttribute("msg");
	String loc = (String)request.getAttribute("loc");


	Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");

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

<script>
	<% if(rqmsg != null) { %> alert("<%= rqmsg %>"); <% } %>
	<% if(msg != null) { %> alert("<%= msg %>"); <% } %>
	<% if(loc != null) { %> location.href = "<%= loc %>"; <% } %>
</script>

<body class="d-flex flex-column h-100">
	<nav class="navbar navbar-dark bg-dark border-bottom fixed-top nav-height">
	    <a href="<%= request.getContextPath()%>">
	    <span class="navbar-brand mb-0 h1 text-white main-logo ">AppaCafe</span>
	    </a>
	    <% if(memberLoggedIn == null) { %>
	    <div id="connect-link-btn">
	    <table>
	    <tr>
	    <td>
	    <form style="display: inline;" class="form-inline" action="<%= request.getContextPath()%>/member/login" method="GET">
		    <button class="btn btn-primary my-2 my-sm-0 login-btn btn-group btn-group-lg" value="login">로그인</button>
		</form>
	    <input 
		type="button" 
		value="회원가입"
		class="btn btn-success my-2 my-sm-0 btn-group btn-group-lg"
		onclick="location.href='<%= request.getContextPath() %>/member/memberEnroll';">
		</div>
	    </td>
	    
	    </tr>

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
								type="button" 
								class="btn btn-info"
								value="✉" 
								onclick="popupMemoList()"/>
							 
							 
							
			</div>
			
							
			
			
			<script>
				function popupMemoList() {
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
	
