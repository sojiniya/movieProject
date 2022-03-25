<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 콘텐츠 시작 -->
<div class="boardMain">
	<div class="board-detail">
		<h3 style="margin:0px 10px;">자주찾는 질문</h3>
		<div class="search_area">
			<input id="searchtext" type="text" class="c_input" title="검색어 입력" placeholder="검색어를 입력해 주세요" value style="width:275px;">
			<button type="button" class="round inblack" title="검색하기" id="btn_search">
				<span>검색하기</span>
			</button>
		</div>
		<div class="c_tab_wrap">
			<ul class="c_tab type_free">
				<li class="on">
					<a href="#" style="font-size: 13px;" title="선택된 탭메뉴">전체</a>
				</li>
				<li class>
					<a href="#" style="font-size: 13px;">예매/매표</a>
				</li>
				<li class>
					<a href="#" style="font-size: 13px;">결제수단</a>
				</li>
				<li class>
					<a href="#" style="font-size: 13px;">멤버쉽</a>
				</li>
				<li class>
					<a href="#" style="font-size: 13px;">영화관이용</a>
				</li>
			</ul>
		</div>
		<div class="tbl_area">
			<table class="tbl_notice_list">
				<colgroup>
					<col style="width:40px;">
					<col style="width:120px;">
					<col style="width:560px;">
					<col style="auto;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">구분</th>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
</div>