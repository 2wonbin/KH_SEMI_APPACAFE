<%@page import="memo.model.vo.MemoVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemoVo memo = (MemoVo)request.getAttribute("memo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<body style="text-align: center;">


<!-- 
메모 번호를 들고가서
그 메모 번호에 맞는 내용을 긁어다가
여기다 뿌린다

보낸시간
보낸이
내용

 -->
 
 <h1>하이</h1>
 
 
 <table class="table table-hover">
	 <tr>
	 	<td>보낸이</td>
	 	<td><%=memo.getSenderNickname() %></td>
	 </tr>
 	<tr>
	 	<td>보낸시간</td>
	 	<td><%=memo.getSendDate() %></td>
	 </tr>
	 <tr style="height: 200px;">
	 	<td>내용</td>
	 	<td><%=memo.getContent() %></td>
	 </tr>
 </table>
 
 <input type="button" value="답장하기" onclick="location.href='<%= request.getContextPath()%>/memo/memoWrite?receiver=<%= memo.getSender()%>'" class="btn btn-success">
</body>
</html>