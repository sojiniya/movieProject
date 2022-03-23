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
	<input style="" type="button" value="예약 선택 초기화" onclick="location.href='reserveStep1.do'">
</div>

<div id="info-banner" style="width: 100%; background: black; height: 150px; margin: 10px 0 10px 0">
	<div class="info-movie">
		<div><img src="${pageContext.request.contextPath}/resources/images/default.png" width="120px" height="130px" style="float:left; margin-right: 20px; display:none" id="movie_photo"></div>
		<div id="movie_name">${movie.movie_name}</div>
		<div id="movie_genre">${movie.movie_genre}</div>
		<div id="movie_pg">${movie.movie_pg}</div>
	</div>
	<div class="info-theater">
		<div id="cgv_name">${theater.theater_name}</div>
		<div id="cgv_date">${time.movie_date}</div>
		<div id="cgv_time">${time.movie_time}</div>
	</div>
	<div class="info-people">
		<div id="adult_result">성인 | ${reserv.reserve_adult} 명</div>
		<div id="youth_result">청소년 | ${reserv.reserve_youth} 명</div>
		<div id="old_result">경로우대 | ${reserv.reserve_old} 명</div>
		<div id="total_result">총 ${reserv.reserve_people_total}명 | ${reserv.reserve_price_total}원</div>
	</div>
	<div>
		<form action="reserveStep3.do" method="post" id="reserveStep1_form">
			<input type="hidden" name="movie_num" id="movie_num">
			<input type="hidden" name="theater_num" id="theater_num">
			<input type="hidden" name="time_num" id="time_num">
			<input type="hidden" name="reserve_adult" id="reserve_adult">
			<input type="hidden" name="reserve_youth" id="reserve_youth">
			<input type="hidden" name="reserve_old" id="reserve_old">
			<input type="hidden" name="reserve_people_total" id="reserve_people_total">
			<input type="hidden" name="reserve_price_total" id="reserve_price_total">
			<input type="submit" value="결제하기">
		</form> 
	</div>
</div>

<div id="info-message" style="background: #f2f2f2; padding: 10px;">
	10 / 50 (예약가능 좌석 / 총 좌석)
	<p>회원님께서 선택한 인원수는 ${reserv.reserve_people_total}명입니다. ${reserv.reserve_people_total}명의 자리를 선택해주세요. </p>
	<span style="background: gray; color: white; margin: 9px; font-size: 13pt;">선택가능</span>
	<span style="background: skyblue; color: white; margin: 9px; font-size: 13pt;">선택됨</span>
	<span style="background: red; color: white; margin: 9px; font-size: 13pt;">선택불가</span>
</div>

<div id="seat">
	<c:forEach var="seat" items="${seat_list}">
		<c:if test="${seat.revseat_num == 0}">
			<span>${seat.seat_name}</span>
		</c:if>
		<c:if test="${seat.revseat_num != 0}">
			<span style="color:red;">${seat.seat_name}</span>
		</c:if>
	</c:forEach>
</div>

<!-- 중앙 컨텐츠 끝 -->