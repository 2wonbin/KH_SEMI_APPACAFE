<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>


<script type="text/javascript">
$(document).ready(function(){
	$('#writeBtn').on('click',function(){
		if(!confirm("저장하시겠습니까?")){return;}
		
		$('#boardWriteForm').submit();
	})	
})

</script>


<h3 class="my-4">게시판 - 글쓰기</h3>

<div class="row">
    <div class="col-md-12">
        <form action="boardWrite" method="post" id="boardWriteForm" enctype="multipart/form-data">
            <div class="form-group">
                <label for="subject">제목</label>
                <input type="text" class="form-control" id="boardTitle" name="boardTitle">
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea class="form-control" id="boardContent" name="boardContent" rows="20"></textarea>
            </div>
        </form>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <a id="writeBtn" class="btn btn-primary btn-icon-split btn-lg float-right">
            <span class="icon text-white-50">
                <i class="fas fa-save"></i>
            </span>
            <span class="text">저장</span>
        </a>
    </div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
