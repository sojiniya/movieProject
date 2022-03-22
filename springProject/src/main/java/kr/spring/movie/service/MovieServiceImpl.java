package kr.spring.movie.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.movie.dao.MovieMapper;
import kr.spring.movie.vo.MovieVO;

@Service
public class MovieServiceImpl implements MovieService{
	
	@Autowired
	private MovieMapper movieMapper;

	@Override
	public List<MovieVO> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertMovie(MovieVO movie) {
		movieMapper.insertMovie(movie);
		
	}

	@Override
	public MovieVO selectMovie(Integer movie_num) {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMovie(Integer movie_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFile(Integer movie_num) {
		// TODO Auto-generated method stub
		
	}

}
	
