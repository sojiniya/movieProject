<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		$(".radio_b1").click(function(){
			if($("input[type='radio']").is(':checked')){
				$(".radio_v1").show();
				$(".radio_v2").hide();
			}

		});
		$(".radio_b2").click(function(){
			if($("input[type='radio']").is(':checked')){
				$(".radio_v2").show();
				$(".radio_v1").hide();
			}

		})
	})
</script>
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
								<input type="radio" id="qna" name="boardCate" class="radio_b1" value="0" data-modal="modal" checked>자주찾는 질문
								</label>
							</li>
							<li>
								<label for="news">
								<input type="radio" id="news" name="boardCate" class="radio_b2" value="1">뉴스/공지
								</label>
							</li>
						</ul>
					</td>
				</tr>
				<!-- 자바 스크립트 이용할 예정 -->
				<tr class="radio_v1">
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
								<label for="useTheater">
								<input type="radio" id="useTheater" name="writeCate" value="3">영화관이용
								</label>
							</li>
						</ul>
					</td>
				</tr>
				<tr class="radio_v2">
					<th scope="row">카테고리</th>
					<td>
						<ul class="type_list">
							<li>
								<label for="systemCheck">
								<input type="radio" id="systemCheck" name="writeCate" value="0" checked>시스템점검
								</label>
							</li>
							<li>
								<label for="theater">
								<input type="radio" id="theater" name="writeCate" value="1">극장
								</label>
							</li>
							<li>
								<label for="etc">
								<input type="radio" id="etc" name="writeCate" value="2">기타
								</label>
							</li>
						</ul>
					</td>
				</tr>
				<tr class="radio_v2">
					<th scope="row">영화관 선택</th>
					<td>
						<ul class="type_list">
							<li>
								<label for="notCheck">
								<input type="radio" id="notCheck" name="chooseTheater" class="noCheck" value="0" checked>선택하지 않음
								</label>
							</li>
							<li>
								<label for="Check">
								<input type="radio" id="Check" name="chooseTheater" value="1">선택함
								</label>
							</li>
							<li>
								<select name="지역">
									<option selected disabled>지역 선택</option>
									<option value="서울">서울</option>
									<option value="">경기</option>
									<option value="">인천</option>
									<option value="">강원</option>
								</select>
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