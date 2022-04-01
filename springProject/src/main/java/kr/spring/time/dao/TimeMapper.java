package kr.spring.time.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.movie.vo.MovieVO;
import kr.spring.time.vo.TimeVO;

public interface TimeMapper {

	//2.극장등록
	//무비번호 구하기
	@Select("SELECT * FROM M_movie m WHERE m.movie_num=#{movie_num}")
	public MovieVO selectMovie2(Integer movie_num);

	//극장 등록
	@Insert("INSERT INTO M_time (time_num,theater_num,movie_num,movie_name,movie_date,movie_time) "
			+ "VALUES (M_time_seq.nextval,#{theater_num},#{movie_num},#{movie_name},#{movie_date},#{movie_time})")
	public void insertTheater2(TimeVO timeVO);

	@Select("select time_num,movie_num,t.movie_name,movie_genre,movie_pg,movie_auth,to_char(movie_date,'YYYY/MM/DD') movie_date,movie_time,movie_showtm,theater_name from m_time t JOIN m_theater h using(theater_num) JOIN m_movie USING(movie_num) where movie_date=#{movie_date} and theater_num=#{theater_num}") 
	public List<TimeVO> selectList(Map<String,Object> map);
	
	//영화시간대별 총 좌석수, 예약된 좌석, 남은 좌석 표시
	/*
	 * @Select("select movie_time, total_count, reserv_count, total_count-reserv_count rest_count FROM "
	 * +
	 * "(select movie_time, (select count(*) from m_seat where theater_num=25) total_count, count(*) reserv_count from m_reservseat r join m_time using(time_num) where theater_num=25 and movie_date='2022/04/01' group by movie_time)"
	 * ) public
	 */
	
}
