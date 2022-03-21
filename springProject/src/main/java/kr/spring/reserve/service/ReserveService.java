package kr.spring.reserve.service;

import java.util.List;
import java.util.Map;

import kr.spring.reserve.vo.MovieVO;
import kr.spring.theater.vo.TheaterVO;

public interface ReserveService {
	public List<MovieVO> selectMovieList();
	public List<TheaterVO> selectTheaterList();
}
