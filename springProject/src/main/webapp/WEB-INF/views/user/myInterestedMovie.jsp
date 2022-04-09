<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script src="${pageContext.request.contextPath}/resources/css/hyoen.css"></script>   
<!DOCTYPE html>
<script type="text/javascript">
	function delete_btn(){
		if(confirm("정말로 삭제하시겠습니까?") == true){
			
			$.ajax({
				url:'deleteMyInterestedMovie.do',
				type:'post',
				data:{my_movie_num:$('#my_movie_num').val()},
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					if(param.result == 'success'){
						alert('성공적으로 삭제되었습니다.');
						return;
					}else if(param.result == 'notMatchUser_num'){
						alert('내가 본 영화랑 로그인 된 회원번호가 불일치 합니다.')
					}else{
						alert('삭제오류')
					}
				},
				error:function(){
					alert('네트워크 오류 발생');
				}
			});
		}else{
			alert('취소되었습니다.');
		}
	}

</script>
<style>
li #btn-del img{
	width: 30px;
    margin-left: -31px;
    position: relative;
}
.movie_reserve {
    font-weight: normal;
    width: 50px;
    padding: 1px 55px;
    font-size: 15px;
    background: #ed3124;
    border-radius: 7px;
    color:white;
}
strong {
    font-weight: 500;
    color: black;
}
a:link {
    text-decoration: none;
    color: white;
}
.box-image img {
    width: 200px;
    height: 260px;
}
</style>
<div class="sect-wishlist-lst">
	<c:if test="${count == 0}">
		관심이 있는 영화가 없습니다.
	</c:if>
	<c:if test="${count > 0}">
		<ul id="wishlist_container">
			<c:forEach var="InterestedMovie" items="${list}">
				<li>
					<div class="box-image">
						<span
							class="thumb-image"> <img 
								src="${pageContext.request.contextPath}/movie/imageView.do?movie_num=${InterestedMovie.movie_num}"
								onerror="errorImage(this)" />
						</span>
					</div>
					<br>
					<div class="box-contents">
						<a href="/movies/detail-view/?midx=85673"> <strong
							class="title">${InterestedMovie.movie_name}</strong>
							<br><br>
						</a> <span class="movie_reserve"> <a class="link-reservation"
							href="/ticket/?MOVIE_CD=20028988&MOVIE_CD_GROUP=20028988">예매하기</a>
						</span>
					</div>
				</li>
				<li id="btn-del">
					<input type="hidden" value="${InterestedMovie.my_movie_num}" id="my_movie_num">
					<button type="button" class="btn-del" id="btn-del" onclick="delete_btn()">
						<img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_del02.png"/>
					</button>
				</li>
			</c:forEach>
		</ul>
	</c:if>
</div>
<br><br><br><br><br><br><br>
<div class="align-center">${pagingHtml}</div>
