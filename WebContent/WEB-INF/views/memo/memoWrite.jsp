<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.model.vo.Member"%>
<%
	int receiver = (int)request.getAttribute("receiver");
	String receiver_nickname = (String)request.getAttribute("receiver_nickname");
	
	Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보내기 | 아빠카페 </title>
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
</head>
<body>

<!-- 
상대방 번호를 받아다가 상대방 닉네임을 세팅해놓고
내 아이디를 세팅해놓고, 
작성 완료 버튼같은거 누르는 순간
그 내용으로 인서트 한다.
 -->
<form action="<%= request.getContextPath()%>/memo/memoWrite" method="POST" style="text-align:center;">
 <table class="table table-hover">
 <thead>
 <tr>
	 <th> </th>
	 <th> </th>
 </tr>
 </thead>
	 <tr>
	 	<td>받는 사람</td>
	 	<td><%=receiver_nickname %></td>
	 </tr>
	 <tr style="display:none;">
	 	<td>받는 사람 번호</td>
	 	<td><input type="text" value="<%= receiver %>" name="receiver"></td>
	 </tr>
	 <tr style="display:none;">
	 	<td>보내는 사람 번호</td>
	 	<td><input type="text" value="<%=memberLoggedIn.getMemberNo() %>" name="sender"></td>
	 </tr>

	
	 </tr>
	 <tr>	 
	 	<td colspan="2"><textarea name="content" class="form-control rounded-0" rows="10"></textarea></td>
	 </tr>
 </table>
 <input type="submit" value="보내기" class="btn btn-success">
</form>
</body>
</html>