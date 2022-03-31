<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<style type="text/css">
div {
    display: block;
}
ul img {
   display:inline-block;
}
div, ul, li, form, font, a{
	font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-size: 100%;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    word-break: break-all;
}
ul.time-choice{
	list-style: none;
}
ul.time-choice li{
	display:inline-block;
	width:100px;
	padding:20px 20px 30px 20px;
	font-size:18px;
	cursor:pointer;
}
div.area ul li a, div.sect-city ul li a{
	cursor:pointer;
}


/*밑부터 테스트*/
div[class^="sect-"] {
    clear: both;
    zoom: 1;
}
/*아이콘*/
.sect-showtimes .col-times .ico-grade {
    top: -2px;
    left: -1px;
}
.ico-grade.grade-15 {
    background-position: -72px 0;
}
.ico-grade {
    display: block;
    position: absolute;
    background: url(https://img.cgv.co.kr/R2014/images/sprite/sprite_icon.png) no-repeat;
    font: 0/0 a;
    zoom: 1;
}
/*제목*/
.info-movie {
    float: left;
    height: 30px;
    color: #cccccc;
    font-size: 12px;
    border-right: 1px solid white;
    width: 100%;
    margin: 10px;
}
.sect-showtimes .col-times > .info-movie strong {
    margin-right: 5px;
    color: #000;
    font-size: 16px;
}
/*상영중*/
.round > * {
    box-sizing: border-box;
    -moz-box-sizing: border-box;
    width: 100%;
    height: 100%;
    padding: 0 5px 0;
}
.round, .round > * {
    display: inline-block;
    position: relative;
}
em {
    font-style: italic;
}
.sect-showtimes .col-times > .info-movie .round {
    line-height: 16px;
    vertical-align: top;
}
.round.lightblue {
    border: 2px solid #3e82a4;
    color: #3e82a4;
}
.round {
    line-height: 23px;
    font-weight: 500;
    font-size: 12px;
    text-align: center;
    vertical-align: middle;
}
i {
    font-style: italic;
}
.sect-showtimes .info-hall {
    clear: both;
    margin-bottom: 5px;
    background: url(https://img.cgv.co.kr/r2014/images/common/ico/ico_arrow03.png) no-repeat 2px 50%;
}
.sect-showtimes .type-hall, .sect-showtimes .info-hall {
    zoom: 1;
}
ul ul {
    list-style-type: none;
}
.sect-showtimes .info-timetable > ul > li {
    float: left;
    position: relative;
    width: 60px;
    height: 36px;
    margin-right: -1px;
    padding-top: 5px;
    border: 1px solid #cbcabe;
    line-height: 1.4;
    text-align: center;
}
.showtimes-wrap .early, .showtimes-wrap .midnight, .showtimes-wrap .early, .showtimes-wrap .midnight, .showtimes-wrap .ico_script, .descri-info > ul > li > a, .sect-showtimes .info-timetable a > em {
    color: #333;
}
.sect-showtimes .info-timetable em {
    display: block;
    font-family: verdana, sans-serif;
    font-size: 12px;
    font-weight: bold;
}
.sect-showtimes .info-timetable span {
    display: inline-block;
    font-size: 11px;
}
.txt-lightblue {
    color: #2275a4 !important;
}
.sect-showtimes > ul > li:first-child {
    border-top: 0 none;
}
.sect-showtimes > ul > li {
    padding: 40px 0;
    border-top: 1px solid #474746;
}
.sect-showtimes > ul > li:after {
    content: '';
    clear: both;
    display: block;
}
.sect-showtimes .type-hall:after, .sect-showtimes .info-hall:after {
    content: '';
    clear: both;
    display: block;
}
</style>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//극장지역 선택 시 이벤트 발생
$(function(){
	let theater_local; //선택한 지역명(서울,경기,인천 ...)
	let theater_num;
		$(document).on('click','.theater-choice',function(){
			$.ajax({
				type:'post',
				data:{theater_local:$(this).text()},// 클릭한 극장 지역명 저장
				url:'selectListData.do',
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){	
					$('#area').empty();
					//선택한 지역에 속해있는 극장리스트 노출
					$(param.list).each(function(index,item){
						let output = '<div class="area">';
						output += '<ul>';
						output += '<li class="on">';
						output += '<a title="'+ item.theater_name + '" class="theater-name" data-num="'+item.theater_num+'" data-addr="'+item.theater_addr+'">' + item.theater_name + '</a>';
						output += '</li>';
						output += '</ul>';
						output += '</div>';

						//문서 객체에 극장지역 리스트 추가
						$('#area').append(output);
						
					});
				},
				error:function(){
					alert('네트워크 오류 발생');
				}
			});
			
		}); // end of click (극장지역 선택 시 이벤트 발생)
		
		//극장관 등록 후 cgv지점을 클릭하면 지점별 극장 인포사진 노출
		$(document).on('click','.theater-name',function(){
			theater_num = $(this).attr('data-num');
			let theater_name = $(this).text();
			let theater_addr = $(this).attr('data-addr');
			
			//cgv지점명 클릭시 지점별 인포사진 교체
			$('#theater_img_container').find('img').attr('src','${pageContext.request.contextPath}/theater/theaterImage.do?theater_num='+theater_num);	
			//cgv지점명 클릭시 인포사진 위에 극장지점명(ex cgv강남) 표시
			$('h4').find('span').text(theater_name).show();
			$('.movie-title').text(theater_addr)
			
			//상영관명과 상영관 이미지 출력 후 상영 정보 호출
			//오늘 날짜 추출
			let times = getCurrentWeek();
			let movie_date = times[0].split('-');
			movie_date = movie_date[0] + '/' + movie_date[1] + '/' + movie_date[2];
			getTimeList(movie_date);
			
	});	
		
	//오늘부터 7일 날짜 출력하기	
	function getCurrentWeek(){
	    const day = new Date();
		const result = [day.toISOString().slice(0,10)];

	   	for(let i=1;i<7;i++){
	    	day.setTime(day.getTime() + 86400000);
	    	result.push(day.toISOString().slice(0,10));
	   }
	   return result;
   }
   let times = getCurrentWeek();
   $(times).each(function(index,items){
	   let time = items.split('-');
	   time = time[0] + '/' + time[1] + '/' + time[2];
	   
	   let output = '<ul class="time-choice">';
	   output += '<li data-time="'+time+'">'+time+'</li>';
	   output += '</ul>';
	   $('#time_output').append(output);
   })

   //날짜를 클릭하면 상영 정보를 구해옴 
   $(document).on('click','.time-choice li',function(){
	   let movie_date = $(this).attr('data-time');
	   
	   if(!theater_num) return;
	   
	   getTimeList(movie_date);
	}); // end of click
	
	//상영 정보 호출 함수
	function getTimeList(movie_date){
		$.ajax({
			type:'post',
			data:{movie_date:movie_date,theater_num:theater_num},
			url:'selectTimeListAjax.do',
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){	
				//$('#area').empty();
				
				let movie_name;
				let movie_genre;
				let movie_pg;
				//let movie_auth;
				$(param).each(function(index,item){
				    movie_name = item.movie_name;
				    movie_genre = item.movie_genre;
				    movie_pg = item.movie_pg;
				    //movie_auth = item.movie_auth;
					/*
					let output = '<div class="area">';
					output += '<ul>';
					output += '<li class="on">';
					output += '<a title="'+ item.theater_name + '" class="theater-name" data-num="'+item.theater_num+'">' + item.theater_name + '</a>';
					output += '</li>';
					output += '</ul>';
					output += '</div>';

					//문서 객체에 극장지역 리스트 추가
					$('#area').append(output);
					*/
				    /* if(12 <= movie_pg && movie_pg < 15){
						$('.movie-pg').find('img').attr('src','https://img.cgv.co.kr/R2014/images/common/flag/age/grade-12.png');
					}else if(15 <= movie_pg && movie_pg < 19){
						$('.movie-pg').find('img').attr('src','https://img.cgv.co.kr/R2014/images/common/flag/age/grade-15.png');
					}else if(19 <= movie_pg.text(movie_pg)){
						$('.movie-pg').find('img').attr('src','https://img.cgv.co.kr/R2014/images/common/flag/age/grade-19.png');
					}else{
						$('.movie-pg').find('img').attr('src','https://img.cgv.co.kr/R2014/images/common/flag/age/grade-all.png');
					} */
				});
				$('.movie-name').text(movie_name);
				$('.movie-genre').text(movie_genre);
				$('.movie-pg').text(movie_pg);
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	}//end

});

</script>
<div class="favorite-wrap">
	<div class="sect-city">
		<ul>
			<li class="on">
			<a class="theater-choice">서울</a>
			<a class="theater-choice">경기</a>
			<a class="theater-choice">인천</a>
			<a class="theater-choice">강원</a>
			<a class="theater-choice">대구</a>
			<a class="theater-choice">대전/충청</a>
			<a class="theater-choice">경상</a>
			<div id="area"></div>
			</li>
		</ul>
	</div>
</div>

<c:if test="${!empty user_num && user_auth==3}">
	<div class="align-right">
		<input type="button" value="극장등록" onclick="location.href='${pageContext.request.contextPath}/theater/theaterWrite.do'">
	</div>
</c:if>

<hr size="1" noshade="noshade" width="100%">
<div>
</div>
<!-- THEATER 삽입 START -->
<div class="wrap-theater">
	<h3>
		<img alt="theater" src="https://img.cgv.co.kr/R2014/images/title/h3_theater.gif">
	</h3>
</div>
<hr size="1" noshade="noshade" width="100%">
<!-- THEATER 삽입 END -->
<!-- 지점별 THEATER 삽입 시작 -->
<div class="sect-theater">
	<div id="theatername_container"> <!-- <div class="sect-theater" id="theatername_container"> -->
		<h4 class="theater-ti">
			<!-- 디폴트값 cgv강남으로 지정 -->
			<span class="theater-name">cgv강남</span>	<!-- <span class="theater-name">CGV강남</span> -->
		</h4>
		<div class="wrap-theaterinfo">
			<div class="box-image">
				<div class="thumb-image" id="theater_img_container">
					<!-- cgv강남점을 디폴트 이미지로 -->
					<%-- <img src="${pageContext.request.contextPath}/theater/theaterImage.do?theater_num=24"> --%>
					<img src="https://img.cgv.co.kr/Theater/Theater/2014/1211/CGVgangnam.jpg">
				</div>
			</div>
		</div>
	</div>
</div>
<div class="theater-info">
     <strong class="movie-title">서울 강남구 테헤란로123</strong>
</div>
<hr size="1" noshade="noshade" width="100%">
<!-- 상영일자 표시 -->
<div id="time_output"></div>
<!-- 상영일자 표시 -->
<hr size="1" noshade="noshade" width="100%">

<c:if test="${!empty user_num && user_auth==3}">
	<div class="align-right">
		<input type="button" value="상영정보등록" onclick="location.href='${pageContext.request.contextPath}/time/timeInsert.do'">
	</div>
</c:if>

<hr size="1" noshade="noshade" width="100%">

<!-- 영화리스트 시작(참고용) -->
<div class="sect-showtimes">
	<ul style="display: block;list-style: none;list-style-type: disc;margin-block-start: 1em;margin-block-end: 1em;margin-inline-start: 0px;margin-inline-end: 0px;padding-inline-start: 40px;">
		<li style="display:list-item;text-align: -webkit-match-parent;list-style: none;">
			
			<div class="col-times">

				<div class="info-movie">
					<span class="movie-pg">
						<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/grade-15.png" width="20px" height="20px"> <!-- <span class="ico-grade grade-15">15세 이상</span> -->
					</span>
					<a href="#" target="_parent">
					<strong style="font-weight: bold;" class="movie-name">극장판 주술회전</strong></a> 
							<span class="round lightblue">
								<em>상영중</em>
							</span>
							<span class="">
								<em> </em>
							</span>
							<i class="movie-genre"> 애니메이션</i> / <i> 105분</i> / <i> 2022.03.31 개봉</i>
				</div>
				<div class="type-hall">
					<div class="info-hall">
						<ul style="display: block;list-style: none;list-style-type: disc;margin-block-start: 1em;margin-block-end: 1em;margin-inline-start: 0px;margin-inline-end: 0px;padding-inline-start: 40px;">
							<li style="display: list-item;text-align: -webkit-match-parent;list-style: none;">총 124석</li>
						</ul>
					</div>
					
					<div class="info-timetable">
						<ul style="display: block;list-style: none;list-style-type: disc;margin-block-start: 1em;margin-block-end: 1em;margin-inline-start: 0px;margin-inline-end: 0px;padding-inline-start: 40px;">
							<li style="display: list-item;text-align: -webkit-match-parent;list-style: none;">
								
								<a href="/ticket/?MOVIE_CD=20028797&amp;MOVIE_CD_GROUP=20028797&amp;PLAY_YMD=20220330&amp;THEATER_CD=0056&amp;PLAY_START_TM=1850&amp;AREA_CD=13&amp;SCREEN_CD=006" 
								target="_top" data-theatercode="0056" data-playymd="20220330"
								data-screencode="006" data-playnum="6" data-playstarttime="1850"
								data-playendtime="2045" data-theatername="CGV 강남"
								data-seatremaincnt="86">
								<em>18:50</em>
								<span class="txt-lightblue">
									<span class="hidden">잔여좌석</span>86석
								</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
				
				
				
			</div>
		</li>
	</ul>
</div>
<!-- 영화리스트  끝 -->
<hr size="1" noshade="noshade" width="100%">
<div>
<p class="info-noti"></p>
<p>ㆍ입장 지연에 따른 관람 불편을 최소화하기 위해 영화는 10분 후 상영이 시작됩니다.</p>
<p></p>
</div>
<!-- 중앙 컨텐츠 끝 -->