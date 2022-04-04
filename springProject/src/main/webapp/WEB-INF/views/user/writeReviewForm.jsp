<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="${pageContext.request.contextPath}/resources/css/hyoen.css"></script>
<style>
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: left;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
</style>   
<!DOCTYPE html>
	<form:form modelAttribute="movieReviewVO" action="writeReview.do">
		<form:hidden path="movie_num"/>
		<span class="text-bold">별점을 선택해주세요</span>
		<label for="rate1">★</label>
		<form:radiobutton path="review_rate" value="1" name="reviewStart"></form:radiobutton>
		<label for="rate2">★</label>
		<form:radiobutton path="review_rate" value="2" name="reviewStart"></form:radiobutton>
		<label for="rate3">★</label>
		<form:radiobutton path="review_rate" value="3" name="reviewStart"></form:radiobutton>
		<label for="rate4">★</label>
		<form:radiobutton path="review_rate" value="4" name="reviewStart"></form:radiobutton>
		<label for="rate5">★</label>
		<form:radiobutton path="review_rate" value="5" name="reviewStart"></form:radiobutton>
		<div>
		<form:textarea class="col-auto form-control" path="review_content"
				  placeholder="영화 리뷰를 작성해주세요"></form:textarea>
		</div>
		<div class="align-center">
			<form:button>리뷰 등록하기</form:button>
			<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
	</form:form>
	
