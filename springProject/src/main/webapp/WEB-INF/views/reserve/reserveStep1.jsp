<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<div style="display:flex;">
	<div style="width: 33%; border: 1px solid black;">1.영화 및 극장 선택</div>
	<div style="width: 33%; border: 1px solid black;">2.좌석 선택</div>
	<div style="width: 33%; border: 1px solid black;">3.결제</div>
</div>
	
<div>
	<input style="" type="button" value="초기화" onclick="location.href='reserveStep1.do'">
</div>

<div id="info-banner" style="width: 100%; background: gray; height: 150px; margin: 10px 0 10px 0">
	
</div>

<div class="movie-form">
	<div id="movieselect" style="width: 30%; height: 100%; border:1px black solid; float: left;">
		<div class="col-head">영화</div>
	</div>
	<div style="width: 30%; height: 100%; border:1px black solid; float: left;">
		<div class="col-head">극장</div>
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
<!--
<form:form modelAttribute="ReserveVO" action="reserveStep2.do" id="reserveStep1form">
</form:form> 
 -->	

<!-- 중앙 컨텐츠 끝 -->