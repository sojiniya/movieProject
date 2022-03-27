<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.movie_info table{
	border:none;
}
.movie_info td{
	border:none;
	font-weight: bold;
}
</style>
<!-- 중앙 컨텐츠 시작 -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<div class="movie_info">
<table>
	<tr><td><img src="imageView.do?movie_num=${movie.movie_num}" style="width:185px; height:260px;"></td>
	<td>${movie.movie_name}</td></tr></table>
</div>
<div class="page-main">
	<strong class="movie_auth"> <c:if
			test="${movie.movie_auth == 0}">
			<div class="auth_result">상영중</div>
		</c:if> <c:if test="${movie.movie_auth == 1}">
			<div class="auth_result">상영 예정</div>
		</c:if> <c:if test="${movie.movie_auth == 2}">
			<div class="auth_result">상영 종료</div>
		</c:if>
	</strong>
	<p>${movie.movie_content}</p>
	<p>첨부파일 : <a href="file.do?movie_num=${movie.movie_num}">${movie.filename}</a></p>
	<c:if test="${fn:endsWith(movie.filename,'.jpg') ||
	              fn:endsWith(movie.filename,'.JPG') ||
	              fn:endsWith(movie.filename,'.gif') ||
	              fn:endsWith(movie.filename,'.GIF') ||
	              fn:endsWith(movie.filename,'.png') ||
	              fn:endsWith(movie.filename,'.PNG')}">
	</c:if>
	<hr size="1" width="100%" noshade="noshade">
	<div class="align-right">
		<c:if test="${!empty user_num && user_auth == 3}">
		<input type="button" value="수정" onclick="location.href='movieUpdate.do?movie_num=${movie.movie_num}'"> 
		<input type="button" value="삭제" id="delete_btn"> 
		<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('movieDelete.do?movie_num=${movie.movie_num}');
				}
			};
		</script>
		</c:if>
		<input type="button" value="목록" onclick="location.href='movieChart.do'">
	</div>
	<hr size="1" width="100%" noshade="noshade">
	<div id="reply_div">
		<span class="re-title">댓글 달기</span>
	</div>
</div>
<!-- 중앙 컨텐츠 끝 -->