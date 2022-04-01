package kr.spring.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.board.dao.BoardMapper;
import kr.spring.board.vo.BoardReplyVO;
import kr.spring.board.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public List<BoardVO> selectList(Map<String, Object> map) {
		return boardMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return boardMapper.selectRowCount(map);
	}

	@Override
	public BoardVO beforeView(BoardVO vboard) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO afterView(BoardVO vboard) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHit(Integer board_num) {
		boardMapper.updateHit(board_num);
		
	}

	@Override
	public void adminInsertBoard(BoardVO board) {
		boardMapper.adminInsertBoard(board);
		
	}

	@Override
	public BoardVO adminSelectBoard(Integer board_num) {
		return boardMapper.adminSelectBoard(board_num);
	}

	@Override
	public void adminUpdateBoard(BoardVO board) {
		System.out.println(board.toString());
		boardMapper.adminUpdateBoard(board);
		
	}

	@Override
	public void adminDeleteBoard(Integer board_num) {
		//댓글이 존재하면 댓글 우선 삭제 후 부모글 삭제
		boardMapper.deleteReplyByBoardNum(board_num);
		boardMapper.adminDeleteBoard(board_num);
	}

	/*
	 * @Override public void adminDeleteFile(Integer board_num) {
	 * boardMapper.adminDeleteFile(board_num);
	 * 
	 * }
	 */

	@Override
	public void insertBoard(BoardVO board) {
		boardMapper.insertBoard(board);

	}

	@Override
	public BoardVO selectBoard(Integer board_num) {
		return boardMapper.selectBoard(board_num);
	}

	@Override
	public void updateBoard(BoardVO board) {
		boardMapper.updateBoard(board);
		
	}
	@Override
	public List<BoardVO> selectListBy5(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.selectListBy5(map);
	}
	/*
	 * @Override public void deleteBoard(Integer board_num) { // TODO Auto-generated
	 * method stub
	 * 
	 * }
	 * 
	 * @Override public void deleteFile(Integer board_num) { // TODO Auto-generated
	 * method stub
	 * 
	 * }
	 */

	
	
	//댓글 부분
	@Override
	public List<BoardReplyVO> selectListReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectRowCountReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardReplyVO selectReply(Integer re_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertReply(BoardReplyVO boardReply) {
		boardMapper.insertReply(boardReply);
		
	}

	@Override
	public void updateReply(BoardReplyVO boardReply) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteReply(Integer re_num) {
		// TODO Auto-generated method stub
		
	}

	
}
