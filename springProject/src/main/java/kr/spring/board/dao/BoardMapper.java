package kr.spring.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;

import kr.spring.board.vo.BoardVO;

public interface BoardMapper {
	//부모글
	public List<BoardVO> selectList(Map<String,Object> map); //목록 생성
	public int selectRowCount(Map<String,Object> map); //페이징 처리
	@Insert("INSERT INTO spboard (board_num,title,content,uploadfile,"
		  + "filename,cate_num,mem_num) VALUES (M_board_seq.nextval,#{title},"
		  + "#{content},#{uploadfile},#{filename},#{cate_num},#{mem_num})")
	public void insertBoard(BoardVO board); //글 작성
	public BoardVO selectBoard(Integer board_num); //상세보기
	public BoardVO beforeView(BoardVO vboard); //이전글 보기
	public BoardVO afterView(BoardVO vboard); //다음글 보기
	public void updateHit(Integer board_num); //조회수 증가
	public void updateBoard(BoardVO board); //글 수정
	public void deleteBoard(Integer board_num); //글 삭제
	public void deleteFile(Integer board_num); //글 파일 삭제
}
