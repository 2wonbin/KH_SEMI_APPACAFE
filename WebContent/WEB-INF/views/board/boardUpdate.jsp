<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.*" %>
<%
	BoardVo board = (BoardVo)request.getAttribute("board");
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
<script>
$(document).ready(function(){
	CKEDITOR.replace('boardContent',{
		height : 400
		, enterMode: CKEDITOR.ENTER_BR
		, shiftEnterMode: CKEDITOR.ENTER_BR
		, fillEmptyBlocks: false
		, uploadUrl: "boardImageUpload"
		, filebrowserImageUploadUrl: "boardImageUpload"
		, filebrowserImageBrowseUrl: "boardImageBrowse"
		, removeButtons : 'Underline,Subscript,Superscript,Cut,Copy,Paste,PasteText,PasteFromWord,Redo,Undo,Scayt,Link,Unlink,Anchor,Table,HorizontalRule,SpecialChar,Maximize,Source,Bold,RemoveFormat,NumberedList,Outdent,Blockquote,Indent,BulletedList,Italic,Strike,About,Format,Styles'
		, removePlugins : 'elementspath'
		, resize_enabled : false
		, image_previewText : CKEDITOR.tools.repeat( ' ', 100 )
	});
		
	//글내용 넣기
	$('#boardTitle').val('<%=board.getBoardTitle()%>');
	CKEDITOR.instances.boardContent.setData('<%=board.getBoardContent() %>');
	
	
	//수정버튼
	$('#updateBtn').on('click', function(){
		if(!confirm("수정하시겠습니까?")){return;}
		
		$('#boardUpdateForm').submit();
	});
});
</script>


<%if(board.getBoardType().equals("free")) {%>
<h3 class="my-4">자유게시판 - 수정</h3>
<%}else if(board.getBoardType().equals("notice")) {%>
<h3 class="my-4">공지게시판 - 수정</h3>
<%} %>

<div class="row">
    <div class="col-md-12">
        <form action="boardUpdate" method="post" id="boardUpdateForm">
            <div class="form-group">
                <label for="subject">제목</label>
                <input type="text" class="form-control" id="boardTitle" name="boardTitle">
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea class="form-control" id="boardContent" name="boardContent"></textarea>
            </div>
            
            <input type="hidden" name="boardNo" value="<%=board.getBoardNo()%>">
            <input type="hidden" name="boardType" value="<%=board.getBoardType()%>">
            <input type="hidden" name="boardWriter" value="<%=board.getBoardWriter()%>">
        </form>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <a id="updateBtn" class="btn btn-primary btn-icon-split btn-lg float-right">
            <span class="icon text-white-50">
                <i class="fas fa-edit"></i>
            </span>
            <span class="text">수정</span>
        </a>
    </div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
