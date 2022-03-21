<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main">
	<h2>극장지역등록정보 리스트조회</h2>
	<form action="list.do" method="get">
		<ul>
			<li class="on"><a href="#">서울</a></li>
			<li class="on"><a href="#">경기</a></li>
			<li class="on"><a href="#">인천</a></li>
			<li class="on"><a href="#">강원</a></li>
			<li class="on"><a href="#">대구</a></li>
		</ul>
		<c:if test="${count > 0}">
		<div class="area">
			<ul>
				<li class="on"><a title="CGV강남" href="#">CGV강남</a></li>
				<li class="on"><a title="CGV강변" href="#">CGV강변</a></li>
				<li class="on"><a title="CGV건대입구" href="#">CGV건대입구</a></li>
				<li class="on"><a title="CGV구로" href="#">CGV구로</a></li>
			</ul>
		</div>
		</c:if>
	</form>
</div>
<!-- 중앙 컨텐츠 끝 -->