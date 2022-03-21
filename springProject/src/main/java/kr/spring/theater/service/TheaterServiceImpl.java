package kr.spring.theater.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.theater.dao.TheaterMapper;
import kr.spring.theater.vo.TheaterVO;
import kr.spring.time.vo.TimeVO;

@Service
public class TheaterServiceImpl implements TheaterService{
	
	@Autowired
	private TheaterMapper theaterMapper;
	
	@Override
	public List<TheaterVO> selectList(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectRowCount(Map<String, String> map) {
		
		return 0;
	}

	@Override
	public void insertTheater(TheaterVO theater) {
		theaterMapper.insertTheater(theater);
	}

}
