<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 중앙 컨텐츠 시작 -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<div class="page-main">
	<h2>${movie.movie_name}</h2>
	<strong class="movie_auth"> <c:if
			test="${movie.movie_auth == 0}">
			<div class="auth_result">상영중</div>
		</c:if> <c:if test="${movie.movie_auth == 1}">
			<div class="auth_result">상영 예정</div>
		</c:if> <c:if test="${movie.movie_auth == 2}">
			<div class="auth_result">상영 종료</div>
		</c:if>
	</strong>
	<script>
	 $.ajax({
         url : 'http://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=6abbc96e3be813fe944d7bfe0ddb7f4b',
         type : 'get',             
         success : function(res){
             let str = '<ul><li>영화코드</li>'
             for(let i=0;i<=10;i++){
                 let searchMovie = res.searchMovieResult.searchMovieList[i]
                 str += '<li><p>'+searchMovie.movieCd+'</p><br>'                  
                 str += '<strong class="movie_name">'+searchMovie.movieNm+'</strong><br>'
                 str += '<p>'+searchMovie.movieNmEn+'</p><br>'
                 str += '<p>'+searchMovie.prdtYear+'</p>'
             	str += '</li>'
             }
             str += '</li>'
             str += '</div>'
             str += '</ul>'
             $('#movie_api').html(str)
         },
         // 실패했을 경우 넘어올 정보가 없으므로 매개변수 비워둠
         error : function(){
             alert('ERROR!')
         }
     })
	</script>
	
	
	
	
	
	
	
	<p>${movie.movie_content}</p>
	<hr size="1" width="100%" noshade="noshade">
	<div class="align-right">
		<input type="button" value="수정"> <input type="button"
			value="삭제" id="delete_btn"> <input type="button" value="목록"
			onclick="location.href='movieChart.do'">
	</div>
	<hr size="1" width="100%" noshade="noshade">
	<div id="reply_div">
		<span class="re-title">댓글 달기</span>
	</div>
</div>
<!-- 중앙 컨텐츠 끝 -->