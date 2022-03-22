package kr.spring.reserve.service;

import java.util.List;
import java.util.Map;


import kr.spring.movie.vo.MovieVO;
import kr.spring.theater.vo.TheaterVO;
import kr.spring.time.vo.TimeVO;

public interface ReserveService {

	public List<MovieVO> selectMovieList();
	public List<TheaterVO> selectTheaterList();
	public MovieVO pickmoviedetail(Integer movie_num);
	public List<TheaterVO> pickmoviedetail_get_theater_local(Integer movie_num);
	public List<Integer> pickmoviedetail_get_theater_localcount(Integer movie_num);
	public List<TheaterVO> pickmoviedetail_get_theater_cgv(Map<String,Object> map);
	public List<TimeVO> pickmoviedetail_get_date(Map<String,Object> map);
}
