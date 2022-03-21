<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<div style="display:flex;">
	<div style="width: 33%; border: 1px solid black;">1.영화 및 극장 선택</div>
	<div style="width: 33%; border: 1px solid black;">2.좌석 선택</div>
	<div style="width: 33%; border: 1px solid black;">3.결제</div>
</div>
	
<div>
	<input style="" type="button" value="초기화" onclick="location.href='reserveStep1.do'">
</div>

<div id="info-banner" style="width: 100%; background: gray; height: 150px; margin: 10px 0 10px 0">
	
</div>

<div class="movie-form">
	<div id="movieselect" style="width: 30%; height: 100%; border:1px black solid; float: left;">
		<div class="col-head">영화</div>
		<div class="col-body">
			<c:if test="${empty list}">
			<div style="text-align: center;">현재 상영중인 영화가 없습니다.</div>
		</c:if>
		<c:if test="${!empty list}">
			<ul style="margin-top: 0px; padding-left: 0px; margin-bottom: 0px;">
				<c:forEach var="movie" items="${list}">
					<li style="margin: 5px; float: none; text-align: left;">
						<a href="#">
						<span>${movie.movie_pg}</span>
						<span>${movie.movie_name}</span>
						</a>
					</li>					
				</c:forEach>
			</ul>			
		</c:if>
		</div>
	</div>
	<div style="width: 30%; height: 100%; border:1px black solid; float: left;">
		<div class="col-head">극장</div>
	</div>
	<div style="width: 9%; height: 100%; border:1px black solid; float: left;">
		<div class="col-head">날짜</div>
	</div>
	<div style="width: 15%; height: 100%; border:1px black solid; float: left;">
		<div class="col-head">시간</div>
	</div>
	<div style="width: 15%; height: 100%; border:1px black solid; float: left;">
		<div class="col-head">인원 (최대 6명)</div>
	</div>
</div>
<!--
<form:form modelAttribute="ReserveVO" action="reserveStep2.do" id="reserveStep1form">
</form:form> 
 -->	

<!-- 중앙 컨텐츠 끝 -->