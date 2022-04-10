<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<div class="sect-common">
    <div class="mycgv-info-wrap">
		<div class="skipnaiv" >
			<a href="#menu" id="skipPersoninfo">개인화영역 건너띄기</a>
		</div>
        <div class="sect-person-info">
        	<h2 class="hidden">개인화 영역</h2> 
        	<div class="box-image">
				<span class="thumb-image">
					<c:if test="${!empty member.mem_photo}">
					<span class="profile-mask"><img src="${pageContext.request.contextPath}/user/photoView.do" alt="김재현님 프로필 사진"/></span>
					</c:if>
					<c:if test="${empty member.mem_photo}">
					<span class="profile-mask"><img src="${pageContext.request.contextPath}/resources/images/face.png"/></span>
					</c:if>
				</span>
        	</div>
        	<div class="box-contents newtype">
        		<div class="person-info">
        			<strong>${member.id}</strong>
        			<em>${member.mem_name}</em>
        		</div>
        		<div class="grade-info">
        	        
                    <p style="margin-bottom:4px;color: #342929;font-family: 'NanumBarunGothicBold', '맑은 고딕', '돋움', Dotum, sans-serif;font-size: 20px;line-height: 20px;">
                        
                            고객님의 등급은   
                        <c:if test="${member.mem_grade < 3}"> 
                        <strong class="txt-purple">브론즈</strong>입니다.             
                        </c:if>
                        <c:if test="${member.mem_grade >= 3 && member.mem_grade <= 5}"> 
                        <strong class="txt-purple">실버</strong>입니다.             
                        </c:if>
                        <c:if test="${member.mem_grade > 5}"> 
                        <strong class="txt-purple">골드</strong>입니다.             
                        </c:if>
                    </p>
        		</div>
        	</div>
        </div>
    </div>
</div>

<div class="mycgv-main1">
<div class="sect-mycgv-reserve movielog col3">
    <div class="box-polaroid">
        <div class="box-inner preegg">
            <a href="${pageContext.request.contextPath}/user/myInterestedMovie.do" title="기대되는 영화">
                <h3>기대되는 영화</h3>
                <span>보고 싶은 영화들을 미리 <br>담아두고 싶다면?</span>
            </a>
        </div>
        <div class="box-inner watched">
            <a href="${pageContext.request.contextPath}/user/myWatchedMovie.do" title="내가 본 영화">
                <h3>내가 본 영화</h3>
                <span>관람한 영화들을 한번에 <br />모아 보고 싶다면?</span>
            </a>
        </div>
        <div class="box-inner mvdiary">
            <a href="${pageContext.request.contextPath}/user/myReview.do" title="내가 쓴 평점">
                <h3>내가 쓴 평점</h3>
                <span>관람 후 내 감상평을 적어 <br />추억하고 싶다면?</span>
            </a>
        </div>
    </div>
</div>
<div class="cont1">
<div class="cont2"><span>예매번호로만 티켓을 찾을 수 있으니 반드시 확인 부탁드립니다.</span></div>
<div class="tit-mycgv">
	<h3 >MY 예매내역</h3>
	<p>
		<em>
			<c:if test="${reserveCount ==0}">0건</c:if>
			<c:if test="${reserveCount >0}">${reserveCount}건</c:if>
		</em> 
		<a href="${pageContext.request.contextPath}/user/myReserveMovie.do" style="float:right">예매내역 더보기 > </a>
	</p>
	
</div>

<div class="sect-base-booking">
	<div class="box-polaroid box-size">
		<div class="box-inner" style="font-size: 17px;">
			<c:if test="${reserveCount == 0}">
				<div class="lst-item">고객님의 최근 예매내역이 존재하지 않습니다.</div>
			</c:if>
			<br>
			<c:if test="${reserveCount >0}">
				<c:forEach var="reserveList" items="${reserveList}">
					<span><a href="${pageContext.request.contextPath}/movie/movieDetail.do?movie_num=${reserveList.movie_num}">&emsp;&emsp;${reserveList.movie_name}</a>/
					<c:set var="MovieTime" value="${reserveList.movie_date}"/>${fn:substring(MovieTime,0,10)}/
					${reserveList.movie_time}/
					${reserveList.reserve_seat}</span><br>
				</c:forEach>
			</c:if>
		</div>
	</div>
</div>
<div class="tit-mycgv2">
<h3>MY Q&amp;A</h3>
		<p>
			<em>
				<c:if test="${myQnACount ==0}">0건</c:if>
				<c:if test="${myQnACount >0}">${myQnACount}건</c:if>
			</em>
			
			<a href="${pageContext.request.contextPath}/board/myList.do" style="float:right">MY Q&amp;A 더보기 > </a>
		</p>
		</div>
<div class="box-polaroid box-size1">
<div class="box-inner2">
	<div class="col-myqna" style="font-size: 17px;">
		<c:if test="${myQnACount ==0}">
			<ul class="showLine">
				<li>고객님의 1:1 문의내역이 존재하지 않습니다.</li>
			</ul>
		</c:if>
		<c:if test="${myQnACount >0}">
			<c:forEach var="myQnA" items="${myQnA}">
				<span>
					<a href="${pageContext.request.contextPath}/board/myList.do">${myQnA.board_title}</a>/
					<c:set var="RegisterDate" value="${myQnA.board_reg_date}"/>${fn:substring(RegisterDate,0,10)}/
				</span><br>
			</c:forEach>
		</c:if>
		
	</div>
</div>
</div>
</div>
</div>

