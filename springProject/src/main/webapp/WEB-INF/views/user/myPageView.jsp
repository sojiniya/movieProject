<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<head>
<script src="${pageContext.request.contextPath}/resources/css/hyoen.css"></script>
<div class="sect-common">
<input type="hidden" id="isTown" name="isTown" value="Y" />
<input type="hidden" id="userTownMemberInfo" name="userTownMemberInfo" value="" />
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
        			<button type="button" title="개인정보 수정" onclick="${pageContext.request.contextPath}/user/update.do">나의 정보 변경</button>
        		</div>
        		<div class="grade-info">
        	        
                    <p style="margin-bottom:4px;color: #342929;font-family: 'NanumBarunGothicBold', '맑은 고딕', '돋움', Dotum, sans-serif;font-size: 20px;line-height: 20px;">
                        
                            고객님은   
                        <c:if test="${member.mem_grade < 3}"> 
                        <strong class="txt-purple">브론즈</strong>입니다.             
                        </c:if>
                        <c:if test="${member.mem_grade >= 3}"> 
                        <strong class="txt-purple">실버</strong>입니다.             
                        </c:if>
                        <c:if test="${member.mem_grade >= 5}"> 
                        <strong class="txt-purple">골드</strong>입니다.             
                        </c:if>
                    </p>

        			<button type="button" id="view_usergrade" class="round black"><span>MY 지난등급이력 보기</span></button> 
        			

                    <div class="mycgv_btn_special2">
					<!-- 대구 아이피접속자 중 : 동성로 미가입 고객시 a.special_pop_text 노출/ 가입 고객은 a.special0_pop 노출 부탁드립니다.
						또한 아무 해당 없는 고객에게는 .mycgv_btn_special2 에 클래스 none 추가 부탁드립니다. 
						-->
					   
				    </div>

        		</div>
        	</div>
        </div>
    </div>
</div>

<div class="sect-mycgv-reserve movielog col3">
    <div class="box-polaroid">
        <div class="box-inner preegg">
            <a href="http://www.cgv.co.kr/user/movielog/" title="기대되는 영화">
                <h3>기대되는 영화</h3>
                <span>보고 싶은 영화들을 미리 <br>담아두고 싶다면?</span>
            </a>
        </div>
        <div class="box-inner watched">
            <a href="http://www.cgv.co.kr/user/movielog/watched.aspx" title="내가 본 영화">
                <h3>내가 본 영화</h3>
                <span>관람한 영화들을 한번에 <br />모아 보고 싶다면?</span>
            </a>
        </div>
        <div class="box-inner mvdiary">
            <a href="http://www.cgv.co.kr/movies/point/my-list.aspx" title="내가 쓴 평점">
                <h3>내가 쓴 평점</h3>
                <span>관람 후 내 감상평을 적어 <br />추억하고 싶다면?</span>
            </a>
        </div>


       
    </div>
</div>
<div class="tit-mycgv">
	<h3>MY 예매내역</h3>
	<p><em>0건</em> <a href="/user/mycgv/reserve/">예매내역 더보기</a></p>
	<span>예매번호로만 티켓을 찾을 수 있으니 반드시 확인 부탁드립니다.</span>
</div>

<form name="aspnetForm" method="post" action="./" id="aspnetForm">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTc0NzIwMTk3M2RkGpTZbHfO8pvW/Ta9En5loRX6E2E=" />
</div>
    <!-- MY 예매내역 -->
    <input type="hidden" id="hidCancelReserveNo" name="hidCancelReserveNo" />
    <div class="sect-base-booking">
	    <div class="box-polaroid">
	        <div class="box-inner">
                
                
                    
                    <div class="lst-item">
		    	        고객님의 최근 예매내역이 존재하지 않습니다.
	    	        </div>
                    
	        </div>
	    </div>
    </div>
</form>
<!-- //MY 예매내역 -->

<!-- MY 참여이력 -->
<div class="sect-mycgv-part">
    <div class="box-polaroid type1">
      <!--  <div class="box-inner">
            <div class="tit-mycgv">
				<h3>MY 참여이벤트</h3>
				<p><em>0건</em> <a href="/user/mycgv/event/">MY 참여이벤트 더보기</a></p>
			</div>
			<div class="col-myevt">
                
                    <ol><li>고객님의 이벤트 참여내역이 존재하지 않습니다.</li></ol>
                
			</div>
        </div>-->
        <div class="box-inner">
            <div class="tit-mycgv">
				<h3>MY Q&amp;A</h3>
				<p><em>0건</em> <a href="/user/mycgv/inquiry/qna/list.aspx">MY Q&amp;A 더보기</a></p>
			</div>
			<div class="col-myqna">
                
                    <ul><li>고객님의 1:1 문의내역이 존재하지 않습니다.</li></ul>
                
			</div>
        </div>
    </div>
</div>
<!-- //MY 참여이력 -->
<!-- MY 구매정보 -->
<!-- 비노출 처리 : 20211013
<div class="sect-mycgv-buying">
    <div class="box-polaroid">
        <div class="box-inner">
		    <div class="tit-mycgv">
		        <h3>MY 구매정보</h3>
		        <span>현재 사용하실 수 있는 쿠폰정보입니다. 상품명을 클릭하시면 내역조회페이지로 이동합니다.</span>
		    </div>
		    <ul>
		        <li class="booth">
		            <a href="/user/mycgv/popcorn-store/default.aspx"><strong>내 기프트콘</strong></a>
		            <span><em>0</em> 개</span>
		        </li>		      
		        <li class="funcon">
		            <a href="/user/mycgv/culture-shop/fun-con.aspx"><strong>FUN-CON 기프트콘</strong></a>
		            <span><em></em>준비중</span>
		        </li>
		        <li class="collage">
		            <a href="/user/mycgv/culture-shop/movie-collage-passcard/"><strong>무비꼴라쥬 패스카드</strong></a>
		            <span><em>0</em> 개</span>
		        </li>
		    </ul>
		</div>
    </div>
</div>
//-->
<form name="targetform" id="targetform" method="post" novalidate="novalidate">
	<input type="hidden" name="reverse_no" id="reverse_no" />
</form>


	</div>
</div>
<script id="temp_view_usergrade" type="text/x-jquery-tmpl">

<div class="popwrap" style="width:330px;margin-top:-500px;margin-left:-165px">

						<h1>VIP 등급 이력</h1>
						<div class="pop-contents">
						<!-- Contents Addon -->
							<div class="sect-my-grade">
								<p><strong>김재현</strong> 고객님의 연도별 고객 등급 이력입니다.</p>
								<div class="grade-lst-light scrollbox">
									<table summary="연도별 VIP 세부 등급 이력" id="mytable">
										<caption>VIP 등급 이력 리스트</caption>
										<colgroup>
											<col width="50%">
											<col width="*">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">승급 년/월별</th>
												<th scope="col">등급</th>
											</tr>
										</thead>
										<tbody>
											
										</tbody>
									</table>
								</div>
								<ul class="tb-desclist">
									<li>- 고객님의 등급은 당해년도 VIP 규정에 따라 부여된 등급입니다</li>
									<li>- 연속 VIP는 전년도와 등급 갱신월이 일치해야 인정됩니다<br />
									(예. 17년 4월 RVIP의 경우, 18년 4월 RVIP 갱신 시에만 2년 연속 RVIP로 인정되며, 2017년 5월 RVIP 승급 시 17년 5월에 1년 차 RVIP로 인정)</li>
									<li>- 등급이 하락된 경우 하락된 등급의 1년 차로 인정됩니다<br />
									(예. 17년 4월 SVIP의 경우 18년 4월 VVIP로 등급 하락 시 VVIP 1년 차로 인정)</li>
								</ul>

							
							</div>
						<!-- //Contents Addon -->
						</div>
						<button type="button" class="btn-close">MY 지난 등급 이력 팝업 닫기</button>
					</div>

</script>


</body>
</html>