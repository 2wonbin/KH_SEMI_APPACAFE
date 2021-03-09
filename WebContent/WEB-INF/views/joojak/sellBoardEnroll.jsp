<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<style>
	table {
		border: collapse;
	}
</style>

    <script>
        $(function(){
            $("[name=boardEnrollFrm]").submit(boardValidate);
        });
        
        /**
        * boardEnrollFrm 유효성 검사
        * 미완
        */
    
        
        function previewFile() {
            var preview = document.querySelector('img');
            var file    = document.querySelector('input[type=file]').files[0];
            var reader  = new FileReader();
        
            reader.addEventListener("load", function () {
                preview.src = reader.result;
                console.log(preview.src)
            }, false);
        
            if (file) {
                reader.readAsDataURL(file);
            }
            }
        
        </script>
        <section id="board-container" style="text-align: center;">
        <h2>게시판 작성</h2>
        <form method="post" enctype="multipart/form-data" 
        action="<%=request.getContextPath() %>/sellBoardEnroll">
            <!-- 파일업로드가 포함된 폼 전송시 필수 속성  enctype="multipart/form-data" -->
            <table id="tbl-board-view" class="table table-borderless">
            <tr>
                <th>제 목</th>
                <td><input type="text" name="boardTitle" required></td>
            </tr>
            <tr>
                <th>상품명</th>
                <td><input type="text" name="productName" required></td>
            </tr>
			<tr>
                <td><input type="hidden" name="seller" value="<%= memberLoggedIn.getNickName()%>"required></td>
            </tr>
            <tr>
                <th>상품 이미지</th>
                <td>			
                    <input type="file" name="filename" onchange="previewFile()"><br>
                       <img src="" height="200" alt="상품이미지 미리보기">	
                </td>
            </tr>
            <tr>
                <th>가격</th>
                <td><input type="text" name="price" required></td>
            </tr>
            <tr>
                <th>제품 설명</th>
                <td><textarea rows="5" cols="40" name="boardContent"></textarea></td>
            </tr>
            <tr>
                <th colspan="2">
                    <input type="submit" value="등록하기" class="btn btn-success">
                </th>
            </tr>
        </table>
        </form>
        </section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>






