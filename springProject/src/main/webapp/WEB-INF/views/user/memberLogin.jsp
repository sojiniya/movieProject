<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 중앙 컨텐츠 시작 -->
<style type="text/css">
.box-login {
    padding: 30px 0 0 132px;
    border-bottom: 2px solid #898987;
    height: 266px;
}
div {
    font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-size: 100%;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    word-break: break-all;
}
div {
    display: block;
}
h3 {
    height: auto;
    margin: 0;
    background: none;
    line-height: 1.2;
    text-align: left;
    color: #222222;
    font-size: 15px;
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.hidden {
    font: 0/0 a;
    height: 0;
    overflow: hidden;
    position: absolute;
    visibility: hidden;
    width: 0;
    zoom: 1;
}
form {
	display: block;
}
body {
	line-height: 1.2;
    color: #666;
    font-weight: 400;
}
.box-login fieldset {
    position: relative;
}
fieldset {
    display: block;
    margin-inline-start: 2px;
    margin-inline-end: 2px;
    padding-block-start: 0.35em;
    padding-inline-start: 0.75em;
    padding-inline-end: 0.75em;
    padding-block-end: 0.625em;
    min-inline-size: min-content;
}
legend {
    font: 0/0 a;
    position: absolute;
    right: -999em;
    top: -999em;
    zoom: 1;
    display: block;
    padding-inline-start: 2px;
    padding-inline-end: 2px;
}
p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: 400;
}
.box-login .login {
    position: relative;
    margin-top: 15px;
}
.box-login .login form[type="input"], .box-login .login form[type="password"] {
    width: 215px;
}
.box-login .login form[type="input"] {
    margin-bottom: 5px;
    background: url(../images/sprite/sprite_icon.png) 12px -230px no-repeat;
}
.box-login .login form[type="input"], .box-login .login input[type="password"] {
    display: block;
    width: 135px;
    height: 35px;
    padding: 0 5px 0 40px;
    border: 2px solid #b5b5b5;
    line-height: 33px;
}
</style>
<div class="box-login">
	<h3 class="hidden">회원 로그인</h3>
	<form:form modelAttribute="memberVO" action="login.do" id="login_form">
		<form:errors element="div" cssClass="error-color"/>
		<fieldset>
		회원 로그인
		<p>아이디와 비밀번호를 입력하신 후, 로그인 버튼을 클릭해주세요.</p>
		<div class="login">
		<ul>
			<li>
				<form:label path="id">아이디</form:label>
				<form:input path="id"/>
				<form:errors path="id" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="mem_pw">비밀번호</form:label>
				<form:password path="mem_pw"/>
				<form:errors path="mem_pw" cssClass="error-color"/>
			</li>
		</ul>
		</div>
		<div class="align-center">
			<form:button id="submit" title="로그인"><span>로그인</span></form:button>
		</div>
		<div class="login-option">
			<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
		</fieldset>
	</form:form>
</div>