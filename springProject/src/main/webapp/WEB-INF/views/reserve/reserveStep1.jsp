<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
	});
</script>
<div style="display:flex;">
	<div style="width: 33%; border: 1px solid black;">1.영화 및 극장 선택</div>
	<div style="width: 33%; border: 1px solid black;">2.좌석 선택</div>
	<div style="width: 33%; border: 1px solid black;">3.결제</div>
</div>
	
<div>
	<input style="" type="button" value="초기화" onclick="location.href='reserveStep1.do'">
</div>

<div id="info-banner" style="width: 100%; background: black; height: 150px; margin: 10px 0 10px 0">
	<div class="info-movie">
		<div><img src="${pageContext.request.contextPath}/resources/images/default.png"  width="120px" height="130px" style="float:left; margin-right: 20px"></div>
		<div id="movie_name"></div>
		<div id="movie_genre"></div>
		<div id="movie_pg"></div>
	</div>
	<div class="info-theater">
	</div>
	<div class="info-people">
	</div>
	<div>
		<form:form modelAttribute="ReserveVO" action="reserveStep2.do" id="reserveStep1_form">
			좌석 선택
		</form:form> 
	</div>
</div>

<div class="movie-form">
	<div id="movieselect" style="width: 30%; height: 100%; border:1px black solid; float: left;">
		<div class="col-head">영화</div>
		<div class="col-body">
			<c:if test="${empty movie_list}">
			<div style="text-align: center;">현재 상영중인 영화가 없습니다.</div>
		</c:if>
		<c:if test="${!empty movie_list}">
			<ul style="margin-top: 0px; padding-left: 0px; margin-bottom: 0px;" class="movie_list">
				<c:forEach var="movie" items="${movie_list}">
					<li style="margin: 5px; float: none; text-align: left;">
						<a href="#" movie-idx="${movie.movie_num}">
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
		<div class="col-body">
			<div class="theater-list">
				<div class="theater-area-list">
					<ul>
						
					</ul>
				</div>
				<div class="theater-cgv-list"></div>
			</div>
		</div>
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

<!-- 중앙 컨텐츠 끝 -->