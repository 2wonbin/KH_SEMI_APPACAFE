<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="admin.model.vo.adminVo" %>
<%
	List<adminVo> list = (List<adminVo>)request.getAttribute("list");
	String searchType = request.getParameter("searchType");
	String searchKeyword = request.getParameter("searchKeyword");
%>
<style>
	section {text-align : center;}
	div#search-container {margin:0 0 10px 0; padding:3px; background-color: rgba(0, 0, 0, 0.8); color: white;}
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
	var roleSelectedObject = document.getElementById("member-role");
	var selectVal = roleSelectedObject.options[roleSelectedObject.selectedIndex].value;
	document.getElementById("member_role").value = selectVal;
	
	var delFlagSelectedObject = document.getElementById("del-flag");
	var delFlagSelectVal = delFlagSelectedObject.options[delFlagSelectedObject.selectedIndex].value;
	document.getElementById("del_flag").value = delFlagSelectVal;
	
	alert("delFlagSelectVal : " + delFlagSelectVal);
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
	<table id="tbl-member" class="table table-light">
		<thead class="thead-dark">
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
				<th>탈퇴여부</th>
				<th>탈퇴일</th>
				<th>수정</th>
			</tr>
		</thead>
		<tbody>
		<% if(list == null || list.isEmpty()) { %>
			<%--조회된 결과가 없는 경우 --%>
			<tr>
				<td colspan="10" style="text-align:center; transform: translateX(15%);">
					조회된 결과가 없습니다.
				</td>
			</tr>
		
		<% } else { 
			for(adminVo admin : list) { %>
			<%--조회된 결과가 있는 경우 --%>
			<tr>
				<td><%= admin.getMember_no() %></td>
				<td><%= admin.getMember_Id() %></td>
				<td><%= admin.getMember_Name() %></td>
				<td><%= admin.getNickname() %></td>
				<td>
					<%-- data속성 : 태그에 data를 직접 저장/불러오기 가능 --%>
					<select id="member-role" class="member-role" data-member-id="<%= admin.getMember_role() %>" onchange="updateRole()">
						<option value="A" <%= "A".equals(admin.getMember_role()) ? "selected" : "" %>>관리자</option>		
            			<option value="U" <%= "U".equals(admin.getMember_role()) ? "selected" : "" %>>일반회원</option>
					</select>
				</td>
				<td><%= admin.getMember_grade() %></td>
				<td><%= admin.getSsn() %></td>
				<td><%= admin.getEmail() != null ?  admin.getEmail() : "" %></td>
				<td><%= admin.getPhone() %></td>
				<td><%= admin.getEnroll_Date() %></td>
				<td>
					<select id="del-flag" class="del-flag" data-member-id="<%= admin.getDelFlag() %>" onchange="updateRole()">
						<option value="N" <%= "N".equals(admin.getDelFlag()) ? "selected" : "" %>>부</option>		
            			<option value="Y" <%= "Y".equals(admin.getDelFlag()) ? "selected" : "" %>>여</option>
					</select>
				</td>
				<td><%= admin.getDelDate() == (null) ? "" : admin.getDelDate()%></td>
				<td>
					<form action="<%=request.getContextPath()%>/admin/updateUserRole">
						<input type = "hidden" id = "member_role" name = "member_role" 	value = <%= admin.getMember_role() 	%>>
						<input type = "hidden" id = "member-no" name = "member_no"   	value = <%= admin.getMember_no() 	%>>
						<input type = "hidden" id = "del_flag" name = "del_flag"		value = <%=admin.getDelFlag() 		%>>
						<button type ="submit" class=" btn btn-primary">수정</button>
					</form>
				</td>
			</tr>
		<% 	} 
		  } %>
			
		</tbody>
	</table>
	<%--
	<div id="pageBar">
		<%= request.getAttribute("pageBar") %>
	</div>
	
	 --%>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>