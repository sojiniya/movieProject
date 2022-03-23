<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"> 
<script type="text/javascript">
	$(function(){
		//비밀번호 체크 (이거 안먹힌다.)
		$('#mem_pw').keyup(function(){
			if($('#confrim_passwd').val()!='' && $('#confrim_passwd').val()!=$(this).val()){
				$("#message_id").text('비밀번호 불일치').css('color','red');
			}else if($('#confrim_passwd').val()!='' && $('#confrim_passwd').val()==$(this).val()){
				$('#message_id').text('비밀번호 일치').css('color','#000');
			}
		});
		
		
		$('#confrim_passwd').keyup(function(){
			if($('#mem_pw').val()!='' && $('#mem_pw').val()!=$(this).val()){
				$('#message_id').text('비밀번호 불일치').css('color','red');
			}else if($('#mem_pw').val()!='' && $('#mem_pw').val()==$(this).val()){
				$('#message_id').text('비밀번호 일치').css('color','#000');
			}	
		});
		
		$('#change_form').submit(function(){
			if($('#now_mem_pw').val().trim()==''){
				alert('현재 비밀번호를 입력하세요!');
				$('#now_mem_pw').val('').focus();
				return false;
			}
			if($('#mem_pw').val().trim()==''){
				alert('변경할 비밀번호를 입력하세요');
				$('#mem_pw').val('').focus();
				return false;
			}
			if($('#confrim_passwd').val().trim()==''){
				alert('변경할 비밀번호 확인을 입력하세요!');
				$('#confirm_passwd').val('').focus();
				return false;
			}
			
			if($('#mem_pw').val()!=$('#confrim_passwd').val()){
				$('#message_id').text('비밀번호 불일치').css('color','red');
				return false;
			}
			
		});
		
		
	});
</script>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main">
	<h2>비밀번호 변경</h2>
	<form:form modelAttribute="memberVO" action="changePassword.do" id="change_form">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:label path="now_mem_pw">현재 비밀번호</form:label>
				<form:password path="now_mem_pw"/>
				<form:errors path="now_mem_pw" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="mem_pw">변경할 비밀번호</form:label>
				<form:password path="mem_pw"/>
				<form:errors path="mem_pw" cssClass="error-color"/>
			</li>
			<li>
				<label for="confirm_passwd">변경할 비밀번호 확인</label>
				<input type="password" id="confrim_passwd">
				<span id="message_id"></span>
			</li>
		</ul>
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->