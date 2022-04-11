<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<style>
.image-cine .horizontal-area{
   margin:2px;
   padding:20px;
   width:180px;
   height:370px;
   float:left;
   overflow:hidden;
}
.image-cine .horizontal-area img{
   width:175px;
   height:250px;
}
.image-cine .horizontal-area span{
   padding:15px 26px;
   margin:5px;
}
.image-cine .float-clear{
   clear:both;
}
.image-cine .horizontal-area .movie_pg img{
	width: 20px;
	height:20px;
}
</style> 
<div class="page-main">
   <h2>검색 결과 ${keyword}입니다</h2>
   <span>총${count}건</span>
   <hr>
   <c:if test="${count == 0}">
   <div class="result-display">검색 결과가 없습니다.</div>
   </c:if>
   <c:if test="${count > 0}">

		<div class="image-cine" style="margin: 10px auto; padding: 100px 0px 0px 40px;">
      <c:forEach var="rearchResult" items="${list}" end="29" varStatus="status">
      <div class="horizontal-area">	
         <img src="imageView.do?movie_num=${rearchResult.movie_num}">
         
         <div class="movie-pg">
         	<strong class="movie_pg">
		 	<c:choose>
				<c:when test="${12 <= rearchResult.movie_pg && rearchResult.movie_pg < 15}">
					<img
						src="https://img.cgv.co.kr/R2014/images/common/flag/age/grade-12.png" class="pg-img">
				</c:when>
				<c:when test="${15 <= rearchResult.movie_pg && rearchResult.movie_pg < 19}">
					<img
						src="https://img.cgv.co.kr/R2014/images/common/flag/age/grade-15.png">
				</c:when>
				<c:when test="${19 <= rearchResult.movie_pg}">
					<img
						src="https://img.cgv.co.kr/R2014/images/common/flag/age/grade-19.png">
				</c:when>
				<c:otherwise>
					<img
						src="https://img.cgv.co.kr/R2014/images/common/flag/age/grade-all.png">
				</c:otherwise>
			</c:choose></strong>
         </div>
         
         <span style="font-weight:bold; font-size:14px;">${rearchResult.movie_name}</span>
         <br>
         <strong class="movie_genre" style="font-size: 12px;">${rearchResult.movie_genre}</strong>
         <br>
         <strong class="movie_auth">
						<c:if test="${rearchResult.movie_auth == 0}">
							<div class="auth_result">상영중</div>
						</c:if>
						<c:if test="${rearchResult.movie_auth == 1}">
							<div class="auth_result">상영 예정</div>
						</c:if>
						<c:if test="${rearchResult.movie_auth == 2}">
							<div class="auth_result">상영 종료</div>
						</c:if>
						</strong>
         <c:if test="${rearchResult.movie_auth == 0}">
         <h3 style="background:#fb4357; color:white; text-align:center; border-radius:5px;margin: 5px;">
         	<a href="${pageContext.request.contextPath}/reserve/reserveStep1.do">예매하기</a>
         </h3>
         </c:if>
         <c:if test="${rearchResult.movie_auth == 2}">
         	<span>상영종료</span>
         </c:if>
      </div>
      </c:forEach>
      <div class="float-clear">
         <hr width="100%" size="1" noshade="noshade">
      </div>
   </div>
   </c:if>
</div>