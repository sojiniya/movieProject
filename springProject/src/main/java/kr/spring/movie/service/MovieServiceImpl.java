package kr.spring.movie.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.movie.dao.MovieMapper;
import kr.spring.movie.vo.MovieReviewVO;
import kr.spring.movie.vo.MovieVO;

@Service
public class MovieServiceImpl implements MovieService{
	
	@Autowired
	private MovieMapper movieMapper;

	@Override
	public List<MovieVO> selectList(Map<String, Object> map) {
		return movieMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return movieMapper.selectRowCount(map);
	}

	@Override
	public void insertMovie(MovieVO movie) {
		movieMapper.insertMovie(movie);
		
	}

	@Override
	public MovieVO selectMovie(Integer movie_num) {
		return movieMapper.selectMovie(movie_num);
	}

	@Override
	public MovieVO beforeView(MovieVO vmovie) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MovieVO afterView(MovieVO vmovie) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMovie(MovieVO movie) {
		movieMapper.updateMovie(movie);
		
	}

	@Override
	public void deleteMovie(Integer movie_num) {
		movieMapper.deleteMovie(movie_num);
		movieMapper.deleteReviewByMovieNum(movie_num);
	}

	@Override
	public void deleteFile(Integer movie_num) {
		movieMapper.deleteFile(movie_num);
		
	}
	

	@Override
	public List<MovieReviewVO> selectListReview(Map<String, Object> map) {
		return movieMapper.selectListReview(map);
	}

	@Override
	public int selectRowCountReview(Map<String, Object> map) {
		return movieMapper.selectRowCountReview(map);
	}

	@Override
	public MovieReviewVO selectReview(Integer review_num) {
		return movieMapper.selectReview(review_num);
	}

	@Override
	public void insertReview(MovieReviewVO movieReview) {
		movieMapper.insertReview(movieReview);
	}

	@Override
	public void updateReview(MovieReviewVO movieReview) {
		movieMapper.updateReview(movieReview);
	}

	@Override
	public void deleteReview(Integer review_num) {
		movieMapper.deleteReview(review_num);
	}


	/*
	 * @Override public void insertTheater(MovieVO movie) {
	 * movieMapper.insertTheater(movie); }
	 */

}
	
