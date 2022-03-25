<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<script type="text/javascript">
	$(function(){
		//프로필 사진 업로드
		$('#photo_btn').click(function(){
			$('#photo_choice').show();
			$(this).hide();
		});
		
		//처음 화면에 보여지는 이미지 읽기
		let photo_path = $('.my-photo').attr('src');
		let my_photo;
		
		$('#upload').change(function(){
			my_photo = this.files[0];
			if(!my_photo){
				$('.my-photo').attr('src',photo_path);
				return;
			}
			
			if(my_photo.size > 1024 * 1024){
				alert(Math.round(my_photo.size/1024) + 'kbytes(1024kbytes까지만 업로드 가능)');
				$('.my-photo').attr('src',photo_path);
				$(this).val('');
				return;
			}
			
			//이미지 미리보기 처리
			var reader = new FileReader();
			reader.readAsDataURL(my_photo);
			
			reader.onload=function(){
				$('.my-photo').attr('src',reader.result);
			};
		});//end of change
		
		//이미지를 서버에 전송
		$('#photo_submit').click(function(){
			if($('#upload').val() == ''){
				alert('파일을 선택하세요!!');
				$('#upload').focus();
				return;
			}
			
			//파일 전송작업
			var form_data = new FormData();
			form_data.append('upload',my_photo);
			
			$.ajax({
				url:'updateMyPhoto.do',
				type:'post',
				data:form_data,
				dataType:'json',
				contentType:false,
				enctype:'multipart/form-data',
				processData:false,
				success:function(param){
					if(param.result == 'logout'){
						alert('로그인 후 사용하세요!');		
					}else if(param.result == 'success'){
						alert('프로필 사진이 수정되었습니다.');
						photo_path = $('.my-photo').attr('src');
						$('#upload').val('');
						$('#photo_choice').hide();
						$('#photo_btn').show();
					}else{
						alert('파일 전송 오류 발생');
					}
				},
				error:function(){
					alert('네트워크 오류 발생');
				}
			});
		}); //end of click
		
		$('#photo_reset').click(function(){
			$('.my-photo').attr('src',photo_path);
			$('#upload').val('');
			$('#photo_choice').hide();
			$('#photo_btn').show();
		});
		
		
	});
</script>
	<!-- 중앙 컨텐츠 시작 -->
	<div class="page-main">
		<h2>프로필 사진</h2>
		<ul>
			<li>
			<c:if test="${empty member.mem_photo}">
				<img src="${pageContext.request.contextPath}/resources/images/face.png" width="200" height="200" class="my-photo">
			</c:if> 
			<c:if test="${!empty member.mem_photo}">
				<img src="${pageContext.request.contextPath}/user/photoView.do" width="200" height="200" class="my-photo">
			</c:if>
			</li>
			<li>
				<div class="align-center">
					<input type="button" value="프로필 사진 수정" id="photo_btn">
				</div>
				<div id="photo_choice" style="display: none;">
					<input type="file" id="upload" accept="image/gif,image/png,image/jpeg">
					<input type="button" value="전송" id="photo_submit"> 
					<input type="button" value="취소" id="photo_reset">
				</div>
			</li>
		</ul>
		<h2>회원 상세 정보</h2>
		<ul>
			<li>이름 : ${member.mem_name}</li>
			<li>전화번호 : ${member.mem_phone}</li>
			<li>이메일 : ${member.mem_email}</li>
			<li>우편번호 : ${member.mem_zipcode}</li>
			<li>주소 : ${member.mem_address}</li>
			<li>등급 : 
			<c:if test="${member.mem_grade < 3}"> 
                        <strong class="txt-purple">브론즈</strong>입니다.             
                        </c:if>
                        <c:if test="${member.mem_grade >= 3}"> 
                        <strong class="txt-purple">실버</strong>입니다.             
                        </c:if>
                        <c:if test="${member.mem_grade >= 5}"> 
                        <strong class="txt-purple">골드</strong>입니다.             
            </c:if>				
			</li>
		</ul>
		<hr size="1" width="100%">
		<p class="align-right">
			<input type="button" value="회원정보수정" onclick="location.href='userModify.do'">
			<input type="button" value="비밀번호변경" onclick="location.href='changePassword.do'">
			<input type="button" value="회원탈퇴" onclick="location.href='delete.do'">
		</p>
	</div>
<!-- 중앙 컨텐츠 끝 -->