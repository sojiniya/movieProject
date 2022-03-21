<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 메인 시작 -->
<div class="page-main">
	<div class="contents">

                    <div class="video_wrap">
                        
                    <video autoplay muted>
                        <source src='https://adimg.cgv.co.kr/images/202203/Stellar/Stellar_1080x608.mp4' type='video/mp4'>
                        	이 브라우저는 Video 태그를 지원하지 않습니다. (Your browser does not support the video tag.)
                  		  </video>
                    <div class ="video_text">
                        <strong id="AD_movie_name" class="movieSelection_title">스텔라</strong><br>
                        <span id="AD_movie_sub" class="movieSelection_txt">최대시속 50KM, 자율주행차?!<br>본격 버라이어티 코미디</span>
                        <div class="movieSelection_video_controller_wrap">
     					<a href="http://ad.cgv.co.kr/click/CGV/CGV_201401/main@MovieSelection2021?ads_id%3d46812%26creative_id%3d66312%26click_id%3d86631%26maid%3D%26event%3d" id="AD_movie_url" class="btn_detail">상세보기</a>
                        	</div>
                        </div>
                    </div>
                    	<div class="movieChart_wrap">
                            <h3>무비차트</h3>
                        <a href="/movies/?lt=1&ft=0" id="btn_allView_Movie" class="btn_allView">전체보기</a>
                    </div>
                     <div class="swiper movieChart_list" id="movieChart_list">
                        <div class="swiper-wrapper">
                            
                                <div class="swiper-slide swiper-slide-movie">
                                    <div class="img_wrap" data-scale="false">
                                    <ul>
                                    <li>
                                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85673/85673_320.jpg" alt="뜨거운 피" onerror="errorImage(this)">
                                        <div class="movieAgeLimit_wrap">
                                            <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/grade-15.png" alt="15세 이상세">
                                        
                                        </div>
                                      
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movies/detail-view/?midx=85673" onclick="gaEventLog('PC_메인', '무비차트_영화상세', '뜨거운 피');" class="btn_movieChart_detail">상세보기</a>
                                        
                                            <a href="/ticket/?MOVIE_CD=20028988&MOVIE_CD_GROUP=20028988" onclick="gaEventLog('PC_메인', '무비차트_예매하기','뜨거운 피')" class='btn_movieChart_ticketing'>예매하기</a>
                                        
                                        </div>
                                        </li>
                                        </ul>
                                    </div>
                                </div>
                                
                                </div>
                </div>
</div>
<!-- 메인 끝 -->