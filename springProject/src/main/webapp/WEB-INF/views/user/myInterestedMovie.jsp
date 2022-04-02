<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script src="${pageContext.request.contextPath}/resources/css/hyoen.css"></script>   
<!DOCTYPE html>
<div class="sect-wishlist-lst">
	<c:if test="${count == 0}">
		관심이 있는 영화가 없습니다.
	</c:if>
	<c:if test="${count > 0}">
		<ul id="wishlist_container">
			<c:forEach var="watchedMovie" items="${list}">
				<li>
					<div class="box-image">
						<a href="/movies/detail-view/?midx=85673"> <span
							class="thumb-image"> <img alt="${watchedMovie.movie_name}"
								src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85673/85673_185.jpg"
								onerror="errorImage(this)" />

						</span>
						</a>
					</div>
					<div class="box-contents">
						<a href="/movies/detail-view/?midx=85673"> <strong
							class="title">${watchedMovie.movie_name}</strong>
						</a> <span class="like"> <a class="link-reservation"
							href="/ticket/?MOVIE_CD=20028988&MOVIE_CD_GROUP=20028988">예매</a>


						</span>
					</div>
					<button type="button" class="btn-del" value="85673">
						<img
							src="https://img.cgv.co.kr/R2014/images/common/btn/btn_del02.png"
							alt="${watchedMovie.movie_name}삭제" />
					</button>
				</li>
			</c:forEach>
		</ul>
	</c:if>
</div>
<div class="align-center">${pagingHtml}</div>
