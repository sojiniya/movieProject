<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/resources/css/hyoen.css"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<div class="col-detail">
	<div class="tit-mycgv">
		<h3>내가 쓴 평점</h3>
	</div>
	<div class="warp-my-reviewlist">
		<c:if test="${count == 0}">
			내가 리뷰한 내용이 없습니다.
		</c:if>
		<c:if test="${count >0}">
			<c:forEach var="myReview" items="${list}">
				<ul class="point_col1">
					<li>
						<div class="sect-viw-rated">
							<div class="box-image">
								<a title="영화 상세 이동" href="/movies/detail-view/?midx=80530">
									<span class="thumb-image"> <img alt="(사라진 밤) 포스터"
										src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80530/80530_185.jpg" />
								</span>
								</a>
							</div>
							<div class="box-contents">
								<div class="title">
									<strong>사라진 밤</strong>
								</div>
								<ul class="writerinfo">
									<li class="mylist_user_id" id="eggArea_80530"><span
										id="eggSpan_80530" class='egg-icon'></span>${member.id}</li>
									<li id="liRegistDate80530">${myReview.review_reg_date}</li>
									<li><button type="button" class="btn-delete btn-del"
											data="32376099" midx="80530">삭제</button></li>
								</ul>
								<p id="pCommentText80530">${myReview.review_content}</p>
								<br>
								<div class="edit_wrap">
									<ul>
										<li class="btn_edit"><a href="javascript:void(0);"
											class="write_point" title="수정하기" data-CommentIdx="32376099"
											data-MovieIdx="80530" data-MovieTitle="사라진 밤">수정하기</a></li>
									</ul>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</c:forEach>
		</c:if>
	</div>
</div>
