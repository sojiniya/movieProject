<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<div>
	<ul>
		<li>1.영화 및 극장 선택</li>
		<li>2.좌석 선택</li>
		<li>3.결제</li>
	</ul>
</div>
	
<div>
	<input type="button" value="초기화" onclick="location.href='reserveStep1.do'">
</div>

<div id="info-banner">
	
</div>

<div>
	<form:form modelAttribute="ReserveVO" action="reserveStep2.do">
		
	</form:form>
</div>

<!-- 중앙 컨텐츠 끝 -->