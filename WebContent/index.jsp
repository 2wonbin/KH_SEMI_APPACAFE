<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-6">

			<!-- 메인 캐러셀 -->
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
			        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
			        <div class="carousel-item carousel-item-index active">
			            <img src="<%= request.getContextPath() %>/img/img01.jpg" class=" " alt="...">
			        </div>
			        <div class="carousel-item carousel-item-index">
			            <img src="<%= request.getContextPath() %>/img/img02.jpg" class=" " alt="...">
			        </div>
			        <div class="carousel-item carousel-item-index">
			            <img src="<%= request.getContextPath() %>/img/img03.jpg" class=" " alt="...">
			        </div>
			    </div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			        <span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			        <span class="carousel-control-next-icon" aria-hidden="true"></span>
			        <span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		
			<%-- 로그인메뉴 --%>
	
		
    </div>
</div>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>