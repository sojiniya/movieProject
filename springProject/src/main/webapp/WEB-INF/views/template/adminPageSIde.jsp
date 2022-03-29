<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- 왼쪽 메뉴 시작 -->
<div class="col-aside">
	<ul>
		<li class="on"><a href="${pageContext.request.contextPath}/">관리자 페이지 메인</a></li>
		<li><a href="${pageContext.request.contextPath}/">회원정보 리스트</a></li>
		<li><a href="${pageContext.request.contextPath}/">회원 영화예매</a></li>
		<li><a href="${pageContext.request.contextPath}/">관리자 게시판</a></li>
		<c:if test="${!empty user_num && user_auth == 3}">
			<li><a href="#">공지사항</a></li>
			<li><a href="${pageContext.request.contextPath}/board/adminBoardWrite.do">자주 찾는 질문</a></li>
		</c:if>
	</ul>
</div>
<!-- 왼쪽 메뉴 끝 -->