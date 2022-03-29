<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<!-- 부트스트랩 라이브러리 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<div class="page-main">
	<h2>상영 정보 등록</h2>
	<form:form modelAttribute="timeVO" action="timeInsert.do" id="register_form">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:label path="theater_num">영화관</form:label>
				<form:input path="theater_num"/>
				<form:errors path="theater_num" cssClass="error-color"/>
			</li>
		    <li style="clear:both">
				<form:label path="movie_num">영화</form:label>
				<form:input path="movie_num"/>
				<form:errors path="movie_num" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="movie_name">영화제목</form:label>
				<form:input path="movie_name"/>
				<form:errors path="movie_name" cssClass="error-color"/>
			</li>
			<li style="clear:both">
				<form:label path="movie_time">극장상영시간</form:label>
				<form:input path="movie_time"/>
				<form:errors path="movie_time" cssClass="error-color"/>
			</li>
			<li style="clear:both">
				<form:label path="movie_date">극장상영날짜</form:label>
				<form:input path="movie_date"/>
				<form:errors path="movie_date" cssClass="error-color"/>
			</li>
		</ul>	 
		<div class="align-center" style="clear:both">
			<form:button>전송</form:button>
			<input type="button" value="목록" 
			              onclick="location.href='${pageContext.request.contextPath}/time/selectList.do'">
		</div>                                          
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->