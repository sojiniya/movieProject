<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/reset.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/layout.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/module.css?20211209" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/content.css" />    
<!DOCTYPE html>
<div class="cols-content">
	<div class="col-detail">
		<div class="movielog-detail-wrap">
			<div class="sect-movielog-lst">
				<c:forEach var="watchedMovie" items="${list}">
					<ul id="watched_list_container">
						<li class="movie_info_80530">
							<div class="article-movie-info">
								<div class="box-image">
									<a id="phototicket_popup_80530" title="포스터 크게 보기" href="">
										<span class="thumb-image">
										<!-- 영화 포스터 넣어야함(영화 리스트쪽 하시는거보고 확인하자) --> 
										<img alt="" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80530/80530_185.jpg"
											onerror="errorImage(this)" />
									</span>
									</a>
								</div>
								<div class="box-contents">
									<div class="title">
										<a href="/movies/detail-view/?midx=80530"> <strong
											id="strong_80530">${watchedMovie.movie_name}</strong>
										</a>
									</div>

									<p class="date">${watchedMovie.movie_date}
										${watchedMovie.movie_time}</p>
									<p class="theater">CGV${watchedMovie.theater_name}
										/${watchedMovie.seat_num}석</p>
								</div>
								<button type="button" data="329787502" class="btn-del">
									<img
										src="https://img.cgv.co.kr/R2014/images/common/btn/btn_del.gif"
										alt="${watchedMovie.movie_name}">
								</button>
								<button type="button">
									리뷰남기기
								</button>
						</li>
					</ul>
			</div>
			</c:forEach>
			</ul>
		</div>
	</div>
</div>
