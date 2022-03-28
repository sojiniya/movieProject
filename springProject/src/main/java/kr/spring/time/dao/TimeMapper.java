package kr.spring.time.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.movie.vo.MovieVO;
import kr.spring.time.vo.TimeVO;

public interface TimeMapper {
	//1.목록 : 리스트
	@Select("SELECT * FROM M_time")
	public List<TimeVO> selectList(TimeVO timeVO);
	
	//2.극장등록
	@Insert("INSERT INTO M_movie (movie_num,movie_name,movie_genre,movie_auth,movie_pg,movie_date,movie_time) "
			+ "VALUES (M_movie_seq.nextval,#{movie_name},#{movie_genre},#{movie_auth},#{movie_pg},#{movie_date},#{movie_time})")
	public void insertTheater2(TimeVO timeVO);
}
