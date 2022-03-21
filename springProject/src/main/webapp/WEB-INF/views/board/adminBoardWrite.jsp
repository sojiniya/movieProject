<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!-- 중앙 시작 -->
<div class="adminBoardWrite-main">
	<h2>관리자 글쓰기</h2>
	<form class="adminWriteForm">
		<ul class="selectRadio">
			<li>게시글 선택</li>
			<li>
			<label for="qna">
				<input type="radio" id="qna" name="boardCate" value="0">자주찾는 질문
			</label>
			</li>
			<li>
			<label for="news">
				<input type="radio" id="news" name="boardCate" value="1">뉴스/공지
			</label>
			</li>
		</ul>
	</form>
	<c:if test="${!empty board_auth && board_auth == 0}">
		<form:form modelAttribute="boardVO" action="adminBoardWrite.do" enctype="multipart/form-data" id="adminWrite_form">
			<ul>
				<li>
					<form:label path="title">제목</form:label>
				</li>
			</ul>
		</form:form>
	</c:if>
	<c:if test="${!empty board_auth && board_auth == 1}">
		<form:form modelAttribute="boardVO" action="adminBoardWrite.do" enctype="multipart/form-data" id="adminWrite_form">
		
		</form:form>
	</c:if>
</div>
<!-- 중앙 끝-->