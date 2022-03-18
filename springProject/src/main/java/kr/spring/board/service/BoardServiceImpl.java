package kr.spring.board.service;

import java.util.List;
import java.util.Map;

import kr.spring.board.vo.BoardVO;

public class BoardServiceImpl implements BoardService{

	@Override
	public List<BoardVO> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertBoard(BoardVO board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardVO selectBoard(Integer board_num) {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateBoard(BoardVO board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(Integer board_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFile(Integer board_num) {
		// TODO Auto-generated method stub
		
	}

}
