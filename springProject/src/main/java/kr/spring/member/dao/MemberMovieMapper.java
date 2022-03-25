package kr.spring.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.member.vo.MyReviewVO;
import kr.spring.reserve.vo.ReserveVO;

public interface MemberMovieMapper {
	

		//내가 본 영화 리스트 카운트
		public int selectMyWatchedMovieCount(Map<String,Object> map);
		
		//내가 본 영화 리스트
		public List<ReserveVO> selectMyWatchedMovie(Map<String,Object> map);
		
		//내가 예매한 영화 리스트 카운트
		@Select("SELECT ")
		public int selectMyReserveMovieCount(Map<String,Object> map);
		
		//내가 예매한 영화 리스트
		public List<ReserveVO> selectMyReserveMovie(Map<String,Object> map);
		
		//내가 관심 있는 영화 리스트 카운트
		public int selectMyInterestedMovieCount(Map<String,Object> map);
		
		//내가 관심 있는 영화 리스트
		public List<ReserveVO> selectMyInterestedMovie(Map<String,Object> map);
		
		//내가 매너 평가한 리스트 카운트
		public int selectMyReviewListCount(Map<String,Object> map);
		
		//내가 매너 평가 한 리스트
		public List<MyReviewVO> selectMyReviewList(Map<String,Object> map);
		
		//매너 평가 입력하기
		public void insertReview(MyReviewVO review);
		
		//관리자 예매내역 카운트
		public int selectAdminReserveMovieListCount(Map<String,Object> map);
		
		//관리자 예매내역 리스트
		public List<ReserveVO> selectAdminReserveMovieList(Map<String,Object> map);
		
		
		
}