<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<div class="page-main">
	<div class="tit-moviechart">
		<h1>무비차트</h1>
	</div>
	<div class="order-moviechart">
		<div class="align-right">
			<select id="order_type" name="order-type">
				<option title="현재 선택됨" selected value="1">예매율순</option>
				<option value="2">평점순</option>
				<option value="3">관람객순</option>
			</select>
			<button type="button" class="round gray">
				<span>GO</span>
			</button>
		</div>
		<div class="list-moviechart">
			<c:if test="${!empty user_num && user_auth == 3}">
				<div class="align-right">
					<input type="button" value="글쓰기"
						onclick="location.href='movieWrite.do'">
				</div>
			</c:if>
			<c:if test="${count == 0}">
				<div class="result-display">표시할 게시물이 없습니다.</div>
			</c:if>
			<c:if test="${count > 0}">
				<table>
					<tr>
						<th>번호</th>
						<th width="400">영화제목</th>
						<th>영화장르</th>
						<th>연령등급</th>
						<th>상영정보</th>
					</tr>
					<c:forEach var="movie" items="${list}">
						<tr>
							<td>${movie.movie_num}</td>
							<td><a href="movieDetail.do?movie_num=${movie.movie_num}">${movie.movie_name}</a></td>
							<td>${movie.movie_genre}</td>
							<td>${movie.movie_pg}</td>
							<td>${movie.movie_auth}</td>
					</c:forEach>
				</table>
			</c:if>
		</div>
	</div>
</div>
