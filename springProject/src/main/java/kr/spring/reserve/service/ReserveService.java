package kr.spring.reserve.service;

import java.util.List;
import java.util.Map;

import kr.spring.reserve.vo.MovieVO;

public interface ReserveService {
	public List<MovieVO> selectMovieList();
}
