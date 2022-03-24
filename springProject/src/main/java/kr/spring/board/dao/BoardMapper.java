package kr.spring.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;

import kr.spring.board.vo.BoardVO;

public interface BoardMapper {
	//부모글
	public List<BoardVO> selectList(Map<String,Object> map); //목록 생성
	public int selectRowCount(Map<String,Object> map); //페이징 처리
	@Insert("INSERT INTO m_board (board_num,board_auth,board_title,board_content,board_uploadfile,"
		  + "board_filename,theater_choise,sel_regioncode,sel_theatercode,cate_num,mem_num) "
		  + "VALUES (m_board_seq.nextval,#{board_auth},#{board_title},"
		  + "#{board_content},#{board_uploadfile},#{board_filename},#{theater_choise},"
		  + "#{sel_regioncode},#{sel_theatercode},#{cate_num},#{mem_num})")
	public void insertBoard(BoardVO board); //글 작성
	public BoardVO selectBoard(Integer board_num); //상세보기
	public BoardVO beforeView(BoardVO vboard); //이전글 보기
	public BoardVO afterView(BoardVO vboard); //다음글 보기
	public void updateHit(Integer board_num); //조회수 증가
	public void updateBoard(BoardVO board); //글 수정
	public void deleteBoard(Integer board_num); //글 삭제
	public void deleteFile(Integer board_num); //글 파일 삭제
}
