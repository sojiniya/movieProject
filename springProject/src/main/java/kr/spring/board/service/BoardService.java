package kr.spring.board.service;

import java.util.List;
import java.util.Map;

import kr.spring.board.vo.BoardVO;

public interface BoardService {
	public List<BoardVO> selectList(Map<String,Object> map); //목록 생성
	public int selectRowCount(Map<String,Object> map); //페이징 처리
	public void insertBoard(BoardVO board); //글 작성
	public BoardVO selectBoard(Integer board_num); //상세보기
	public BoardVO beforeView(BoardVO vboard); //이전글 보기
	public BoardVO afterView(BoardVO vboard); //다음글 보기
	public void updateHit(Integer board_num); //조회수 증가
	public void updateBoard(BoardVO board); //글 수정
	public void deleteBoard(Integer board_num); //글 삭제
	public void deleteFile(Integer board_num); //글 파일 삭제
}
