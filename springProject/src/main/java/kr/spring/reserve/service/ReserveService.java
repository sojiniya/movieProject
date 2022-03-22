package kr.spring.reserve.service;

import java.util.List;
import java.util.Map;


import kr.spring.movie.vo.MovieVO;
import kr.spring.theater.vo.TheaterVO;

public interface ReserveService {

	public List<MovieVO> selectMovieList();
	public List<TheaterVO> selectTheaterList();
	public MovieVO pickmoviedetail(Integer movie_num);
	public List<TheaterVO> pickmoviedetal_get_theater_local(Integer movie_num);
}
