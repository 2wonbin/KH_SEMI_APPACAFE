<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	String msg = String.valueOf(request.getAttribute("msg"));
// 	System.out.println(msg);
	if(msg != null) request.removeAttribute("msg");
--%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	<% if(msg != null) { %> alert("<%= msg %>"); <% } %>
</script>
<style>
	sup{
	color : red;
	}
	form{
		text-align:center;
	}
	table{
	font-size: 1.5em;
	}
</style>
</head>
<body>
<h1 style="text-align:center; margin:24px 0;">비밀번호찾기</h1>
	<form 
	name="findPasswordFrm"
	action=""
	method="POST"
	>
		<table class="table table-light">
			<tr>
				<th>
					아이디<sup>*</sup>
				</th>
				<td>
					<input type="text" placeholder="아이디를 입력해주세요." name="memberId" id="memberId" />
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
			<tr>
				<th>
					비밀번호 찾기 질문<sup>*</sup>
				</th>
			</tr>
			<tr>
				<th>
					내 배우자 이름은?
				</th>
				<td>
					<input type="text" placeholder="질문에 대한 답변을 입력하세요." name="answer" id="answer" />
				</td>
			</tr>
		</table>
		<input type="submit" class="btn btn-primary btn-lg" value="비밀번호 찾기" />
	</form>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>