<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<!DOCTYPE html>
         <!-- 메인 캐러셀 -->
         <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="margin: auto; width: 60%;">
            <ol class="carousel-indicators">
                 <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                 <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                 <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                 <div class="carousel-item  active">
                     <img src="<%= request.getContextPath() %>/img/img01.jpg" class="d-block w-100" alt="...">
                     <div class="carousel-caption d-none d-md-block" style="background-color: rgba(0,0,0, 0.6);" >
				           <h2> 아빠카페에 오신 여러분 모두 환영합니다.</h2>
        			 </div>
               
           </div>
                 <div class="carousel-item ">
                     <img src="<%= request.getContextPath() %>/img/img02.jpg" class="d-block w-100" alt="...">
                      <div class="carousel-caption d-none d-md-block" style="background-color: rgba(0,0,0, 0.6);" >
				          <h2> 어디서 속시원하게 못하던 얘기들. </h2>
        			 </div>
                 </div>
                 <div class="carousel-item ">
                     <img src="<%= request.getContextPath() %>/img/img03.jpg" class="d-block w-100" alt="...">
                      <div class="carousel-caption d-none d-md-block" style="background-color: rgba(0,0,0, 0.6);" >
				          <h2> 나눌 수 있는 공간이 되길 희망합니다.</h2>
        			 </div>
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