package kr.spring.movie.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.movie.vo.MovieVO;



public interface MovieMapper {
	//부모글
	public List<MovieVO> selectList(Map<String,Object> map); //목록 생성
	public int selectRowCount(Map<String,Object> map); //페이징 처리
	@Insert("INSERT INTO M_movie (movie_num,movie_name,movie_content,uploadfile,filename,movie_genre,movie_auth,movie_pg) "
			+ "VALUES (M_movie_seq.nextval,#{movie_name},#{movie_content},#{uploadfile},#{filename},#{movie_genre},#{movie_auth},#{movie_pg})")
	public void insertMovie(MovieVO movie); //글 작성
	@Select("SELECT * FROM M_movie m WHERE m.movie_num=#{movie_num}")
	public MovieVO selectMovie(Integer movie_num); //상세보기
	public MovieVO beforeView(MovieVO vmovie); //이전글 보기
	public MovieVO afterView(MovieVO vmovie); //다음글 보기
	public void updateMovie(MovieVO movie); //글 수정
	@Delete("DELETE FROM M_movie WHERE movie_num=#{movie_num}")
	public void deleteMovie(Integer movie_num); //글 삭제
	public void deleteFile(Integer movie_num); //글 파일 삭제
	
	@Insert("INSERT INTO M_movie (movie_num,movie_name,movie_genre,movie_auth,movie_pg,movie_date,movie_time) "
			+ "VALUES (M_movie_seq.nextval,#{movie_name},#{movie_genre},#{movie_auth},#{movie_pg},#{movie_date},#{movie_time})")
	public void insertTheater(MovieVO movie); //극장 등록 - 찬미
}
