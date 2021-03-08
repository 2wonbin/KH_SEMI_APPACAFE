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


<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<style>

	section{

	}
	table{
	display:inline-block;
	width:1024px;
	height : 490px;
	
	}
	
	img{
		width:600px;
		height:480px;
	}
</style>

       <h1 style="text-align:center; margin-top: 24px;"><%= b.getBoardTitle() %></h1>

 <table class="table table-light">
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

    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>