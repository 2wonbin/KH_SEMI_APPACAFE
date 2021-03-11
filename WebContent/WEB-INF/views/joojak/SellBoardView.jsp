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
	    position: relative;
	    left: 50%;
	    transform: translateX(-50%);
	}
	
	img{
		width:600px;
		height:480px;
	}
	
	.sellImage {
		width:100%;
		height:100%;
		background-position:center;
		background-repeat:no-repeat;
		background-size:contain;
	}
	
	#commentfrm{
	    position: relative;
    	left: 25%;
}
	}
	
	.comment-container {
	    width: 1024px;
	    height: 490px;
	    position: relative;
	    left: 50%;
	    transform: translateX(-50%);C
    }
    #btn-insert{
    position: absolute;
    top: 25%;
    margin-left: 1%;
    }
    
    /*댓글테이블*/
table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse; } 
table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
table#tbl-comment tr td:first-of-type {padding: 5px 5px 5px 50px;}
table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
table#tbl-comment button.btn-reply{display:none;}
table#tbl-comment tr:hover {background:lightgray;}
table#tbl-comment tr:hover button.btn-reply{display:inline-block;}
table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
table#tbl-comment sub.comment-date {color:tomato; font-size:10px}
table#tbl-comment tr.level2 {color:gray; font-size: 14px;}
table#tbl-comment tr.level2 td:first-of-type{padding-left:100px;}
table#tbl-comment tr.level2 sub.comment-writer {color:#8e8eff; font-size:14px}
table#tbl-comment tr.level2 sub.comment-date {color:#ff9c8a; font-size:10px}
/*답글관련*/
/* table#tbl-comment1 textarea{margin: 4px 0 0 0;}C
table#tbl-comment1 button.btn-insert2{width:60px; height:23px; color:white; background:#3300ff; position:relative; top:-5px; left:10px;}
/* 삭제버튼관련 */
table#tbl-comment1 button.btn-delete{background:red; color:white; display:none;}
table#tbl-comment1 tr:hover button.btn-delete{display:inline;}
    
</style>

       <h1 style="text-align:center; margin-top: 24px;"><%= b.getBoardTitle() %></h1>

 <table class="table table-light sell-board">
			 <tr>
				<td rowspan="6" style="width: 640px; height: 480px; ">
					<div style="background-image:url('<%= request.getContextPath() %>/img/<%=b.getBoardRenamedFileName() %>')" class="sellImage">
				</td>
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
    
    <% if (memberLoggedIn != null && b.getSeller().equals(memberLoggedIn.getNickName())) {%>
    <div>
    <input type="button" value="삭제하기" onclick="deleteBoard();"  class="btn btn-danger float-right"/>
    </div>
    <% } %> 
 
    <div class="comment-container">
        <div class="comment-editor">
            <form action="<%=request.getContextPath()%>/board/sellBoardCommentInsert" method="post" name="boardCommentFrm" id="commentfrm">
                <input type="hidden" name="boardRef" value="<%= board.getBoardNo() %>" />
                <input type="hidden" name="boardCommentWriter" value="<%= memberLoggedIn != null ? memberLoggedIn.getMemberId() : "" %>" />
                <input type="hidden" name="boardCommentLevel" value="1" />
                <input type="hidden" name="boardCommentRef" value="0" />    
				<textarea name="boardCommentContent" cols="60" rows="3" style="width: 50%;"></textarea>
                <button type="submit" id="btn-insert" class="btn btn-success">등록</button>
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
	                        <button class="btn-reply btn btn-primary" value="<%=bc.getSellBoardCommentNo()%>">답글</button>
	                        <% if(memberLoggedIn != null
	                        	&&(bc.getSellBoardCommentWriter().equals(memberLoggedIn.getMemberId())
	                        		//|| MemberService.ADMIN_MEMBER_ROLE.equals(memberLoggedIn.getMemberRole())
	                        		)
	                        		){ %>
	                        <%--댓글 작성자와 관리자권한이 있는 경우만 노출 --%>
	                        <button class="btn-delete btn btn-danger" value="<%= bc.getSellBoardCommentNo() %>">삭제</button>
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
	                        <button class="btn-delete btn btn-danger" value="<%= bc.getSellBoardCommentNo() %>">삭제</button>
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
		<script>
		function deleteBoard(){
			if(confirm("이 게시물을 삭제하시겠습니까?")){
				$("[name=boardDelFrm]").submit();
			}
		}
		$(function(){
			/**
			* 댓글 삭제 
			*/
			$(".btn-delete").click(function(){
				if(confirm('댓글을  삭제하시겠습니까?')){
					var boardCommentNo = $(this).val();
					location.href = "<%= request.getContextPath() %>/board/SellBoardCommentDelete?boardCommentNo=" + boardCommentNo +"&boardNo=<%= board.getBoardNo() %>"; 
				}
			});
			
			
			
			/**
			* 대댓글(답글) 버튼을 누르면 해당 tr바로 하위에 새로운 tr태그를 생성해 폼을 제공한다.
			*/
			$(".btn-reply").one('click', function(){
				<% if(memberLoggedIn == null) { %>
					<%--로그인 하지 않은 경우 --%>
					loginAlert();
				<% } else { %>
					<%--로그인한 경우 --%>
					var $this = $(this);//현재 클릭한 .btn-reply
					var html = '<tr>';
					html += '<td style="display:none; text-align:left" colspan="2">'; 
					html += '<form action="<%= request.getContextPath() %>/board/sellBoardCommentInsert" method="POST">';
					html += '<input type="hidden" name="boardRef" value="<%= board.getBoardNo() %>" />';
					html += '<input type="hidden" name="boardCommentWriter" value="<%= memberLoggedIn != null ? memberLoggedIn.getMemberId() : "" %>" />';
					html += '<input type="hidden" name="boardCommentLevel" value="2" />';
					html += '<input type="hidden" name="boardCommentRef" value="' + $this.val() + '" />';
					html += '<textarea name="boardCommentContent" cols="60" rows="2"></textarea>';
					html += '<button type="submit" class="btn-insert2">등록</button>';
					html += '</form>';
			        html += '</td>';
			        html += '</tr>';
			        
			        //기준 tr
			        var $trFromBtnReply = $this.parent().parent();
			        console.log(html);
			        //추가할 요소 기준
			        $(html).insertAfter($trFromBtnReply)
			        	   .find("td")
						   .slideDown(800)
						   .find("form")
						   .submit(function(e){
							   var $textarea = $(e.target).children('textarea');
							   if(/^(.|\n){1,}$/.test($textarea.val()) == false){
									alert("댓글 내용을 작성해주세요.");
									$textarea.focus();
									e.preventDefault();
								}
							   
						   });
					
				<% } %>
			});
			
			
			/**
			* 로그인 하지 않고 댓글을 작성할 수 없다.
			*/
			$("[name=boardCommentContent]").focus(function(){
				<%-- if(<%= memberLoggedIn == null %>)
					loginAlert(); --%>
				
				<% if(memberLoggedIn == null){%>
					loginAlert();
				<% } %>
			});
			
			/**
			* 폼 제출 유효성 검사
			* 1. return false;
			* 2. event.preventDefault();
			*/
			$("[name=boardCommentFrm]").submit(function(e){
				var $boardCommentContent = $("[name=boardCommentContent]");
				if(/^(.|\n){1,}$/.test($boardCommentContent.val()) == false){
					alert("댓글 내용을 작성해주세요.");
					$boardCommentContent.focus();
					e.preventDefault();
				}
			});
			
			
		});
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