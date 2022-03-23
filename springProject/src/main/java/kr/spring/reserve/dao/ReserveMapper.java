package kr.spring.reserve.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.movie.vo.MovieVO;
import kr.spring.reserve.vo.ReserveVO;
import kr.spring.theater.vo.TheaterVO;
import kr.spring.time.vo.TimeVO;

public interface ReserveMapper {
	// 예매하기 1단계
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
	@Select("select distinct movie_date,time_num from m_time where theater_num = #{theater_num} and movie_num = #{movie_num} order by movie_date")
	public List<TimeVO> pickmoviedetail_get_date(Map<String,Object> map);
	@Select("select distinct time_num,movie_time from m_time where theater_num = #{theater_num} and movie_num = #{movie_num} and movie_date =#{movie_date}")
	public List<TimeVO> pickmoviedetail_get_time(Map<String,Object> map);
	
	// 예매하기 2단계
	@Select("select * from m_theater where theater_num = #{theater_num}")
	public TheaterVO picktheaterdetail(Integer theater_num);
	@Select("select * from m_time where time_num = #{time_num}")
	public TimeVO picktimedetail(Integer time_num);
	@Select("select s.seat_num,s.theater_num,s.seat_name,t.time_num,t.movie_num,t.movie_date,t.movie_time,rs.revseat_num,rs.time_num reserve_time_num,rs.seat_num reserve_seat_num from m_seat s join m_time t on s.theater_num = t.theater_num left outer join m_reservseat rs on s.seat_num = rs.seat_num where t.time_num = #{time_num} order by seat_name")
	public List<ReserveVO> seatlist(Integer time_num);
}
