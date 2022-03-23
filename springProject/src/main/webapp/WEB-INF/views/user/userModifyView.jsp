<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/reset.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/layout.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/module.css?20211209" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/content.css" />
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
<div class="cols-content" id="menu">
	<div class="col-aside">
		<div class="skipnaiv">
			<a href="#mycgv_contents" id="skipMycgvMenu">MYCGV 서브메뉴 건너띄기</a>
		</div>
		<h2>MY CGV 서브메뉴</h2>
		<div class="snb">
			<ul>
				<li class="on"><a href="/user/mycgv/?g=1" title="현재 선택">MY
						CGV HOME <i></i>
				</a></li>
				<li><a href="/user/mycgv/reserve/?g=1">나의 예매내역 <i></i></a></li>

				<li><a href="/user/mycgv/myinfo/?g=1">회원정보<i></i></a>
					<ul>
						<li>
						<a href="${pageContext.request.contextPath}/user/update.do">개인정보 변경</a></li>
						<li><a href="/user/mycgv/myinfo/leave-cjone.aspx?g=1">회원탈퇴</a>
						</li>
					</ul>
				</li>

				<li>
					<a href="/user/mycgv/inquiry/qna/list.aspx?g=1">나의 문의내역 <i></i></a>
					<ul>
						<li><a href="/user/mycgv/inquiry/qna/list.aspx?g=1">1:1문의</a></li>
					</ul>
				</li>
				<li class="my-event"><a href="/user/movielog/watched.aspx">내가 본 영화</a></li>
				<!-- <li class="my-event"><a href="/user/mycgv/event/?g=1">나의 참여 이벤트</a></li> -->
			</ul>
			<div class="ad-partner01">
				<iframe
					src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@M_Rectangle"
					width="160" height="300" title="" frameborder="0" scrolling="no"
					marginwidth="0" marginheight="0" id="M_Rectangle"></iframe>
			</div>
			<div class="ad-partner02">
				<iframe
					src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@Image_text"
					width="160" height="35" title="" frameborder="0" scrolling="no"
					marginwidth="0" marginheight="0" id="Image_text"></iframe>
			</div>
		</div>
	</div>

</div>
	<!-- 중앙 컨텐츠 시작 -->
	<div class="page-main">
		<h2>프로필 사진</h2>
		<ul>
			<li><c:if test="${empty member.mem_photo}">
					<img
						src="${pageContext.request.contextPath}/resources/images/face.png"
						width="200" height="200" class="my-photo">
				</c:if> <c:if test="${!empty member.mem_photo}">
					<img src="${pageContext.request.contextPath}/member/photoView.do"
						width="200" height="200" class="my-photo">
				</c:if></li>
			<li>
				<div class="align-center">
					<input type="button" value="수정" id="photo_btn">
				</div>
				<div id="photo_choice" style="display: none;">
					<input type="file" id="upload"
						accept="image/gif,image/png,image/jpeg"> <input
						type="button" value="전송" id="photo_submit"> <input
						type="button" value="취소" id="photo_reset">
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
			<input type="button" value="회원탈퇴" onclick="">
		</p>
	</div>




