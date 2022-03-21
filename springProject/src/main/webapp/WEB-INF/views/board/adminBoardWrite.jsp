<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!-- 중앙 시작 -->
<div class="adminBoardWrite-main">
	<h3>관리자 글쓰기</h3>
	<form class="adminWriteForm" method="post" enctype="mutipart/form-data">
		<table class="tbl_notice_list">
			<tbody>
				<tr>
					<th scope="row">게시글 유형</th>
					<td>
						<ul class="type_list">
							<li>
								<label for="qna">
								<input type="radio" id="qna" name="boardCate" value="0" checked>자주찾는 질문
								</label>
							</li>
							<li>
								<label for="news">
								<input type="radio" id="news" name="boardCate" value="1">뉴스/공지
								</label>
							</li>
						</ul>
					</td>
				</tr>
				<!-- 자바 스크립트 이용할 예정 -->
				<tr>
					<th scope="row">카테고리</th>
					<td>
						<ul class="type_list">
							<li>
								<label for="ticket">
								<input type="radio" id="ticket" name="writeCate" value="0" checked>예매/매표
								</label>
							</li>
							<li>
								<label for="pay">
								<input type="radio" id="pay" name="writeCate" value="1">결제수단
								</label>
							</li>
							<li>
								<label for="memberShip">
								<input type="radio" id="memberShip" name="writeCate" value="2">멤버쉽
								</label>
							</li>
							<li>
								<label for="theater">
								<input type="radio" id="theater" name="writeCate" value="3">영화관이용
								</label>
							</li>
						</ul>
					</td>
				</tr>
				
				<tr>
					<th scope="row">제목</th>
					<td>
						<input name="boardTit" type="text" placeholder="제목을 입력하세요" />
					</td>
				</tr>
				<tr>
					<th scope="row">내용</th>
					<td>
						<textarea placeholder="제목을 입력하세요"></textarea> 
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<!-- 중앙 끝-->