<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main">
	<h2>극장지역정보 등록</h2>
	<form:form modelAttribute="theaterVO" action="write.do" id="register_form">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:label path="theater_addr">지역명</form:label>
				<form:input path="theater_addr"/>
				<form:errors path="theater_addr" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="theater_addr">극장위치</form:label>
				<form:input path="theater_addr"/>
				<form:errors path="theater_addr" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="theater_name">극장관명</form:label>
				<form:input path="theater_name"/>
				<form:errors path="theater_name" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<form:button>등록</form:button>
			<input type="button" value="목록" onclick="location.href='list.do'">
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->