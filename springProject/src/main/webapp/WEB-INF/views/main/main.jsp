<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
	});
</script>
<!-- 메인 시작 -->
<div class="page-main">
	<div class="contents">

		<div class="video_wrap">

			<video autoplay muted>
				<source src='https://adimg.cgv.co.kr/images/202203/Stellar/Stellar_1080x608.mp4' type='video/mp4'>
				이 브라우저는 Video 태그를 지원하지 않습니다. (Your browser does not support the video tag.)
			</video>
			<div class="video_text">
				<strong id="AD_movie_name" class="movieSelection_title">스텔라</strong><br>
				<span id="AD_movie_sub" class="movieSelection_txt">최대시속 50KM,
					자율주행차?!<br>본격 버라이어티 코미디
				</span>
				<div class="movieSelection_video_controller_wrap">
					<a
						href="http://ad.cgv.co.kr/click/CGV/CGV_201401/main@MovieSelection2021?ads_id%3d46812%26creative_id%3d66312%26click_id%3d86631%26maid%3D%26event%3d"
						id="AD_movie_url" class="btn_detail">상세보기</a>
				</div>
			</div>
		</div>
		
		<c:if test="${count > 0}">
			<div class="movieChart_wrap">
				<h2>주간 박스오피스 순위</h2>
				<a href="${pageContext.request.contextPath}/movie/movieChart.do"
					id="btn_allView_Movie" class="btn_allView">전체보기</a>
			</div>
			<div id="movie_api">
				<c:forEach var="movie" items="${movieList}" varStatus="status">
					<li>
						<p class="movie_rank">${status.count}</p>
						<br>
						<p>${movie.movie_pg}</p>
						<br>
						<strong class="movie_name">${movie.movie_name}</strong><br>
						<p>${movie.movie_auth}</p>
						<br>
					</li>
				</c:forEach>
			</div>
		</c:if>
	</div>
</div>
<!-- 메인 끝 -->