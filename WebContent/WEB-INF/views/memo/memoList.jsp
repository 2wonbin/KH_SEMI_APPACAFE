<%@page import="memo.model.vo.MemoVo"%>
<%@page import="member.model.vo.Member"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    List<MemoVo> list = (List<MemoVo>)request.getAttribute("list");
	
	
	Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<h1>하이</h1>


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
	            <tr class="listTr" role="button" onclick="moveDetailPage(<%=memo.getMemoNo() %>)">
	            	<td class="MemoNo"><%=memo.getMemoNo() %></td>
	            	<td><%=memo.getSenderNickname() %></td>
	            	<td><%=memo.getContent() %></td>
	            	<td><%=memo.getSendDate() %></td>
	            </tr>
	            <%} %>
	        </tbody>
	    </table>
	</div>
	
	<script>
	function moveDetailPage(memoNo) {
		location.href='<%= request.getContextPath() %>/memo/memoDetail?memoNo=' + memoNo;
	}	
	</script>
</body>
</html>