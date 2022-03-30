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

	@Select("select time_num,t.movie_name,to_char(movie_date,'YYYY/MM/DD') movie_date,movie_time,theater_name from m_time t JOIN m_theater h using(theater_num) JOIN m_movie USING(movie_num) where movie_date=#{movie_date} and theater_num=#{theater_num}") 
	public List<TimeVO> selectList(Map<String,Object> map);

}
