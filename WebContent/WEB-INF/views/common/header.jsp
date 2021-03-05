<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");

%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<title>AppaCafe</title>
</head>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/header.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/bootstrap.js"></script>

<body class="d-flex flex-column h-100">
	<nav class="navbar navbar-dark bg-dark border-bottom fixed-top nav-height">
	    <a href="<%= request.getContextPath()%>">
	    <span class="navbar-brand mb-0 h1 text-white main-logo ">AppaCafe</span>
	    </a>
	    <% if(memberLoggedIn == null) { %>
	    <div id="connect-link-btn">
	    <form style="display: inline;" class="form-inline" action="<%= request.getContextPath()%>/member/memberLogin" method="GET">
		    <button class="btn btn-primary my-2 my-sm-0 login-btn" value="login">로그인</button>
		</form>
	    <input 
		type="button" 
		value="회원가입"
		class="btn btn-success my-2 my-sm-0"
		onclick="location.href='<%= request.getContextPath() %>/member/memberEnroll';">
	    </div>
		<% } else { %>
			<div class="user-info" style="text-align: center;">
			<h3 class="text-white"><%= memberLoggedIn.getNickName() %>님. 안녕하세요.</h1>
			<input 
								type="button" 
								class="btn-primary"
								value="내 정보보기" 
								onclick="location.href='<%= request.getContextPath() %>/member/memberView?memberId=<%= memberLoggedIn.getMemberId() %>';"/>
							<input 
								type="button" 
								class="btn-danger"
								value="로그아웃" 
								onclick="location.href='<%= request.getContextPath() %>/member/logout'; "/>
			</div>
		<% } %>
	</nav>
