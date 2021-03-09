<%@page import="member.model.service.MemberService"%>
<%@page import="board.model.vo.SellBoardComment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.util.List" %>
<%@ page import="board.model.vo.SellBoard" %>
<%
	SellBoard b = (SellBoard)request.getAttribute("board");
	String systemFileName = b.getBoardRenamedFileName();
	String fullpath = "../../.."+request.getContextPath()+"/img/";
		   fullpath += systemFileName;
%>
<% 
	SellBoard board = (SellBoard)request.getAttribute("board");
	List<SellBoardComment> commentList = (List<SellBoardComment>)request.getAttribute("commentList");
%>


<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<style>

	section{

	}
	.sell-board{
	
	width:1024px;
	height : 490px;
	
	}
	
	img{
		width:600px;
		height:480px;
	}
</style>

       <h1 style="text-align:center; margin-top: 24px;"><%= b.getBoardTitle() %></h1>

 <table class="table table-light sell-board">
			 <tr>
				<td rowspan="6" style="width: 640px; height: 480px; "><img src="<%= request.getContextPath() %>/img/<%=b.getBoardRenamedFileName() %>" class=" " alt="..."></td>
			 </tr>
            <tr>
               <!--   <td>상품명</td> -->
                <td colspan="2"><p style="font-size: 3em; font-weight: 500;"><%=b.getProductName() %></p></td>
            </tr>
            <tr>
               <!--   <td>가격</td> -->
                <td colspan="2"><p style="font-size: 3.5em; font-weight : bold"><%=b.getPrice() %>원<p></td>
            </tr>

            <tr>
                <td style="width: 100px;"><span style="color: gray">판매자</span></td>
                <td><span style="font-size:2em;"><%=b.getSeller() %></span></td>
            </tr>
           
            <tr style="border-top: 2px solid lightgray;">
               <td rowspan="2" colspan="2" style="width: 400px;"><%=b.getBoardContent() %></td>
            </tr>
    </table>
    
    <div class="comment-container">
        <div class="comment-editor">
            <form action="<%=request.getContextPath()%>/board/sellBoardCommentInsert" method="post" name="boardCommentFrm">
                <input type="hidden" name="boardRef" value="<%= board.getBoardNo() %>" />
                <input type="hidden" name="boardCommentWriter" value="<%= memberLoggedIn != null ? memberLoggedIn.getMemberId() : "" %>" />
                <input type="hidden" name="boardCommentLevel" value="1" />
                <input type="hidden" name="boardCommentRef" value="0" />    
				<textarea name="boardCommentContent" cols="60" rows="3"></textarea>
                <button type="submit" id="btn-insert">등록</button>
            </form>
        </div>
		<!--table#tbl-comment-->
		
		<table id="tbl-comment">
		<%
	    if(commentList != null){
	        for(SellBoardComment bc : commentList){
	            if(bc.getSellBoardCommentLevel()==1){
	    %>
	                <tr class=level1>
	                    <td>
	                        <sub class=comment-writer><%=bc.getSellBoardCommentWriter() %></sub>
	                        <sub class=comment-date><%=bc.getSellBoardCommentDate()%></sub>
	                    	<br />
	                        <%=bc.getSellBoardCommentContent() %>
	                    </td>
	                    <td>
	                        <button class="btn-reply" value="<%=bc.getSellBoardCommentNo()%>">답글</button>
	                        <% if(memberLoggedIn != null
	                        	&&(bc.getSellBoardCommentWriter().equals(memberLoggedIn.getMemberId())
	                        		//|| MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole())
	                        		)
	                        		){ %>
	                        <%--댓글 작성자와 관리자권한이 있는 경우만 노출 --%>
	                        <button class="btn-delete" value="<%= bc.getSellBoardCommentNo() %>">삭제</button>
	                        <% }%>
	                    </td>
	                </tr>
	                
	                
	    <% 		} 
	            else { %>
	                <tr class=level2>
	                    <td>
	                        <sub class=comment-writer><%=bc.getSellBoardCommentWriter() %></sub>
	                        <sub class=comment-date><%=bc.getSellBoardCommentDate()%></sub>
	                    	<br />
	                        <%=bc.getSellBoardCommentContent() %>
	                    </td>
	                    <td>
	                        <% if(memberLoggedIn != null
	                        	&&(bc.getSellBoardCommentWriter().equals(memberLoggedIn.getMemberId())
	                        		//|| MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole())
	                        		)
	                        		){ %>
	                        <%--댓글 작성자와 관리자권한이 있는 경우만 노출 --%>
	                        <button class="btn-delete" value="<%= bc.getSellBoardCommentNo() %>">삭제</button>
	                        <% }%>
	                    </td>
	                </tr>
	
	    <%
	            }
	
	        }	
	    } 
	    %>
		</table>
		
		<!-- css필요 -->
		<input type="button" value="삭제하기" onclick="deleteBoard();" />
		<script>
		function deleteBoard(){
			if(confirm("이 게시물을 삭제하시겠습니까?")){
				$("[name=boardDelFrm]").submit();
			}
		}
		</script>
		<form 
			action="<%= request.getContextPath() %>/board/sellBoardDelete"
			method="POST"
			name="boardDelFrm">
			<input type="hidden" name="boardNo" value="<%= board.getBoardNo() %>"/>
			<input type="hidden" name="rName" value="<%= board.getBoardRenamedFileName() != null ? board.getBoardRenamedFileName() : "" %>" />
		</form>
		<!-- css필요 -->
				
	</div>

    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>