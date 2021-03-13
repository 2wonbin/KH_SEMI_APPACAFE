<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberID = String.valueOf(request.getAttribute("memberId"));
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<style>
	h2{
	left: 50%;
    position: absolute;
    transform: translateX(-50%);
	}
	#findId{
		color:red;
		font-weight: 800;
	}
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원아이디는[<span id="findId"><%=memberID %></span>]입니다.</h2>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>