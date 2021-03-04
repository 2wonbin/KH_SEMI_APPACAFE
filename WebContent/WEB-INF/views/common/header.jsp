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
	<nav class="navbar navbar-dark bg-primary border-bottom fixed-top nav-height">
	    <span class="navbar-brand mb-0 h1 main-logo">AppaCafe</span>
	    <% if(memberLoggedIn == null) { %>
	    <form class="form-inline" action="<%= request.getContextPath()%>/member/memberLogin" method="GET">
		    <button class="btn btn-outline-success my-2 my-sm-0 login-btn" value="login">로그인</button>
		</form>
		<% } else { %>
			<div>
			<h1><%= memberLoggedIn.getNickName() %>님 환영합니다!</h1>
			</div>
		<% } %>
	</nav>
