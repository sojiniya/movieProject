<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script src="${pageContext.request.contextPath}/resources/css/hyoen.css"></script>      
<!DOCTYPE html>
<div class="cols-content">
	<div class="col-detail">
		<div class="movielog-detail-wrap">
			<div class="sect-movielog-lst">
				<c:if test="${count == 0}">
					리뷰한 내용이 없습니다.
				</c:if>
				
				<c:if test="${count >0}">
				<c:forEach var="myReview" items="${list}">
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
										<a href=""> <strong
											id="strong_80530">${myReview.movie_name}</strong>
										</a>
									</div>

									<p class="date">${myReview.review_reg_date}</p>
									<p class="theater">CGV${watchedMovie.theater_name}
										/${myReview.review_rate}점</p>
									<p>"${myReview.review_content}"</p>
								</div>
								<button type="button" data="329787502" class="btn-del">
									<img
										src="https://img.cgv.co.kr/R2014/images/common/btn/btn_del.gif"
										alt="${myReview.movie_name}">
								</button>
								<button type="button" onclick="location.href='${pageContext.request.contextPath}/user/modifyReviewForm.do?review_num=${myReview.review_num}'">
									수정하기
								</button>
							</div>
						</li>
					</ul>
				</c:forEach>
				</c:if>	
			</div>
			<div class="align-center">${pagingHtml}</div>
		</div>
	</div>
</div>
