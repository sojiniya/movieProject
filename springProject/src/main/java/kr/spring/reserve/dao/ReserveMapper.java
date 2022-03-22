package kr.spring.reserve.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.movie.vo.MovieVO;
import kr.spring.theater.vo.TheaterVO;
import kr.spring.time.vo.TimeVO;

public interface ReserveMapper {
	@Select("select * from m_movie where movie_auth = 0")
	public List<MovieVO> selectMovieList();
	@Select("select * from m_theater")
	public List<TheaterVO> selectTheaterList();
	@Select("select * from m_movie where movie_num = #{movie_num}")
	public MovieVO pickmoviedetail(Integer movie_num);
	@Select("select theater_local from m_movie movie join m_time time on time.movie_num=movie.movie_num join m_theater theater on time.theater_num = theater.theater_num where movie.movie_num=#{movie_num} group by theater.theater_local")
	public List<TheaterVO> pickmoviedetail_get_theater_local(Integer movie_num);
	@Select("select count(theater_local) from m_movie movie join m_time time on time.movie_num=movie.movie_num join m_theater theater on time.theater_num = theater.theater_num where movie.movie_num=#{movie_num} group by theater.theater_local")
	public List<Integer> pickmoviedetail_get_theater_localcount(Integer movie_num);
	@Select("select distinct theater.theater_num,theater.theater_name from m_movie movie join m_time time on time.movie_num=movie.movie_num join m_theater theater on time.theater_num = theater.theater_num where movie.movie_num=#{movie_num} and theater.theater_local=#{theater_local}")
	public List<TheaterVO> pickmoviedetail_get_theater_cgv(Map<String,Object> map);
	@Select("select movie_date from m_time where theater_num = #{theater_num} and movie_num = #{movie_num}")
	public List<TimeVO> pickmoviedetail_get_date(Map<String,Object> map);
}
