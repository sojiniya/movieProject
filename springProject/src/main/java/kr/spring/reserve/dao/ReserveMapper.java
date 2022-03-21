package kr.spring.reserve.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.reserve.vo.MovieVO;
import kr.spring.theater.vo.TheaterVO;

public interface ReserveMapper {
	@Select("select * from m_movie where movie_auth = 0")
	public List<MovieVO> selectMovieList();
	@Select("select * from m_theater")
	public List<TheaterVO> selectTheaterList();
}
