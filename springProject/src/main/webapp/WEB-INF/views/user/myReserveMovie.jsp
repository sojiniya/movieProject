<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<!-- 2022.04.08 - 예매 취소를 위한 스크립트문 추가 // 정동윤 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('.btn-del').click(function(){
			let reserve_num = $(this).attr('reserve-idx'); // 예약된 예매 번호
			let revseat_num = $(this).attr('revseat-idx'); // 예약된 좌석 번호
			
			let check = confirm('예매를 취소하시겠습니까?');
			
			if(check){ // 예매 취소를 할 경우 ajax 처리
				
				$.ajax({
					type:'post',
					data:{reserve_num:reserve_num,revseat_num:revseat_num},
					url:'/project/reserve/deletereserve.do',
					//dataType:'json',
					cache:false,
					timeout:30000,
					success:function(){
						alert('예매가 취소되었습니다.');
						location.href='${pageContext.request.contextPath}/user/myReserveMovie.do';
					},
					 error:function(request,status,error){
					    alert("[네트워크 오류] code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					}
				}); // end of ajax	
				
			}
			
		}); // end of click (예매 취소 클릭 시 이벤트 발생)
		
	});
</script>
<style>
.box-image #MoviePoster {
    width: 170px;
}
</style>
<div class="cols-content">
	<div class="col-detail">
		<div class="movielog-detail-wrap">
			<div class="sect-movielog-lst">
				<c:if test="${count == 0}">
					<div class="result-display">예매한 영화가 없습니다.</div>
				</c:if>
				
				<c:if test="${count >0}">
				<c:forEach var="reserveMovie" items="${list}">
					<ul id="watched_list_container">
						<li class="movie_info_80530">
							<div class="article-movie-info">
								<div class="box-image">
									<a id="phototicket_popup_80530" title="포스터 크게 보기" href="">
										<span class="thumb-image">
										<!-- 영화 포스터 넣어야함(영화 리스트쪽 하시는거보고 확인하자) --> 
										<img id="MoviePoster" src="${pageContext.request.contextPath}/movie/imageView.do?movie_num=${reserveMovie.movie_num}"
											onerror="errorImage(this)" />
									</span>
									</a>
								</div>
								<div class="box-contents" style="margin-top: 60px;">
									<div class="title">
										<a href="/movies/detail-view/?midx=80530"> <strong
											id="strong_80530" style="font-size:20px;">${reserveMovie.movie_name}</strong>
										</a>
									</div>
									<c:set var="MovieTime" value="${reserveMovie.movie_date}"/> 
									<p class="date" style="font-size:17px">${fn:substring(MovieTime,0,10)}
										${reserveMovie.movie_time}</p>
									<p class="theater" style="font-size:16px">${reserveMovie.theater_name}
										/${reserveMovie.reserve_seat}</p>
								</div>
								<!-- 2022.04.08 예매취소 기능을 위해  reserve-idx="${reserveMovie.reserve_num}" 추가 // 정동윤-->
								<button type="button" data="329787502" class="btn-del" reserve-idx="${reserveMovie.reserve_num}" revseat-idx="${reserveMovie.revseat_num}">
									<img
										src="https://img.cgv.co.kr/R2014/images/common/btn/btn_del.gif"
										alt="${reserveMovie.movie_name}">
								</button>
							</div>
						</li>
					</ul>
				</c:forEach>
				</c:if>		
			</div>
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			<div class="align-center">${pagingHtml}</div><br>
		</div>
	</div>
</div>
