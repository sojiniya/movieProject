<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>

<div class="boardMain">
	<div class="board-detail">
	<div class="c_check_warp">
		<div class="c_box qna_search">
			<strong class="c_tit">자주찾는 질문 빠른검색</strong>
			<br>
			<div class="board_search_box">
				<input id="searchtext" type="text" title="검색어 입력" placeholder="검색어를 입력해 주세요.">
				<button type="button" class="btn_search" title="검색하기" id="btn_search">검색</button>
			</div>
		</div>
		<div class="c_box inquiry" style="cursor:pointer;">
			<strong class="c_tit">건의 및 문의사항</strong>
			<span class="c_txt">건의 및 문의사항을 전달해 주세요.</span>
			<a href="#">글쓰기</a>
		</div>
		<div class="c_box my_advice" style="cursor:pointer;">
			<strong class="c_tit">내 상담내역 확인</strong>
			<span class="c_txt">문의하신 내용을 확인하실 수 있습니다.</span>
			<a href="#" target="_blank">내역 조회</a>
		</div>
	</div>
	<div class="customer_notice_area">
		<div class="notice_area">
			<a href="#">
				<span class="news_tit">공지/뉴스</span>
			</a>
			<ul class="txt">
				<li>
				<a href="#"></a>
				<span class="day"></span>
				</li>
				<li>
				<a href="#"></a>
				<span class="day"></span>
				</li>
				<li>
				<a href="#"></a>
				<span class="day"></span>
				</li>
				<li>
				<a href="#"></a>
				<span class="day"></span>
				</li>
				<li>
				<a href="#"></a>
				<span class="day"></span>
				</li>
			</ul>
			<a href="#" class="more">공지/뉴스 더보기</a>
		</div>
	</div>
	</div>
</div>
<!-- 중앙컨텐츠 끝 -->
