<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>

<% String boardType = (String)request.getAttribute("boardType"); %>
<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var boardType = '<%=boardType%>';
	console.log(boardType);
	
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
	
	$('#writeBtn').on('click',function(){
		if(!confirm("저장하시겠습니까?")){return;}
		
		$('#boardWriteForm').attr('action', 'boardWrite?boardType=' + boardType);
		$('#boardWriteForm').submit();
	})	
})

</script>

<%if(boardType.equals("free")) {%>
<h3 class="my-4">자유게시판 - 글쓰기</h3>
<%}else if(boardType.equals("notice")) {%>
<h3 class="my-4">공지게시판 - 글쓰기</h3>
<%} %>

<div class="row">
    <div class="col-md-12">
        <form action="" method="post" id="boardWriteForm">
            <div class="form-group">
                <label for="subject">제목</label>
                <input type="text" class="form-control" id="boardTitle" name="boardTitle">
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea class="form-control" id="boardContent" name="boardContent"></textarea>
            </div>
            <input type="hidden" name="boardType" value="<%=boardType%>"/>
        </form>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <a id="writeBtn" class="btn btn-primary btn-icon-split btn-lg float-right">
            <span class="icon text-white-50">
                <i class="fas fa-save"></i>
            </span>
            <span class="text text-white">저장</span>
        </a>
    </div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
