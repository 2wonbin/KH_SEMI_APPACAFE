<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.util.List" %>
<%@ page import="board.model.vo.SellBoard" %>
<%
    List<SellBoard> list = (List<SellBoard>)request.getAttribute("list");
%>


<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	$('.listTr').on('click', function(){
	    location.href = '<%= request.getContextPath() %>/sellBoardView'+'?boardNo='+ $(this).data("href");
	});
});
</script>
<style>
	
</style>
<section>
<h3 class="my-4">중고거래 게시판</h3>

<div class="row">
    <div class="col-md-12 py-4">
	    <!-- 테이블 -->
	    <table class="table table-hover">
	        <thead class="thead-dark">
	            <tr>
	                <th>글번호</th>                
	                <th>제목</th>                
	                <th>판매자</th>                
	                <th>작성일</th>                
	            </tr>
	        </thead>
	        <tbody>
	            <%for(SellBoard sellBoard:list){ %>
	            <tr class="listTr" role="button" data-href='<%=sellBoard.getBoardNo()%>'>
	            	<td><%=sellBoard.getBoardNo() %></td>	
	            	<td><%=sellBoard.getBoardTitle() %></td>
	            	<td><%=sellBoard.getSeller() %></td>
	            	<td><%=sellBoard.getBoardDate() %></td>
	            </tr>  
	            <%} %>
	        </tbody>
	    </table>
	</div>
</div>
    
<div class="row">
    <div class="col-md-12">
<!--   맴버조건 임시로 지워놈 -->
	    <% if (memberLoggedIn != null) { %>
	    <a href="<%=request.getContextPath()%>/sellBoard" id="writeBtn" class="btn btn-success btn-icon-split btn-lg float-right">
            <span class="icon text-white-50">
                <i class="fas fa-pen"></i>
            </span>
            <span class="text text-white">글쓰기</span>
        </a>
		<% } %>
  <!-- 맴버조건 -->
    </div>
</div>
    
<%=request.getAttribute("pageBar") %>
</section>
    

<%@ include file="/WEB-INF/views/common/footer.jsp" %>