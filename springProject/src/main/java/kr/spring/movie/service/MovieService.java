package kr.spring.movie.service;

import java.util.List;
import java.util.Map;

import kr.spring.movie.vo.MovieVO;

public interface MovieService {
	public List<MovieVO> selectList(Map<String,Object> map); //목록 생성
	public int selectRowCount(Map<String,Object> map); //페이징 처리
	public void insertMovie(MovieVO movie); //글 작성
	public MovieVO selectMovie(Integer movie_num); //상세보기
	public MovieVO beforeView(MovieVO vmovie); //이전글 보기
	public MovieVO afterView(MovieVO vmovie); //다음글 보기
	public void updateMovie(MovieVO movie); //글 수정
	public void deleteMovie(Integer movie_num); //글 삭제
	public void deleteFile(Integer movie_num); //글 파일 삭제
	
	//public void insertTheater(MovieVO movie); //극장등록
}
