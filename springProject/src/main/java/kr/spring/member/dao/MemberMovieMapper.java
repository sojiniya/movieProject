package kr.spring.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.movie.vo.MovieReviewVO;
import kr.spring.movie.vo.MovieVO;
import kr.spring.reserve.vo.ReserveVO;

public interface MemberMovieMapper {
	

		//내가 본 영화 리스트 카운트
		public int selectMyWatchedMovieCount(Map<String,Object> map);
		
		//내가 본 영화 리스트
		public List<ReserveVO> selectMyWatchedMovie(Map<String,Object> map);
		
		//내가 예매한 영화 리스트 카운트
		public int selectMyReserveMovieCount(Map<String,Object> map);
		
		//내가 예매한 영화 리스트
		public List<ReserveVO> selectMyReserveMovie(Map<String,Object> map);
		
		//내가 관심 있는 영화 리스트 카운트
		@Select("SELECT COUNT(*) FROM My_Movie my JOIN M_movie m ON my.movie_num = m.movie_num WHERE mem_num = #{mem_num}")
		public int selectMyInterestedMovieCount(Map<String,Object> map);
		
		//내가 관심 있는 영화 리스트
		public List<MovieVO> selectMyInterestedMovie(Map<String,Object> map);
		
		//리뷰 평가 reveiw num 구하기
		
		
		//리뷰 평가 입력하기
		public void insertReview(MovieReviewVO review);
		
		//리뷰평가 계산하기
		
		//내가 리뷰 평가 한 리스트
		public List<MovieReviewVO> selectMyReviewList(Map<String,Object> map);
		
		//내가 리뷰 평가한 리스트 카운트
		@Select("SELECT COUNT(*) FROM M_review r JOIN M_moive m ON r.movie_num = m.movie_num WHERE mem_num = #{mem_num}")
		public int selectMyReviewListCount(Map<String,Object> map);
		
		//매너 리뷰 수정하기
		
		
}
