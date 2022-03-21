package kr.spring.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.board.dao.BoardMapper;
import kr.spring.board.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper boardMapper;

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
		boardMapper.insertBoard(board);
		
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
