<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.util.List" %>
<%@ page import="board.model.vo.BoardVo" %>
<%
    List<BoardVo> list = (List<BoardVo>)request.getAttribute("list");
%>


<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	$('.listTr').on('click', function(){
	    
	});
});
</script>
<style>
	body { text-align : center;}
</style>

<h3 class="my-4">게시판</h3>

<div class="row">
    <div class="col-md-12 py-4">
	    <!-- 테이블 -->
	    <table class="table table-hover">
	        <thead class="thead-dark">
	            <tr>
	                <th>글번호</th>                
	                <th>제목</th>                
	                <th>작성자</th>                
	                <th>작성일</th>                
	            </tr>
	        </thead>
	        <tbody>
	            <%for(BoardVo board:list){ %>
	            <tr class="listTr" role="button">
	            	<td><%=board.getBoardNo() %></td>
	            	<td><%=board.getBoardTitle() %></td>
	            	<td><%=board.getBoardWriter() %></td>
	            	<td><%=board.getBoardDate() %></td>
	            </tr>
	            <%} %>
	        </tbody>
	    </table>
	</div>
</div>
    
<div class="row">
    <div class="col-md-12">
    <% if(memberLoggedIn != null) {%>
	    <a href="boardWrite" id="writeBtn" class="btn btn-success btn-icon-split btn-lg float-right">
            <span class="icon text-white-50">
                <i class="fas fa-pen"></i>
            </span>
            <span class="text text-white">글쓰기</span>
        </a>
        <% } %>
    </div>
</div>
    
<%=request.getAttribute("pageBar") %>
    

<%@ include file="/WEB-INF/views/common/footer.jsp" %>