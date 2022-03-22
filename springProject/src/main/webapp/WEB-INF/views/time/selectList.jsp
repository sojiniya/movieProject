<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<style type="text/css">
div {
    display: block;
}
div, ul, li, form, font, a{
	font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-size: 100%;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    word-break: break-all;
}
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
</script>
<div class="favorite-wrap">
	<div class="sect-city">
		<ul>
			<li class="on">
			<a href="#">서울</a>
			<a href="#">경기</a>
			<a href="#">인천</a>
			<a href="#">강원</a>
			<a href="#">대구</a>
			<div class="area">
				<ul>
					<li class="on">
					<a title="CGV강남" href="#">CGV강남</a>
					<a title="CGV강변" href="#">CGV강변</a>
					<a title="CGV건대입구" href="#">CGV건대입구</a>
					<a title="CGV홍대" href="#">CGV홍대</a>
					</li>
				</ul>
			</div>
			</li>
		</ul>
	</div>
</div>

<a href="${pageContext.request.contextPath}/theater/theaterWrite.do">극장지역등록폼text</a>

<hr size="1" noshade="noshade" width="100%">
<div>
</div>
<!-- THEATER 삽입 START -->
<div class="wrap-theater">
	<h3>
		<img alt="theater" src="https://img.cgv.co.kr/R2014/images/title/h3_theater.gif">
	</h3>
</div>
<hr size="1" noshade="noshade" width="100%">
<!-- THEATER 삽입 END -->
<!-- 지점별 THEATER 삽입 시작 -->
<div class="sect-theater">
	<div class="sect-theater">
		<h4 class="theater-ti">
			<span>CGV강남</span>
		</h4>
		<div class="wrap-theaterinfo">
			<div class="box-image">
				<div class="thumb-image" id="theater_img_container">
					<img alt="CGV강남점 인포" src="https://img.cgv.co.kr/Theater/Theater/2014/1211/CGVgangnam.jpg">
				</div>
			</div>
		</div>
	</div>
</div>
<hr size="1" noshade="noshade" width="100%">
<hr size="1" noshade="noshade" width="100%">
<!-- 중앙 컨텐츠 끝 -->