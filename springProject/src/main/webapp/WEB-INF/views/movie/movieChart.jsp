<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<style>
	#search_form2{
		padding-left:480px;
		border:none;
	}
.movieRank{
	color:white;
	background:red;
	height:25px;
	padding-top:3px;
	margin-bottom:8px;
	border-radius: 5px;
}
</style>
<div class="page-main">
	<div class="tit-moviechart">
		<h1>무비차트</h1>
	</div>
	<div class="order-moviechart">
		<div class="align-right">
			<form id="search_form2" action="searchMovie.do">
				<select id="keyfield" name="keyfield">
					<option title="현재 선택됨" value="1">예매율순</option>
					<option value="2" <c:if test="${keyfield ==2}">selected</c:if>>평점순</option>
				</select>
			<input type="submit" value="GO" style="height: 30px;background: lightgray;border: 2px solid lightgray;">
			</form>
		</div>
		<div class="list-moviechart">
			<c:if test="${!empty user_num && user_auth == 3}">
				<div class="align-right">
					<input type="button" value="글쓰기"
						onclick="location.href='movieWrite.do'" style="background: #fff0;color: black;width: 70px;height: 35px;border: 2px solid lightgrey;font-size: 15px;">
				</div>
			</c:if>
			<c:if test="${count == 0}">
				<div class="result-display">표시할 게시물이 없습니다.</div>
			</c:if>
			<c:if test="${count > 0}">
			<c:forEach var="movie" items="${list}">
				<ul>
					<li><c:if test="${movie.rank != ''}">
						<div class="movieRank">NO.${movie.rank}</div>
						</c:if>
						<div class="movie-image">
						<a href="movieDetail.do?movie_num=${movie.movie_num}"><img src="imageView.do?movie_num=${movie.movie_num}" style="width:185px; height:260px;"></a></div>
						<div class="movie-content">
						<strong class="movie_pg">
						<c:choose>
						<c:when test="${12 <= movie.movie_pg && movie.movie_pg < 15}">
						<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/grade-12.png">
						</c:when>
						<c:when test="${15 <= movie.movie_pg && movie.movie_pg < 19}">
						<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/grade-15.png">
						</c:when>
						<c:when test="${19 <= movie.movie_pg}">
						<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/grade-19.png">
						</c:when>
						<c:otherwise>
						<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/grade-all.png">
						</c:otherwise></c:choose></strong>
						<strong class="movie_name"><a href="movieDetail.do?movie_num=${movie.movie_num}">${movie.movie_name}</a></strong><br>
						<strong class="movie_genre">${movie.movie_genre}</strong>
						<strong class="movie_auth">
						<c:if test="${movie.movie_auth == 0}">
							<div class="auth_result">상영중</div>
						</c:if>
						<c:if test="${movie.movie_auth == 1}">
							<div class="auth_result">상영 예정</div>
						</c:if>
						<c:if test="${movie.movie_auth == 2}">
							<div class="auth_result">상영 종료</div>
						</c:if>
						</strong>
						</div>
						<strong class="movie_reserve"><a href="${pageContext.request.contextPath}/reserve/reserveStep1.do" style="color:white";>예매하기</a></strong>
						
					</li>
					</ul>
			</c:forEach>
			</c:if>
		</div>
	</div>
	<div class="align-center" style="clear:both;">${pagingHtml}</div>
</div>
