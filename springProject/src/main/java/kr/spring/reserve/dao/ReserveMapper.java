package kr.spring.reserve.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.movie.vo.MovieVO;
import kr.spring.reserve.vo.ReserveVO;
import kr.spring.reserve.vo.ReserveseatVO;
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
	@Select("select distinct movie_date from m_time where theater_num = #{theater_num} and movie_num = #{movie_num} order by movie_date")
	public List<TimeVO> pickmoviedetail_get_date(Map<String,Object> map);
	@Select("select distinct time_num,movie_time from m_time where theater_num = #{theater_num} and movie_num = #{movie_num} and movie_date =#{movie_date}")
	public List<TimeVO> pickmoviedetail_get_time(Map<String,Object> map);
	
	// 예매하기 2단계
	@Select("select * from m_theater where theater_num = #{theater_num}")
	public TheaterVO picktheaterdetail(Integer theater_num);
	@Select("select * from m_time where time_num = #{time_num}")
	public TimeVO picktimedetail(Integer time_num);
	@Select("select * from m_seat s join m_time t on s.theater_num = t.theater_num where time_num = #{time_num} order by s.seat_num")
	public List<ReserveVO> seatlist(Integer time_num);
	@Select("select * from m_reservseat where time_num = #{time_num} order by revseat_num")
	public List<ReserveseatVO> reservseatlist(Integer time_num);
	@Select("select count(*) from m_seat s join m_time t on s.theater_num = t.theater_num where time_num = #{time_num}")
	public int seat_total_count(Integer time_num);
	@Select("select count(*) from m_reservseat where time_num = #{time_num}")
	public int reservseat_total_count(Integer time_num);
	
	// 예매완료
	@Insert("insert into m_reservseat values(m_reservseat_seq.nextval,#{time_num},#{seat_num})")
	public void insertreserveseat(Map<String,Object> map);
	@Insert("insert into m_reserve values(m_reserve_seq.nextval,#{time_num},#{mem_num},#{movie_num},#{reserve_seat},#{reserve_paymethod},#{final_price})")
	public void insertreserve(ReserveVO reserveVO);
	
	//멤버 등급 업데이트
	@Select("SELECT count(*) FROM m_reserve WHERE mem_num = #{mem_num}")
	public int countReservation(ReserveVO reserveVO);
	@Update("UPDATE M_member_detail SET mem_grade =#{count} where mem_num =#{mem_num}")
	public void updateMemberGrade(ReserveVO reserveVO);

	// 예매취소
	@Delete("delete from m_reserve where reserve_num = #{reserve_num}")
	public void deletereserve(Map<String,Object> map);
	@Delete("delete from m_reservseat where revseat_num = #{revseat_num}")
	public void deletereservseat(Map<String,Object> map);
}
