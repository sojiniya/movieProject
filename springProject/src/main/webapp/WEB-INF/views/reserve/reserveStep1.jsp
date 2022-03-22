<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		//다음 step 으로 가기위한 영화/상영관/시간/인원수... 정보를 저장하기 위한 변수 선언
		let pick_movie_num; //선택한 영화번호
		
		//영화 선택 시 이벤트 발생
		$('.movie_list li').click(function(){
			let movie_num = $(this).children().attr('movie-idx'); // 클릭한 영화의 영화번호 변수에 저장
			
			//로딩 이미지 노출
			$('#loading').show();
			
			$.ajax({
				type:'post',
				data:{movie_num:movie_num},
				url:'pickmovie.do',
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					//로딩 이미지 감추기
					$('#loading').hide();
					
					//info 영역에 선택한 영화 정보 노출
					$('#movie_name').html(param.movie.movie_name);
					$('#movie_genre').html(param.movie.movie_genre);
					$('#movie_pg').html(param.movie.movie_pg);
					if(param.movie.movie_photo1){ // DB에 이미지 있으면, 
						$('#movie_photo').css('display','').src(''); // 저장된 이미지 노출
					}else{ // DB에 이미지 없으면,
						$('#movie_photo').css('display',''); // 기본 이미지 노출
					}
					
					//다음 step으로 가기위한 영화 번호 변수에 저장
					pick_movie_num = param.movie.movie_num;
					
					//극장 카테고리(지역) 내용 초기화
					$('#theater-local').empty();
						
					// 선택한 영화가 상영하는 극장 카테고리(지역) 노출
					$(param.theater_local_name).each(function(index,item){
						let output = '<li style="float:none; text-align:right;">';
						output += item.theater_local;
						output += '</li>';

						
						//문서 객체에 추가
						$('#theater-local').append(output);
						
					});
				},
				error:function(){
					//로딩 이미지 감추기
					$('#loading').hide();
					alert('네트워크 오류 발생');
				}
			});
			
			
		}) // end of click (영화 선택 시 이벤트 발생)
	});
</script>
<div style="display:flex;">
	<div style="width: 33%; border: 1px solid black;">1.영화 및 극장 선택</div>
	<div style="width: 33%; border: 1px solid black;">2.좌석 선택</div>
	<div style="width: 33%; border: 1px solid black;">3.결제</div>
</div>
	
<div>
	<input style="" type="button" value="초기화" onclick="location.href='reserveStep1.do'">
</div>

<div id="info-banner" style="width: 100%; background: black; height: 150px; margin: 10px 0 10px 0">
	<div class="info-movie">
		<div id="loading" style="display:none;"><img src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif"></div>
		<div><img src="${pageContext.request.contextPath}/resources/images/default.png" width="120px" height="130px" style="float:left; margin-right: 20px; display:none" id="movie_photo"></div>
		<div id="movie_name"></div>
		<div id="movie_genre"></div>
		<div id="movie_pg"></div>
	</div>
	<div class="info-theater">
	</div>
	<div class="info-people">
	</div>
	<div>
		<form:form modelAttribute="ReserveVO" action="reserveStep2.do" id="reserveStep1_form">
			좌석 선택
		</form:form> 
	</div>
</div>

<div class="movie-form">
	<div id="movieselect" style="width: 30%; height: 100%; border:1px black solid; float: left;">
		<div class="col-head">영화</div>
		<div class="col-body">
			<c:if test="${empty movie_list}">
			<div style="text-align: center;">현재 상영중인 영화가 없습니다.</div>
		</c:if>
		<c:if test="${!empty movie_list}">
			<ul style="margin-top: 0px; padding-left: 0px; margin-bottom: 0px;" class="movie_list">
				<c:forEach var="movie" items="${movie_list}">
					<li style="margin: 5px; float: none; text-align: left;">
						<a href="#" movie-idx="${movie.movie_num}">
							<span>${movie.movie_pg}</span>
							<span>${movie.movie_name}</span>
						</a>
					</li>					
				</c:forEach>
			</ul>			
		</c:if>
		</div>
	</div>
	<div style="width: 30%; height: 100%; border:1px black solid; float: left;">
		<div class="col-head">극장</div>
		<div class="col-body">
			<div class="theater-list">
				<div class="theater-area-list">
					<ul id="theater-local">
						
					</ul>
				</div>
				<div class="theater-cgv-list"></div>
			</div>
		</div>
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

<!-- 중앙 컨텐츠 끝 -->