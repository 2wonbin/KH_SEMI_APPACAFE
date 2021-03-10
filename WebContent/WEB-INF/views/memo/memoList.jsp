<%@page import="memo.model.vo.MemoVo"%>
<%@page import="member.model.vo.Member"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    List<MemoVo> list = (List<MemoVo>)request.getAttribute("list");
	
	Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
	
	String msg = (String)request.getAttribute("msg");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 목록 | 아빠카페 ㄴ</title>
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
메모를 쫙 뿌린다
내 아이디를 들고 가서
내 아이디가 == receiver 와 같은지를 WHERE 해가지고 찾아가지고
걔네만 뿌린다.

페이징 넣어야되는데
개빡세니까 나중에
  -->


<style>


.listTr {
    color: rgb(190,190,190);	
}

.listTr.noread {
	font-weight: bolder;
    color: black;	
}

</style>

    <div class="col-md-12 py-4">
	    <!-- 테이블 -->
	    <table class="table table-hover">
	        <thead>
	            <tr>
	                <th>글번호</th>                
	                <th>보낸이</th>                
	                <th>내용</th>                
	                <th>작성일</th>
	            </tr>
	        </thead>
	        <tbody>
	            <%for(MemoVo memo:list){ %>
	            <tr class="listTr<% if (!memo.getIsRead()) { %> noread <% } %>" role="button" onclick="moveDetailPage(<%=memo.getMemoNo() %>)">
	            	<td class="MemoNo"><%=memo.getMemoNo() %></td>
	            	<td><%=memo.getSenderNickname() %></td>
	            	<td><%=memo.getContent() %></td>
	            	<td><%=memo.getSendDate() %></td>
	            	<td></td>
	            </tr>
	            <%} %>
	        </tbody>
	    </table>
	</div>
	
	<script>
	function moveDetailPage(memoNo) {
		location.href='<%= request.getContextPath() %>/memo/memoContent?memoNo=' + memoNo;
	}	
	<%if(msg != null && msg != "") {%>
	function showAlert() {
		alert("<%=msg%>");		
	}
	
	
	<%}%>
	</script>
</body>
</html>