package kr.spring.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.member.dao.MemberMovieMapper;
import kr.spring.member.vo.MyReviewVO;
import kr.spring.movie.vo.MovieVO;
import kr.spring.reserve.vo.ReserveVO;

@Service
public class MemberMovieServiceImpl implements MemberMovieService{

	@Autowired
	private MemberMovieMapper MemberMovieMapper;
	
	@Override
	public int selectMyWatchedMovieCount(Map<String, Object> map) {
		return MemberMovieMapper.selectMyWatchedMovieCount(map);
	}

	@Override
	public List<ReserveVO> selectMyWatchedMovie(Map<String, Object> map) {
		return MemberMovieMapper.selectMyWatchedMovie(map);
	}

	@Override
	public int selectMyReserveMovieCount(Map<String, Object> map) {
		return MemberMovieMapper.selectMyReserveMovieCount(map);
	}

	@Override
	public List<ReserveVO> selectMyReserveMovie(Map<String, Object> map) {
		return MemberMovieMapper.selectMyReserveMovie(map);
	}

	@Override
	public int selectMyInterestedMovieCount(Map<String, Object> map) {
		return MemberMovieMapper.selectMyInterestedMovieCount(map);
	}

	@Override
	public List<MovieVO> selectMyInterestedMovie(Map<String, Object> map) {
		return MemberMovieMapper.selectMyInterestedMovie(map);
	}

	@Override
	public int selectMyReviewListCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MyReviewVO> selectMyReviewList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertReview(MyReviewVO review) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int selectAdminReserveMovieListCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReserveVO> selectAdminReserveMovieList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
