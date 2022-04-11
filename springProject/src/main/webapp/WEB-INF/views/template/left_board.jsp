<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<style>
.col-aside li.on{
color:#fdfcf0;
background:#fb4357;
}
</style>
<script type="text/javascript">
$( document ).ready(function() {
     //$(this).parent().children("a").removeClass("on");
     //$(this).addClass("on").prevAll("a").addClass("on");
     
     $('li').removeClass('on');
     if(location.href.indexOf('/boardMain.do') > 0){
	     $('#menu_link1').addClass('on');
   	 }else if(location.href.indexOf('/qnaList.do') >= 0){
         $('#menu_link2').addClass('on');
     }else if(location.href.indexOf('/newsList.do') >= 0){
    	 $('#menu_link3').addClass('on');
     }else if(location.href.indexOf('/userQnaList.do') >= 0){
    	 $('#menu_link4').addClass('on');
     }else if(location.href.indexOf('/adminBoardList.do') >= 0){
    	 $('#menu_link5').addClass('on');
     }else if(location.href.indexOf('/adminBoardWrite.do') >= 0){
    	 $('#menu_link6').addClass('on');
     }
});
</script>  
<!-- 왼쪽 메뉴 시작 -->
<div class="col-aside">
	<ul>
		<li id="menu_link1"><a href="${pageContext.request.contextPath}/board/boardMain.do">고객센터 메인</a></li>
		<li id="menu_link2"><a href="${pageContext.request.contextPath}/board/qnaList.do">자주찾는 질문</a></li>
		<li id="menu_link3"><a href="${pageContext.request.contextPath}/board/newsList.do">공지/뉴스</a></li>
		<li id="menu_link4"><a href="${pageContext.request.contextPath}/board/userQnaList.do">문의/건의</a></li>
		<c:if test="${!empty user_num && user_auth == 3}">
		<li id="menu_link5"><a href="${pageContext.request.contextPath}/board/adminBoardList.do">게시글 관리</a></li>
		<li id="menu_link6"><a href="${pageContext.request.contextPath}/board/adminBoardWrite.do">게시글 등록</a></li>
		</c:if>
	</ul>
</div>
<!-- 왼쪽 메뉴 끝 -->