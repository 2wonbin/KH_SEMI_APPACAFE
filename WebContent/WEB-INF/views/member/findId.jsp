<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	String msg = String.valueOf(request.getAttribute("msg"));
	System.out.println(msg);
	if(msg != null) request.removeAttribute("msg");
--%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	sup{
	color : red;
	}
	form{
		text-align: center;
	}
	table{
	font-size: 1.5em;
	
	}
	#title {
	
	font-style: bold;
	font-size : 2.5em;
	}
</style>
</head>
<body>
<h1 style="text-align:center; margin:24px 0;"">아이디 찾기</h1>
<br>

	<form 
	name="findIdFrm"
	action=""
	method="POST">
		<table class="table table-light">
			<tr>
				<th>
					이름<sup>*</sup>
				</th>
				<td>
					<input type="text" placeholder="이름을 입력해주세요." name="inputName" id="inputName" />
				</td>
			</tr>
			<tr>
				<th>
					주민번호<sup>*</sup>
				</th>
				<td>
					<input type="text" placeholder="주민번호를 입력해주세요." name="inputSsn" id="inputSsn" />
				</td>
			</tr>
		</table>
		<input type="submit" value="아이디찾기" class="btn btn-primary btn-lg"/>
	</form>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>