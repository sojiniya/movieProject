package kr.spring.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.board.vo.BoardReplyVO;
import kr.spring.board.vo.BoardVO;
import kr.spring.member.vo.MemberVO;

public interface BoardMapper {
	//부모글
	public List<BoardVO> selectList(Map<String,Object> map); //목록 생성(0)
	public int selectRowCount(Map<String,Object> map); //페이징 처리(0)
	public BoardVO beforeView(BoardVO vboard); //이전글 보기
	public BoardVO afterView(BoardVO vboard); //다음글 보기
	public void updateHit(Integer board_num); //조회수 증가(0)
	
	//관리자 부분
	public void adminInsertBoard(BoardVO board); //관리자 글 작성(0)
	
	public BoardVO adminSelectBoard(Integer board_num); //관리자 상세보기(0)
	public void adminUpdateBoard(BoardVO board); //관리자 글 수정(0)
	@Delete("DELETE FROM m_board WHERE board_num=#{board_num}")
	public void adminDeleteBoard(Integer board_num); //관리자 글 삭제(0)
	@Update("UPDATE m_board SET board_uploadfile='',board_filename='' WHERE board_num=#{board_num}")
	//public void adminDeleteFile(Integer board_num); //관리자 글 파일 삭제
	//@Select("SELECT board_title,board_reg_date,board_num FROM m_board where rownum <6 AND cate_num between '5' and '7' ORDER BY board_reg_date DESC")
	public List<BoardVO> selectListBy5(Map<String,Object> map); //고객센터 메인 뉴스 보기(0)
	
	
	//회원부분
	public void insertBoard(BoardVO board); //회원 글 작성(0)
	@Select("SELECT * FROM m_board b JOIN m_member m "
			 + "ON b.mem_num=m.mem_num LEFT JOIN m_category c on b.cate_num=c.cate_num"
			 + " WHERE b.board_num=#{board_num}")
	public BoardVO selectBoard(Integer board_num); //회원글 상세보기(0)
	public void updateBoard(BoardVO board); //회원 글 수정(0)
	//public void deleteBoard(Integer board_num); //회원 글 삭제
	//public void deleteFile(Integer board_num); //회원 글 파일 삭제
	
	//댓글
	public List<BoardReplyVO> selectListReply(Map<String,Object> map); //필요없을듯
	public int selectRowCountReply(Map<String,Object> map);
	public BoardReplyVO selectReply(Integer re_num);
	@Insert("INSERT INTO m_reply (reply_num,re_content,"
			+ "board_num,mem_num) VALUES (m_reply_seq.nextval,"
			+ "#{re_content},#{board_num},#{mem_num})")
	public void insertReply(BoardReplyVO boardReply);
	public void updateReply(BoardReplyVO boardReply);
	public void deleteReply(Integer re_num);
	//부모글 삭제시 댓글이 존재하면 부모글 삭제전 댓글 삭제
	public void deleteReplyByBoardNum(Integer board_num);
}
