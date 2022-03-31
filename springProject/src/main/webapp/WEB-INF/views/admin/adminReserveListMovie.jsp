<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 중앙 컨텐츠 시작 -->
<div class="page-main">
	<h2>게시판 목록</h2>
	<form action="list.do" id="search_form" method="get">
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>요일</option>
					<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>영화별</option>
					<option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>극장별</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword }">
			</li>
			<li>
				<input type="submit" value="검색">
				<input type="button" value="목록" onclick="location.href='list.do'">
			</li>
		</ul>
	</form>
	<c:if test="${count == 0 }">
	<div class="result-display">영화예매 내역이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table>
		<tr>
			<th>회원번호</th>
			<th width="400">회원 아이디</th>
			<th>영화제목</th>
			<th>극장</th>
			<th>예매 좌석수</th>
			<th>결제 수단</th>
			<th>결제 금액</th>
		</tr>
		<c:forEach var="reserve" items="${list}">
		<tr>
			<td>${reserve.mem_num}</td>
			<td>${reserve.id}</td>
			<td>${reserve.movie_name}</td>
			<td>${reserve.theater_name}</td>
			<td>예매 좌석수</td>
			
			<c:if test="${reserve.reserve_paymethod == 1}">
			<td>카드 결제</td>
			</c:if>
			<c:if test="${reserve.reserve_paymethod == 2}">
			<td>현금 결제</td>
			</c:if>
			<c:if test="${reserve.reserve_paymethod == 3}">
			<td>카카오페이 결제</td>
			</c:if>
			
			<td>${reserve.reserve_paytotal}</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${pagingHtml}</div>
	</c:if>
</div>
<!-- 중앙 컨텐츠 끝-->





