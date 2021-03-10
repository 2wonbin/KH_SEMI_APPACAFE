<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.util.List" %>
<%@ page import="board.model.vo.BoardVo" %>
<%
    List<BoardVo> list = (List<BoardVo>)request.getAttribute("list");
	String boardType = (String)request.getAttribute("boardType");
%>


<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	
	<% if(memberLoggedIn == null) { %>
		alert('로그인을 먼저 해주세요.');
		location.href="<%= request.getContextPath() %>";
	<% } else if("Y".equals(memberLoggedIn.getDelFlag())) { %>
	alert('이용이 제한된 회원입니다.');
	location.href="<%= request.getContextPath()%>/member/logout";
	<%}%>
	
	var boardType = '<%=boardType%>';
	
	$('.listTr').on('click', function(){
	    var boardNo = $(this).children('.boardNo').text();

		location.href = "boardDetail?boardType=" + boardType + "&boardNo=" + boardNo;
	});
	
	$('#writeBtn').on('click', function(){
		location.href = "boardWrite?boardType=" + boardType;
	});
	
});



</script>
<%if(boardType.equals("free")) {%>
<h3 class="my-4">자유게시판</h3>
<%}else if(boardType.equals("notice")) {%>
<h3 class="my-4">공지게시판</h3>
<%} %>

<div class="row">
    <div class="col-md-12 py-4">
	    <!-- 테이블 -->
	    <table class="table table-hover">
	        <thead>
	            <tr>
	                <th>제목</th>                
	                <th>작성자</th>                
	                <th>작성일</th>                
	                <th>조회수</th>                
	            </tr>
	        </thead>
	        <tbody>
	            <%for(BoardVo board:list){ %>
	            <tr class="listTr" role="button">
	            	<td class="boardNo" style="display: none;"><%=board.getBoardNo() %></td>
	            	<td><%=board.getBoardTitle() %></td>
	            	<td><span onclick="showMemoPopup(this, '<%=board.getBoardWriter() %>')"><%=board.getBoardWriter() %></span></td>
	            	<td><%=board.getBoardDate() %></td>
	            	<td><%=board.getBoardReadCount() %></td>
	            </tr>
	            <%} %>
	        </tbody>
	    </table>
	</div>
</div>
    
<div class="row">
    <div class="col-md-12">
    	<%if(boardType.equals("free")) {%>
	    <a id="writeBtn" class="btn btn-success btn-icon-split btn-lg float-right">
            <span class="icon text-white-50">
                <i class="fas fa-pen"></i>
            </span>
            <span class="text">글쓰기</span>
        </a>
		<%
		}else if(boardType.equals("notice") && memberLoggedIn != null) {
			if(memberLoggedIn.getMemberRole().equals("A")){
		%>
	    <a id="writeBtn" class="btn btn-success btn-icon-split btn-lg float-right">
            <span class="icon text-white-50">
                <i class="fas fa-pen"></i>
            </span>
            <span class="text text-white">글쓰기</span>
        </a>
		<%}}%>
    </div>
</div>
    
<%=request.getAttribute("pageBar") %>
    

<%@ include file="/WEB-INF/views/common/footer.jsp" %>