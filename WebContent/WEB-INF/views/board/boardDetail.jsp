<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.List"%>
<%@ page import="board.model.vo.BoardVo"%>
<%@ page import="board.model.vo.BoardComment"%>
<% 
	BoardVo board = (BoardVo)request.getAttribute("board");
	List<BoardComment> commentList = (List<BoardComment>)request.getAttribute("commentList");
%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>


<script type="text/javascript">
$(document).ready(function(){
	
	$('#updateBtn').on('click', function(){
		if(!confirm("수정하시겠습니까?")){
			return;
		}
		location.href = "boardUpdate?boardType=<%=board.getBoardType()%>&boardNo=<%=board.getBoardNo()%>";
	});
	
	$('#deleteBtn').on('click', function(){
		if(!confirm("삭제하시겠습니까?")){
			return;
		}
		$('#boardDetailForm').attr('action','boardDelete');
		$('#boardDetailForm').submit();
	});
	
	$('#commentWriteBtn').on('click', function(){
		$('#commentForm').submit();
	});
	
	$('.reCommentShowBtn').on('click', function(){
		var commentNo = $(this).prev().val();
		$('.reCommentDiv').hide();
		$('.reCommentContent').val('');
		$('.reCommentDiv-'+commentNo).show();
	});
	
	$('.reCommentWriteBtn').on('click', function(){
		var commentNo = $(this).prev().val();
		var reCommentContent = $(this).parents('.reCommentDiv').find('.reCommentContent').val();
		
		console.log(reCommentContent);
		$('#boardCommentRef').val(commentNo);
		$('#boardReCommentContent').val(reCommentContent);
		$('#reCommentForm').submit();
	});
	
});
</script>

<div class="card mt-4">
	<div class="card-header">
		<h3><%=board.getBoardTitle()%></h3>
	</div>
	<div class="card-body">
		<%=board.getBoardContent()%>
	</div>
</div>

<div class="row py-2">
    <div class="col-md-12">
	    <a id="updateBtn" class="btn btn-info btn-icon-split btn-lg mr-1">
            <span class="icon text-white-50">
                <i class="fas fa-edit"></i>
            </span>
            <span class="text text-white">수정</span>
        </a>
        <a id="deleteBtn" class="btn btn-danger btn-icon-split btn-lg">
            <span class="icon text-white-50">
                <i class="fas fa-trash"></i>
            </span>
            <span class="text text-white">삭제</span>
        </a>
    </div>
</div>

<form method="post" id="boardDetailForm">
	<input type="hidden" name="boardNo" value="<%=board.getBoardNo()%>">
	<input type="hidden" name="boardType" value="<%=board.getBoardType()%>">
</form>
<%if(board.getBoardType().equals("free")) {%>
<div class="card">
	<div class="card-body">
		<div class="commentList">
			<%for(BoardComment bc:commentList) {%>
				<%if(bc.getBoardCommentLevel() == 1) {%>
					<div class="form-group row">
						<span class="col-sm-2 boardCommentWriter"><%=bc.getBoardCommentWriter() %></span>
						<span class="col-sm-8 boardCommentContent"><%=bc.getBoardCommentContent() %></span>
						<div class="col-sm-2 d-flex justify-content-end">
							<div>
								<input type="hidden" value="<%=bc.getBoardCommentNo()%>">
								<a class="btn btn-info btn-sm reCommentShowBtn">답글</a>
								<a class="btn btn-danger btn-sm commentDeleteBtn">삭제</a>
							</div>
						</div>
					</div>
					
					<div class="reCommentDiv reCommentDiv-<%=bc.getBoardCommentNo()%> row" style="display:none;">
						<div class="col-md-11">
							<textarea class="form-control reCommentContent" name="reCommentContent" rows="3"></textarea>			
						</div>
						<div class="col-md-1 d-flex justify-content-end">
							<div>
								<input type="hidden" value="<%=bc.getBoardCommentNo()%>">
								<a class="btn btn-success btn-sm reCommentWriteBtn">대댓글</a>
							</div>
						</div>
					</div>
					<hr/>
				<%} else { %>
					<div class="form-group row">
						<span class="col-sm-1"><i class="fas fa-reply fa-rotate-180"></i></span>
						<span class="col-sm-2 boardCommentWriter"><%=bc.getBoardCommentWriter() %></span>
						<span class="col-sm-8 boardCommentContent"><%=bc.getBoardCommentContent() %></span>
						<div class="col-sm-1 d-flex justify-content-end">
							<div>
								<input type="hidden" value="<%=bc.getBoardCommentNo()%>">
								<a class="btn btn-danger btn-sm commentDeleteBtn">삭제</a>
							</div>
						</div>
					</div>
					<hr/>
				<%}%>
			
			<%} %>
			<form action="boardCommentWrite" id="reCommentForm" method="post">
				<input type="hidden" name="boardCommentLevel" value="2">
				<input type="hidden" name="boardType" value="<%=board.getBoardType() %>">
				<input type="hidden" name="boardNo" value="<%=board.getBoardNo() %>">
				<input type="hidden" name="boardCommentRef" id="boardCommentRef" value="">
				<input type="hidden" name="boardCommentContent" id="boardReCommentContent" value="">
			</form>
		</div>
		<div class="commentWrite">
			<form action="boardCommentWrite" id="commentForm" method="post">
				<input type="hidden" name="boardCommentLevel" value="1">
				<input type="hidden" name="boardType" value="<%=board.getBoardType() %>">
				<input type="hidden" name="boardNo" value="<%=board.getBoardNo() %>">
				<div class="form-group row">
					<div class="col-md-11">
						<textarea class="form-control" id="boardCommentContent" name="boardCommentContent" rows="3"></textarea>			
					</div>
					<div class="col-md-1 d-flex justify-content-end">
						<div>
							<a class="btn btn-success btn-lg" id="commentWriteBtn">댓글</a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<%}%>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>