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
	div#search-container {margin:0 ; padding:3px;  background-color:darkgray;}
	div#search-container1 {margin:10 0 0 0; padding:3px;  background-color:darkgray;}
	#title1{display: inline;}
	#title2{display: inline;}
	div#search-member_Name {display:<%= "member_Name".equals(searchType)  %>;}
		/*관리자 페이지 : 회원관리 */
	section#memberList-container {text-align:center;}
	section#memberList-container table#tbl-member {width:100%; border:1px solid gray; border-collapse:collapse; font-size:12px;}
	section#memberstop {text-align:center;}
	section#memberstop table#tbl-member1 {width:100%; border:1px solid gray; border-collapse:collapse; font-size:12px;}
	
	#tbl-member td{
	font-size: 1.5em;
	font-weight: bold;
	}
	#tbl-member1 td{
	font-size: 1.5em;
	font-weight: bold;
	}
	
</style>
<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap.css">
<script>

function updateRole() {
}

$(document).ready(function(){
	
	$("#tbl-member tr").click(function() {
		var td = $(this).children();
		
		var rowIdData    = td.eq(1).text(); 
		var rowAuthData  = td.eq(4).find("option:selected").val();
		var rowDelYNData = td.eq(9).find("option:selected").val();
	});

	$(".updateInfo").click(function() {
		var checkBtn = $(this); //object
		var tr = checkBtn.parent().parent(); //tr
		var td = tr.children(); //tr ele
		
		var rowIdData    = td.eq(1).text();  //id
		var rowAuthData  = td.eq(4).find("option:selected").val(); // auth
		var rowDelYNData = td.eq(9).find("option:selected").val(); // del flag
		goPost(rowIdData, rowAuthData, rowDelYNData);
	});
});
function goPost(id, auth, delYn) {  //함수를(아이디,회원유형,정지여부 ) 보낸다 
	var form = document.createElement("form"); //form 선언과 동시 만든다(document.createElement).
	form.setAttribute("charset", "UTF-8");//form안에 속성값을 집어넣는다. 
	form.setAttribute("method", "POST");
	form.setAttribute("action", "<%=request.getContextPath()%>/admin/updateUserRole"); 
	
	var hiddenField1 = document.createElement("input"); 
	hiddenField1.setAttribute("type", "hidden");
	hiddenField1.setAttribute("name", "memberId1");
	hiddenField1.setAttribute("value", id);
	
	var hiddenField2 = document.createElement("input");
	hiddenField2.setAttribute("type", "hidden");
	hiddenField2.setAttribute("name", "memberRole1");
	hiddenField2.setAttribute("value", auth);
	
	var hiddenField3 = document.createElement("input");
	hiddenField3.setAttribute("type", "hidden");
	hiddenField3.setAttribute("name", "delFlag1");
	hiddenField3.setAttribute("value", delYn);
	
	form.appendChild(hiddenField1); //hiddenField를 form안에 자식요소 로 추가한다.
	form.appendChild(hiddenField2);
	form.appendChild(hiddenField3);
	var section = document.querySelector("section"); //세션에 반환하는 부분을 세션이라고 정의한다
	section.appendChild(form);//form을  세션 안에 자식요소로  넣는다
	form.submit(); //submit을 눌럿을때 for의 대한 반응이 일어난다.(세션부)
}
</script>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<section id="memberList-container">
	<h2 style="margin: 24px 0;" >관리자 System</h2>
	<div id="search-container">
        <div id="search-memberId" class="search-type" >
            <form action="<%=request.getContextPath()%>/admin/userInfoList">
            	<p id = "title1"> 검색타입 : </p>
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
                <button class = "updateUserInfo" type="submit">검색</button>			
            </form>	
        </div>
    </div>
	<table id="tbl-member" onclick="">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>회원유형</th>
				<th>생년월일</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>가입일</th>
				<th>정지여부</th>
				<th>정지일</th>
				<th>수정</th>
			</tr>
		</thead>
		<tbody>
		<% if(list == null || list.isEmpty()) { %>
			<%--조회된 결과가 없는 경우 --%>
			<tr>
				<td colspan="12" style="text-align:center;">
					조회된 결과가 없습니다.
				</td>
			</tr>
		<% } else {
			for(adminVo admin : list) { 
				if(admin.getDelFlag().equals("N")) { %>
			<%--조회된 결과가 있는 경우 --%>
			<tr>
				<td><%= admin.getMember_no() %></td>
				<td><%= admin.getMemberId() %></td>
				<td><%= admin.getMemberName() %></td>
				<td><%= admin.getNickName() %></td>
				<td>
					<%-- data속성 : 태그에 data를 직접 저장/불러오기 가능 --%>
					<select id="member-role" class="member-role" data-member-id="<%= admin.getMemberRole() %>" onchange="updateRole()">
						<option value="A" <%= "A".equals(admin.getMemberRole()) ? "selected" : "" %>>관리자</option>		
            			<option value="U" <%= "U".equals(admin.getMemberRole()) ? "selected" : "" %>>일반회원</option>
					</select>
				</td>
				<td><%= admin.getSsn() %></td>
				<td><%= admin.getEmail() != null ? admin.getEmail() : "" %></td>
				<td><%= admin.getPhone() %></td>
				<td><%= admin.getEnrollDate() %></td>
				<td>
					<select id="del-flag" class="del-flag" data-member-id="<%= admin.getDelFlag() %>" onchange="updateRole()">
						<option value="N" <%= "N".equals(admin.getDelFlag()) ? "selected" : "" %>>정상</option>		
            			<option value="Y" <%= "Y".equals(admin.getDelFlag()) ? "selected" : "" %>>정지</option>
					</select>
				</td>
				<td><%= admin.getDelDate() == (null) ? "" : admin.getDelDate()%></td>
				<td>
						<!-- 	<form class = "updateInfo" action="<%=request.getContextPath()%>/admin/updateUserRole"> -->
					<input class = "updateInfo btn btn-primary" type ="button" value = "수정">
				</td>
			</tr>
		<% 	  }
			} 
		  } %>
		</tbody>
	</table>
	<input type = "hidden" id = "memberRole" name = "memberRole">
	<input type = "hidden" id = "memberId" name = "memberId">
	<input type = "hidden" id = "delFlag" name = "delFlag">
	<div id="pageBar">
	</div>
</section>

<section id =memberstop>
	<div id="search-container1">
        <div id="search-memberId" class="search-type" >
            <form action="<%=request.getContextPath()%>/admin/userInfoList">
            	<p id = "title2"> 정지회원 목록 </p>
            </form>	
        </div>
    </div>
	<table id="tbl-member1" onclick="">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>회원유형</th>
				<th>생년월일</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>가입일</th>
				<th>정지여부</th>
				<th>정지일</th>
				<th>수정</th>
			</tr>
		</thead>
		<tbody>
		<% if(list == null || list.isEmpty()) { %>
			<%--조회된 결과가 없는 경우 --%>
			<tr>
				<td colspan="12" style="text-align:center;">
					조회된 결과가 없습니다.
				</td>
			</tr>
		<% } else { 
			for(adminVo admin : list) { 
				if(admin.getDelFlag().equals("Y")) {%>
			<%--조회된 결과가 있는 경우 --%>
			<tr>
				<td><%= admin.getMember_no() %></td>
				<td><%= admin.getMemberId() %></td>
				<td><%= admin.getMemberName() %></td>
				<td><%= admin.getNickName() %></td>
				<td>
					<%-- data속성 : 태그에 data를 직접 저장/불러오기 가능 --%>
					<select id="member-role" class="member-role" data-member-id="<%= admin.getMemberRole() %>" onchange="updateRole()">
						<option value="A" <%= "A".equals(admin.getMemberRole()) ? "selected" : "" %>>관리자</option>		
            			<option value="U" <%= "U".equals(admin.getMemberRole()) ? "selected" : "" %>>일반회원</option>
					</select>
				</td>
				<td><%= admin.getSsn() %></td>
				<td><%= admin.getEmail() != null ?  admin.getEmail() : "" %></td>
				<td><%= admin.getPhone() %></td>
				<td><%= admin.getEnrollDate() %></td>
				<td>
					<select id="del-flag" class="del-flag" data-member-id="<%= admin.getDelFlag() %>" onchange="updateRole()">
						<option value="N" <%= "N".equals(admin.getDelFlag()) ? "selected" : "" %>>정상</option>		
            			<option value="Y" <%= "Y".equals(admin.getDelFlag()) ? "selected" : "" %>>정지</option>
					</select>
				</td>
				<td><%= admin.getDelDate() == (null) ? "" : admin.getDelDate()%></td>
				<td>
						<!-- 	<form class = "updateInfo" action="<%=request.getContextPath()%>/admin/updateUserRole"> -->
					<input class = "updateInfo btn btn-primary" type ="button" value = "수정" >
				</td>
			</tr>
		<% 	  }
			} 
		  } %>
			
		</tbody>
	</table>
	<input type = "hidden" id = "memberRole" name = "memberRole">
	<input type = "hidden" id = "memberId" name = "memberId">
	<input type = "hidden" id = "delFlag" name = "delFlag">
	<div id="pageBar">
	</div>
	

</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>