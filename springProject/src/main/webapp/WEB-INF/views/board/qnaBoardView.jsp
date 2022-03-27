<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board.reply.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/videoAdapter.js"></script>
<style>
table{
	width:100%;
	border:none;
	border-collapse:collapse;
}
table td, table th{
	border:none;
	padding:5px;
}
</style>
<div class="boardMain">
	<div class="board-detail">
		<h3 style="margin:0px 10px;">자주찾는 질문</h3>
		<div class="board_view_area">
			<ul class="top_title_faq">
				<li style="display:none">${board.board_num}</li>
				<li class="title">
					<span>[<em>${board.cate_name}</em>]</span>
					<span><em>${board.board_title}</em></span>
				</li>
				<li class="stit_area">
					<span>등록일 <em>${board.board_reg_date}</em></span>
					<span>조회수 <em>${board.board_hit}</em></span>
				</li>

				

				</ul>
				<div class="view_area">
					${board.board_content}
				</div>
				<div class="customer_btn">
					<c:if test="${!empty user_num && user_auth == 3}">
					<button type="button" class="round inwhite" id="btn_list">
						<span>수정</span>
					</button>
					<button type="button" class="round inred" id="btn_list">
						<span>삭제</span>
					</button>
					</c:if>
					<button type="button" class="round inblack" id="btn_list">
						<span>목록</span>
					</button>
				</div>
				<div class="btm_sup_list">
					<ul class="line_sup_next">
						<li class="stit">이전글</li>
						<li class="name"><a href="#" class="txt"></a></li>
						<li>등록일<span class="check_num"></span></li>
					</ul>
					<ul class="line_sup_prev">
						<li class="stit">다음글</li>
						<li class="name"><a href="#" class="txt"></a></li>
						<li>등록일<span class="check_num"></span></li>
					</ul>
				</div>
		</div>
		
	</div>
</div>
<!-- 중앙 컨텐츠 끝 --> 