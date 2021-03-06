<%@page import="member.model.vo.Member"%>
<%@page import="member.controller.memberLogin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Member member1 = (Member)session.getAttribute("memberLoggedIn"); 
%>
<!DOCTYPE html>
<style>
.nav-link{
	font-size: 30px;
	border-bottom : 1px solid red;
}
</style>
	<div class="container-fluid">
	    <div class="row flex-nowrap">
	        <nav class="d-md-block bg-white sidebar border-right">
	            <div class="sidebar-sticky pt-3 ">
	                <ul class="nav flex-column ">
	                    <li class="nav-item">
	                        <a class="nav-link active" href="<%= request.getContextPath()%>/board">
	                           <span>게시판</span>
	                        </a>
	                        <a class="nav-link" href="#">
	                           <span>null</span>
	                        </a>
	                        <a class="nav-link" href="#">
	                           <span>null</span>
	                        </a>
	                        <a class="nav-link" href="#">
	                           <span>null</span>
	                        </a>
	                        
	                        <% if(member1 != null && "A".equals(member1.getMemberRole())) { %>
	                        <a class="nav-link" href="<%= request.getContextPath()%>/admin/memberlist">
	                           <span>관리자페이지</span>
	                        </a>
	                        <% } %>
	                    </li>
	                </ul>
	            </div>
	        </nav>
	        <div class="main-content">
        
