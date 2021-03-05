<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<Member> list = (List<Member>)request.getAttribute("list");
	System.out.println("gkgkgk");
	String searchType = request.getParameter("searchType");
	String searchKeyword = request.getParameter("searchKeyword");
%>
<style>
	div#search-container {margin:0 0 10px 0; padding:3px; background-color: rgba(0, 188, 212, 0.3);}
	div#search-memberId {display: <%= "member_Id".equals(searchType) || searchType == null ? "inline-block" : "none" %>;}
	div#search-member_Name{display:<%= "member_Name".equals(searchType) ? "inline-block" : "none" %>;}
</style>
<script>
/*
$(function(){
	
	
	$("#searchType").change(function(){
		var type = $(this).val();//memberId | memberName
		var $divSearchTypes = $(".search-type");
		
		$divSearchTypes
			.hide()
			.filter("#search-" + type)
			.css('display', 'inline-block');
	});
	
	$("#aaaa").click(function(){
		alert("aaaaaa");
	});
}	
*/
function updateRole() {
	var selectedd = document.getElementById("member-role");
	var selectVal = selectedd.options[selectedd.selectedIndex].value;
	document.getElementById("member_role").value = selectVal;
}
</script>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<section id="memberList-container">
	<h2>관리자 System</h2>
	<div id="search-container">
        검색타입 :
        <div id="search-memberId" class="search-type">
            <form action="<%=request.getContextPath()%>/admin/userInfoList">
                <select id="searchType" name = "searchType">
		            <option value="1" selected>아이디</option>		
		            <option value="2">회원명</option>
		        </select>
                <input 
                	type="text" name="searchKeyword"  size="25" 
                	placeholder="검색할 아이디를 입력하세요."
                	value="<%= "memberId".equals(searchType) ? searchKeyword : "" %>"/>
               	<input 
                	type="radio" name="radio" value="asc"> 오름차순
                <input 
                	type="radio" name="radio" value="desc"> 내림차순
                <button type="submit">검색</button>			
            </form>	
        </div>
    </div>
	<table id="tbl-member">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>회원유형</th>
				<th>회원등급</th>
				<th>생년월일</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>가입일</th>
				<th>수정</th>
			</tr>
		</thead>
		<tbody>
		<% if(list == null || list.isEmpty()) { %>
			<%--조회된 결과가 없는 경우 --%>
			<tr>
				<td colspan="10" style="text-align:center;">
					조회된 결과가 없습니다.
				</td>
			</tr>
		
		<% } else { 
			for(Member m : list) { %>
			<%--조회된 결과가 있는 경우 --%>
			<tr>
				<td><%= m.getMember_no() %></td>
				<td><%= m.getMember_Id() %></td>
				<td><%= m.getMember_Name() %></td>
				<td><%= m.getNickname() %></td>
				<td>
					<%-- data속성 : 태그에 data를 직접 저장/불러오기 가능 --%>
					<select id="member-role" class="member-role" data-member-id="<%= admin.getMember_role() %>" onchange="updateRole()">
						<option value="A" <%= "A".equals(m.getMember_role()) ? "selected" : "" %>>관리자</option>		
            			<option value="U" <%= "U".equals(m.getMember_role()) ? "selected" : "" %>>일반회원</option>
					</select>
				</td>
				<td><%= m.getMembergrade() %></td>
				<td><%= m.getSsn() %></td>
				<td><%= m.getEmail() != null ?  m.getEmail() : "" %></td>
				<td><%= m.getPhone() %></td>
				<td><%= m.getEnrollDate() %></td>
				<td>
					<form action="<%=request.getContextPath()%>/admin/updateUserRole">
						<input type = "hidden" id = "member_role" name = "member_role" value = <%= admin.getMember_role() %>>
						<input type = "hidden" id = "member-no" name = "member_no"   value = <%= admin.getMember_no() %>>
						<button type ="submit">수정</button>
					</form>
				</td>
			</tr>
		<% 	} 
		  } %>
			
		</tbody>
	</table>
	<div id="pageBar">
		<%= request.getAttribute("pageBar") %>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>