<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<!-- 메인 시작 -->
<div class="page-main">
	<div class="contents">

		<div class="video_wrap">

			<video autoplay muted>
				<source
					src='https://adimg.cgv.co.kr/images/202203/Stellar/Stellar_1080x608.mp4'
					type='video/mp4'>
				이 브라우저는 Video 태그를 지원하지 않습니다. (Your browser does not support the
				video tag.)
			</video>
			<div class="video_text">
				<strong id="AD_movie_name" class="movieSelection_title">스텔라</strong><br>
				<span id="AD_movie_sub" class="movieSelection_txt">최대시속 50KM,
					자율주행차?!<br>본격 버라이어티 코미디
				</span>
				<div class="movieSelection_video_controller_wrap">
					<a
						href="http://ad.cgv.co.kr/click/CGV/CGV_201401/main@MovieSelection2021?ads_id%3d46812%26creative_id%3d66312%26click_id%3d86631%26maid%3D%26event%3d"
						id="AD_movie_url" class="btn_detail">상세보기</a>
				</div>
			</div>
		</div>
		<div class="movieChart_wrap">
			<h2>주간 박스오피스 순위</h2>
			<a href="${pageContext.request.contextPath}/movie/movieChart.do"
				id="btn_allView_Movie" class="btn_allView">전체보기</a>
		</div>
		<div id="movie_api">
			<script>
            $.ajax({
                url : 'https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=6abbc96e3be813fe944d7bfe0ddb7f4b&targetDt=20220319',
                type : 'get',             
                success : function(res){
                    let str = '<ul><li><img src="https://movie-phinf.pstatic.net/20220228_168/1646014473355hG4fW_JPEG/movie_image.jpg"></li><li><img src="https://movie-phinf.pstatic.net/20220210_27/16444726389021AWu6_JPEG/movie_image.jpg"></li><li><img src="https://movie-phinf.pstatic.net/20220214_120/1644825641315cvVKI_JPEG/movie_image.jpg"></li><li><img src="https://movie-phinf.pstatic.net/20220317_93/1647485368141aGptp_JPEG/movie_image.jpg"></li><li><img src="https://movie-phinf.pstatic.net/20220217_242/1645084631470w6PTw_JPEG/movie_image.jpg"></li><br><div class="movie_info"><li>'
                    for(let i=0;i<=4;i++){
                        let weeklyMovie = res.boxOfficeResult.weeklyBoxOfficeList[i]
                        str += '<li><p class="movie_rank">'+weeklyMovie.rank+'</p><br>'                  
                        str += '<strong class="movie_name">'+weeklyMovie.movieNm+'</strong><br>'
                        str += '<p>'+weeklyMovie.openDt+'</p><br>'
                        str += '<p>'+weeklyMovie.audiAcc+'</p>'
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
		</div>
	</div>
</div>
<!-- 메인 끝 -->