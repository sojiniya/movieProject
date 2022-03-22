<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main">
	<h2>극장지역정보 등록</h2>
	<form:form modelAttribute="theaterVO" action="theaterWrite.do" id="theater_form">
		<ul>
			<li>
				<form:label path="theater_local">극장관지역</form:label>
				<select name="theater_local">
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="인천">인천</option>
					<option value="강원">강원</option>
				</select>
			</li>
			<li>
				<form:label path="theater_addr">극장관주소</form:label>
				<form:input path="theater_addr"/>
			</li>
			<li>
				<form:label path="theater_name">극장관명</form:label>
				<form:input path="theater_name"/>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="등록">
			<input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->