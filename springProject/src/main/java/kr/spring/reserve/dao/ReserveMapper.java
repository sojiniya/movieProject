package kr.spring.reserve.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.movie.vo.MovieVO;
import kr.spring.theater.vo.TheaterVO;

public interface ReserveMapper {
	@Select("select * from m_movie where movie_auth = 0")
	public List<MovieVO> selectMovieList();
	@Select("select * from m_theater")
	public List<TheaterVO> selectTheaterList();
	@Select("select * from m_movie where movie_num = #{movie_num}")
	public MovieVO pickmoviedetail(Integer movie_num);
	@Select("select theater_local from m_movie movie join m_time time on time.movie_num=movie.movie_num join m_theater theater on time.theater_num = theater.theater_num where movie.movie_num=#{movie_num} group by theater.theater_local")
	public List<TheaterVO> pickmoviedetal_get_theater_local(Integer movie_num);
}
