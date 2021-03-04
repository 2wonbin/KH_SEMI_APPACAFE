<%@page import="member.model.service.MemberService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Member> list = (List<Member>)request.getAttribute("list");   
	String searchType = (String)request.getAttribute("searchType");
	String searchKeyword = (String)request.getAttribute("searchKeyword");
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<!-- 관리자용 admin.css link -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css" />
<style>
    div#search-container {margin:0 0 10px 0; padding:3px; background-color: rgba(0, 188, 212, 0.3);}
    div#search-memberId {display: <%= "member_id".equals(searchType) || searchType == null ? "inline-block" : "none" %>;}
    div#search-memberName{display: <%= "member_name".equals(searchType) ? "inline-block" : "none" %>;}
    div#search-gender{display: <%= "gender".equals(searchType) ? "inline-block" : "none" %>;}
</style>
<script>
$(function(){
	/**
	검색 타입 변경 이벤트 핸들러
	*/	
	$("#searchType").change(function(){
		var type = $(this).val();	//memberId | memberName | gender
		var $divSearchTypes = $(".search-type");
		$divSearchTypes
			.hide() //hide() : 해당 객체의 display 속성을 none으로 바꾼다.
			.filter("#search-" + type)		// filter() : 인자로 오는 속성들만 반환
			.css('display','inline-block');	// block 속성의 div의 속성을 inline-block으로 변화시켜 같은 라인에 놓이게 함
			
		
	});
		
	
	
	
	
	
	
	//회원권한 변경 이벤트 핸들러
	$("select.member-role").change(function(){
		var memberRole = $(this).val();
		var memberId = $(this).data("member-id");
		//console.log(memberId, memberRole);
		
		var bool = confirm("[" + memberId + "]회원의 권한을 [" + (memberRole == "U" ? "일반" : "관리자") + "](으)로 변경하시겠습니까?)");
		if(!bool)
			return;
		
		//GET: 요청 처리 이후 DB에 변경 내역이 없는 경우 ex) 		 조회 | 검색
		//POST : 요청 처리 이후 DB에 변경 내역이 있는 경우 ex) 	 추가 | 수정 | 삭제  + 로그인
		//  ㄴ> form으로 제출하는 방법밖에 없다.
		
		var $frm = $("#memberRoleUpdateFrm");
		$frm.find("[name=memberId]").val(memberId);		// name이 memberId인 요소를 찾아서 그 값에 memberId를 대입한다.
		$frm.find("[name=memberRole").val(memberRole);	// name이 memberRole인 요소를 찾아서 그 값에 memberRole를 대입한다.
		$frm.submit();
	});
	
	
});

</script>
<form
	action="<%= request.getContextPath() %>/admin/updateMemberRole"
	id="memberRoleUpdateFrm"
	method="POST">
	<input type="hidden" name="memberId" />
	<input type="hidden" name="memberRole" />
</form>
<section id="memberList-container">
	<h2>회원관리</h2>
	<div id="search-container">
        검색타입 : 
        <select id="searchType">
            <option value="memberId" <%= "member_id".equals(searchType)? "selected" : "" %>>아이디</option>		
            <option value="memberName" <%= "member_name".equals(searchType)? "selected" : "" %>>회원명</option>
            <option value="gender" <%= "gender".equals(searchType)? "selected" : "" %>>성별</option>
        </select>
        <div id="search-memberId" class="search-type">
            <form action="<%=request.getContextPath()%>/admin/memberFinder">
                <input type="hidden" name="searchType" value="memberId"/>
                <input type="text" name="searchKeyword"  size="25" placeholder="검색할 아이디를 입력하세요." value="<%= "member_id".equals(searchType) ? searchKeyword : "" %>"/>
                <button type="submit">검색</button>			
            </form>	
        </div>
        <div id="search-memberName" class="search-type">
            <form action="<%=request.getContextPath()%>/admin/memberFinder">
                <input type="hidden" name="searchType" value="memberName"/>
                <input type="text" name="searchKeyword" size="25" placeholder="검색할 이름을 입력하세요." value="<%= "member_name".equals(searchType) ? searchKeyword : "" %>"/>
                <button type="submit">검색</button>			
            </form>	
        </div>
        <div id="search-gender" class="search-type">
            <form action="<%=request.getContextPath()%>/admin/memberFinder">
                <input type="hidden" name="searchType" value="gender"/>
                <input type="radio" name="searchKeyword" value="M" <%= "gender".equals(searchType) && "M".equals(searchKeyword)? "checked" : "" %>> 남
                <input type="radio" name="searchKeyword" value="F" <%= "gender".equals(searchType) && "F".equals(searchKeyword)? "checked" : "" %>> 여
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
				<th>회원권한</th>
				<th>회원등급</th>
				<th>닉네임</th>
				<th>주민번호</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>탈퇴유무</th>
				<th>탈퇴일자</th>
			</tr>
		</thead>
		<tbody>
		<%if(list == null || list.isEmpty()) { %>
			<%-- 조회된 결과가 없는 경우 --%>
			<tr>
				<td colspan="10" style="text-align:center;">
					조회된 결과가 없습니다.
				</td>
			</tr>
		<% } else { 
			for( Member m : list) {		%>
			<%-- 조회된 결과가 있는 경우 --%>
				<tr>
					<td><%= m.getMemberNo() %></td>
					<td><%= m.getMemberId() %></td>
					<td><%= m.getMemberName() %></td>
					<td>
					<!-- data속성 : 태그에 data를 직접 저장 / 불러오기 가능(key="value"로 저장) -->
					<select class="member-role" data-member-id="<%= m.getMemberId() %>">
						<option value="<%= MemberService.USER_MEMBER_ROLE %>" <%=MemberService.USER_MEMBER_ROLE.equals(m.getMemberRole())?"selected":""  %>>일반</option>
						<option value="<%= MemberService.ADMIN_MEMBER_ROLE %>" <%=MemberService.ADMIN_MEMBER_ROLE.equals(m.getMemberRole())?"selected":""  %>>관리자</option>
					</select>
					</td>
					<td>
						<select class="member-grade" data-member-no="<%= m.getMemberNo()%> ">
							<option value="grade-platinum">플래티넘</option>
							<option value="grade-gold">골드</option>
							<option value="grade-silver">실버</option>
							<option value="grade-bronze">브론즈</option>
							<option value="grade-banned">정지</option>
						</select>
					</td>
					<td><%= m.getNickName() != null? m.getNickName() :"" %></td>
					<td><%= m.getSsn() %></td>
					<td><%= m.getEmail() != null? m.getEmail() :""%></td>
					<td><%= m.getPhone() %></td>
					<td><%= m.getAddress() != null? m.getAddress() :""%></td>
					<td><%= m.getEnrollDate() %></td>
					<td><%= m.getDelFlag() %></td>
					<td><%= m.getDelDate() %></td>
				</tr>
			<% } %>
		<% } %>
		</tbody>
	</table>
	<div id="pageBar"><%= request.getAttribute("pageBar") %></div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>