<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<div>
	${member.mem_name}님 예매가 완료되었습니다.
</div>
<hr width="100%">
<div>
	<div>
		<img src="${pageContext.request.contextPath}/resources/images/default.png" style="float:left;">
	</div>
	<div>
		<p>${movie.movie_name}</p>
		<p>극장 | ${theater.theater_name}</p>
		<p>일시 | ${time.movie_date} ${time.movie_time}</p>
		<p>인원 | 성인 ${reserve.reserve_adult}명, 청소년 ${reserve.reserve_youth}명, 경로우대 ${reserve.reserve_old}명</p>
		<p>좌석번호 | ${reserve.reserve_seat}<p>
		<input type="button" value="영화정보 보기" onclick="location.href='${pageContext.request.contextPath}/movie/movieDetail.do?movie_num=${movie.movie_num}'">
		<input type="button" value="마이페이지" onclick="location.href='${pageContext.request.contextPath}/user/myPage.do'">
	</div>
</div>
<hr width="100%">
<table>
	<tr>
		<th>결제하실 금액</th>
		<th>총 할인 금액</th>
		<th>최종결제 금액</th>
		<th>결제 방법</th>
	</tr>
	<tr>
		<td>${reserve.reserve_price_total}원</td>
		<td>${reserve.sale_price}원</td>
		<td>${reserve.final_price}원</td>
		<td>${reserve.reserve_paymethod}</td>
	</tr>
</table>
<!-- 중앙 컨텐츠 끝 -->