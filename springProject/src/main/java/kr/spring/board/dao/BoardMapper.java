package kr.spring.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;

import kr.spring.board.vo.BoardVO;
import kr.spring.member.vo.MemberVO;

public interface BoardMapper {
	//부모글
	public List<BoardVO> selectList(Map<String,Object> map); //목록 생성
	public int selectRowCount(Map<String,Object> map); //페이징 처리
	public BoardVO beforeView(BoardVO vboard); //이전글 보기
	public BoardVO afterView(BoardVO vboard); //다음글 보기
	public void updateHit(Integer board_num); //조회수 증가
	@Insert("INSERT INTO M_category (cate_num,cate_name,board_num) VALUES (M_category_sql.nextval,#{cate_name},#{board_num}")
	public void insertCate(BoardVO board);
	
	//관리자 부분
	@Insert("INSERT INTO M_board (board_num,board_auth,theater_choise,sel_regioncode,sel_theatercode,board_title,board_content,board_uploadfile,"
			  + "board_filename,mem_num) VALUES (M_board_seq.nextval,#{board_auth},#{theater_choise},#{sel_regioncode},#{sel_theatercode},"
			  + "#{board_title},#{board_content},#{board_uploadfile},#{board_filename},#{mem_num})")
	public void adminInsertBoard(BoardVO board); //관리자 글 작성
	public BoardVO adminSelectBoard(Integer board_num); //관리자 상세보기
	public void adminUpdateBoard(BoardVO board); //관리자 글 수정
	public void adminDeleteBoard(Integer board_num); //관리자 글 삭제
	public void adminDeleteFile(Integer board_num); //관리자 글 파일 삭제
	//회원부분
	@Insert("INSERT INTO M_board (board_num,board_auth,sel_regioncode,sel_theatercode,board_title,board_content,board_uploadfile,"
			  + "board_filename,mem_num) VALUES (M_board_seq.nextval,3,#{sel_regioncode},#{sel_theatercode},"
			  + "#{board_title},#{board_content},#{board_uploadfile},#{board_filename},#{mem_num})")
	public void insertBoard(BoardVO board); //회원 글 작성
	public BoardVO selectBoard(Integer board_num); //회원글 상세보기
	public void updateBoard(BoardVO board); //회원 글 수정
	public void deleteBoard(Integer board_num); //회원 글 삭제
	public void deleteFile(Integer board_num); //회원 글 파일 삭제
}
