<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<style type="text/css">
div {
    display: block;
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
						output += '<a title="'+ item.theater_name + '" class="theater-name" data-num="'+item.theater_num+'">' + item.theater_name + '</a>';
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
			
			//cgv지점명 클릭시 지점별 인포사진 교체
			$('#theater_img_container').find('img').attr('src','${pageContext.request.contextPath}/theater/theaterImage.do?theater_num='+theater_num);	
			//cgv지점명 클릭시 인포사진 위에 극장지점명(ex cgv강남) 표시
			$('h4').find('span').text(theater_name).show();
			
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
				
				/*
				$(param.list).each(function(index,item){
					let output = '<div class="area">';
					output += '<ul>';
					output += '<li class="on">';
					output += '<a title="'+ item.theater_name + '" class="theater-name" data-num="'+item.theater_num+'">' + item.theater_name + '</a>';
					output += '</li>';
					output += '</ul>';
					output += '</div>';

					//문서 객체에 극장지역 리스트 추가
					$('#area').append(output);
					
				});*/
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	}
   
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

<a href="${pageContext.request.contextPath}/theater/theaterWrite.do">극장지역등록폼text</a>

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
     <strong class="title">서울 강남구 테헤란로123</strong>
</div>
<hr size="1" noshade="noshade" width="100%">
<!-- 상영일자 표시 -->
<div id="time_output"></div>
<!-- 상영일자 표시 -->
<hr size="1" noshade="noshade" width="100%">
<!-- 중앙 컨텐츠 끝 -->