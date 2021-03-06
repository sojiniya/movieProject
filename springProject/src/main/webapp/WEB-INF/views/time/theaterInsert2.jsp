<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<!-- 부트스트랩 라이브러리 -->
<style type="text/css">
div#main_body {
    float: left;
    width: 99%;
    padding: 0px 0px 0px;
}
form#time_form {
    width: 400px;
    height: 250px;
}
form#time_form {
    width: 400px;
    margin: 55px auto;
    border: #000f;
    padding: 10px 10px 10px 40px;
}
</style>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<div class="page-main">
	<h2 style="padding-left: 120px;height: 0px;">상영 정보 등록</h2>
	<form:form modelAttribute="timeVO" action="timeInsert.do" id="time_form">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li style="clear:both">
				<form:label path="theater_num">극장</form:label> 
				<select name="theater_num" id="theater_num" style="margin-left: 53px;">
				<c:forEach var="list" items="${theater_list }">
					<option value="${list.theater_num}">${list.theater_name}</option>
				</c:forEach>
				</select>
				<form:errors path="theater_num" cssClass="error-color"/><p>
			</li>
		    <li style="clear:both">
				<form:label path="movie_num">영화</form:label>
				<select name="movie_num" id="movie_num" style="margin-left: 53px;">
				<c:forEach var="list" items="${movie_list }">
					<option value="${list.movie_num}">${list.movie_name}</option>
				</c:forEach>
				</select>
				<form:errors path="movie_num" cssClass="error-color"/><p>
			</li>
			<li style="clear:both">
				<form:label path="movie_name">영화제목</form:label>
				<form:input path="movie_name" style="width:225px; margin-left:27px;"/>
				<form:errors path="movie_name" cssClass="error-color"/><p>
			</li>
			<li style="clear:both">
				<form:label path="movie_time">극장상영시간</form:label>
				<form:input path="movie_time" />
				<form:errors path="movie_time" cssClass="error-color"/><p>
			</li>
			<li style="clear:both">
				<form:label path="movie_date">극장상영날짜</form:label>
				<form:input path="movie_date"/>
				<form:errors path="movie_date" cssClass="error-color"/><p>
			</li>
		</ul>	 
		<div class="align-center" style="clear:both;padding-right: 50px;"><br>
			<form:button>등록</form:button>
			<input type="button" value="목록" 
			              onclick="location.href='${pageContext.request.contextPath}/time/selectList.do'">
		</div>                                          
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->