package kr.spring.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
		@Select("SELECT M_review_seq.nextval FROM dual")
		public int selectReview_num();
		
		//리뷰 평가 입력하기
		@Insert("INSERT INTO M_review(review_num,review_content,reveiw_reg_date,review_num,movie_num,mem_num) VALUES(#{review_num},#{review_content},#{SYSDATE},#{reveiw_num},#{movie_num},#{mem_num})")
		public void insertReview(MovieReviewVO review);
		
		//리뷰평가 계산한 후에 무비에 업데이트 하기
		@Update("UPDATE m_movie SET movie_rate = #{total_rate}")
		public void updateMovieRate(MovieReviewVO review);
		
		//리뷰평가 총 카운트 계산하기
		@Select("SELECT SUM(review_rate)/moviecount(*) FROM M_review having movie_num = #{movie_num}")
		public int countTotalMovieRate(MovieReviewVO review);
		
		//리뷰평가 총 평점 계산하기
		public int sumTotalMovieRate(MovieReviewVO review);
		
		//내가 리뷰 평가한 리스트 카운트
		@Select("SELECT COUNT(*) FROM M_review r JOIN M_movie m ON r.movie_num = m.movie_num WHERE mem_num = #{mem_num}")
		public int selectMyReviewListCount(Map<String,Object> map);
		
		//내가 리뷰 평가 한 리스트
		public List<MovieReviewVO> selectMyReviewList(Map<String,Object> map);
		
		//리뷰 수정하기
		public void updateMyReview(MovieReviewVO review);
		
		//리뷰 삭제하기
		public void deleteMyReview(MovieReviewVO review);
		
}
