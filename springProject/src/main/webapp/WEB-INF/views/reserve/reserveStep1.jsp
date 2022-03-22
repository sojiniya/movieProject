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
		let pick_theaternum; //선택한 상영관번호
		let pick_movietime; //선택한 상영시간
		
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
					
					//극장 카테고리(지역) 리스트 내용 초기화
					$('#theater-local').empty();
					//cgv 리스트 내용 초기화
					$('#theater-cgv').empty();
					//info에 있는 cgv 내용 초기화
					$('#cgv_name').empty();
					//상영일자 내용 초기화
					$('#movie-date').empty();
					//상영시간 내용 초기화
					$('#movie-time').empty();
						
					
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
		
		
		
		//극장지역 선택 시 이벤트 발생
		$(document).on('click','#theater-local li',function(){
			let pick_localname = $(this).text(); // 클릭한 극장 지역(카테고리)명 변수에 저장
			
			//로딩 이미지 노출
			$('.loading2').show();
			
			$.ajax({
				type:'post',
				data:{pick_localname:pick_localname,pick_movie_num:pick_movie_num},
				url:'picklocal.do',
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					//로딩 이미지 감추기
					$('.loading2').hide();
					
					//cgv 목록 내용 초기화
					$('#theater-cgv').empty();
					
					//상영일자 내용 초기화
					$('#movie-date').empty();
					
					//상영시간 내용 초기화
					$('#movie-time').empty();
						
					//선택한 지역에 속해있는 극장 노출
					$(param.cgv_list).each(function(index,item){
						let output = '<li style="float:none; text-align:right";>';
						output += '<a href="#" theater-idx="'+ item.theater_num +'">';
						output += item.theater_name;
						output += '</a>';
						output += '</li>';

						//문서 객체에 추가
						$('#theater-cgv').append(output);
						
					});
				},
				error:function(){
					//로딩 이미지 감추기
					$('.loading2').hide();
					alert('네트워크 오류 발생');
				}
			});
			
		}); // end of click (극장지역 선택 시 이벤트 발생)
		
		
		//cgv 선택 시 이벤트 발생
		$(document).on('click','#theater-cgv li',function(){
			let pick_theatername = $(this).text(); // 클릭한 cgv명 변수에 저장
			pick_theaternum = $(this).children().attr('theater-idx');
			
			//로딩 이미지 노출
			$('.loading3').show();
			
			$.ajax({
				type:'post',
				data:{pick_theaternum:pick_theaternum,pick_movie_num:pick_movie_num},
				url:'pickcgv.do',
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					//로딩 이미지 감추기
					$('.loading3').hide();
					
					//info 영역에 선택한 cgv명 정보 노출
					$('#cgv_name').html('극장명 | ' + pick_theatername);
					
					//상영일자 내용 초기화
					$('#movie-date').empty();
				
					//상영시간 내용 초기화
					$('#movie-time').empty();
					
					//선택한 영화/상영관에 상영중인 시간대 노출
					$(param.date_list).each(function(index,item){
						let output = '<li style="float:none; text-align:right";>';
						output += item.movie_date;
						output += '</li>';

						//문서 객체에 추가
						$('#movie-date').append(output);
						
					});
					
				},
				error:function(){
					//로딩 이미지 감추기
					$('.loading3').hide();
					alert('네트워크 오류 발생');
				}
			});
			
		}); // end of click (cgv 선택 시 이벤트 발생)
		
		
		//상영 일자 선택 시 이벤트 발생
		$(document).on('click','#movie-date li',function(){
			let pick_moviedate = $(this).text(); // 클릭한 상영일자 변수에 저장
			
			//로딩 이미지 노출
			$('.loading4').show();
			
			$.ajax({
				type:'post',
				data:{pick_theaternum:pick_theaternum,pick_movie_num:pick_movie_num,pick_moviedate:pick_moviedate},
				url:'picktime.do',
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					//로딩 이미지 감추기
					$('.loading4').hide();
					
					//info 영역에 선택한 상영일자 정보 노출
					$('#cgv_date').html('상영일자 | ' + pick_moviedate);
					
					//상영시간 내용 초기화
					$('#movie-time').empty();
					
					//선택한 영화/상영관에 상영중인 시간대 노출
					$(param.time_list).each(function(index,item){
						let output = '<li style="float:none; text-align:right";>';
						output += item.movie_time;
						output += '</li>';

						//문서 객체에 추가
						$('#movie-time').append(output);
						
					});
					
				},
				error:function(){
					//로딩 이미지 감추기
					$('.loading4').hide();
					alert('네트워크 오류 발생');
				}
			});
			
		}); // end of click (상영 일자 선택 시 이벤트 발생)
		
		
		// 인원수 선택 및 합계 조회
		let adult_price = 10000;
		let youth_price = 8000;
		let old_price = 6000;
		let total_price = 0;
		let total_people = 0;
		
		let adult_sum = adult_price * $('#adult').val();
		let youth_sum = youth_price * $('#youth').val();
		let old_sum = old_price * $('#old').val();
		
		total_people = $('#adult').val() + $('#youth').val() + $('#old').val();
		toatal_price = adult_sum + youth_sum + old_sum;
		
		$('#total_people').text('총인원 ' + total_people + '명 / 총금액');
		$('#total_price').text(total_price);
		
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
		<div class="loading3" style="display:none;"><img src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif"></div>
		<div id="cgv_name"></div>
		<div id="cgv_date"></div>
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
				<div class="theater-cgv-list">
					<ul id="theater-cgv">
						<div class="loading2" style="display:none;"><img src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif"></div>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div style="width: 9%; height: 100%; border:1px black solid; float: left;">
		<div class="col-head">날짜</div>
		<div class="col-body">
			<div class="date-list">
				<ul id="movie-date">
					<div class="loading4" style="display:none;"><img src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif"></div>
				</ul>
			</div>
		</div>
	</div>
	<div style="width: 10%; height: 100%; border:1px black solid; float: left;">
		<div class="col-head">시간</div>
		<div class="col-body">
			<div class="time-list">
				<ul id="movie-time">
				
				</ul>
			</div>
		</div>
	</div>
	<div style="width: 20%; height: 100%; border:1px black solid; float: left;">
		<div class="col-head">인원 (최대 6명)</div>
		<div class="col-body">
			<div>
				<span>성인(20세 이상) / 10,000원 </span><input type="number" id="adult" name="adult">
			</div>
			<div>
				<span>청소년(19세 이하) / 8,000원 </span><input type="number" id="youth" name="youth">
			</div>
			<div>
				<span>경로우대(65세 이상) / 6,000원 </span><input type="number" id="old" name="old">
			</div>
			<div>
				<span id="total_people"></span><div id="total_price" name="total_price"></div>
			</div>
		</div>
	</div>
</div>	

<!-- 중앙 컨텐츠 끝 -->